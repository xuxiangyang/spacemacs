;;; funcs.el --- Java functions File for Spacemacs
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: Lukasz Klich <klich.lukasz@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(defun spacemacs//java-setup-backend ()
  "Conditionally setup java backend."
  (pcase java-backend
    ('meghanada (spacemacs//java-setup-meghanada))
    ('lsp (spacemacs//java-setup-lsp))))

(defun spacemacs//java-setup-company ()
  "Conditionally setup company based on backend."
  (when (eq java-backend 'meghanada)
    (spacemacs//java-setup-meghanada-company)))

(defun spacemacs//java-setup-dap ()
  "Conditionally setup elixir DAP integration."
  ;; currently DAP is only available using LSP
  (when (eq java-backend 'lsp)
    (spacemacs//java-setup-lsp-dap)))

(defun spacemacs//java-setup-flycheck ()
  "Conditionally setup flycheck based on backend."
  (pcase java-backend
    ('meghanada (spacemacs//java-setup-meghanada-flycheck))
    ('lsp (spacemacs//java-setup-lsp-flycheck))))

(defun spacemacs//java-setup-organize-imports ()
  "setup organize import"
  (when (eq java-backend 'lsp) (add-hook 'before-save-hook 'lsp-organize-imports)))


(defun spacemacs//java-add-semicolon ()
  "add semicolon and to to newline keybind"
  (interactive)
  (evil-force-normal-state)
  (evil-append-line 1)
  (insert ";")
  (evil-open-below 1)
)


;; meghanada

(defun spacemacs//java-setup-meghanada ()
  "Setup Meghanada."
  (require 'meghanada)
  ;; jump handler
  (add-to-list 'spacemacs-jump-handlers
               '(meghanada-jump-declaration
                 :async spacemacs//java-meghanada-server-livep))
  ;; auto-install meghanada server
  (let ((dest-jar (meghanada--locate-server-jar)))
    (unless dest-jar
      (meghanada-install-server)))
  ;; enable meghanada
  (meghanada-mode))

(defun spacemacs//java-setup-meghanada-company ()
  "Setup Meghanada auto-completion."
  (meghanada-company-enable))

(defun spacemacs//java-setup-meghanada-flycheck ()
  "Setup Meghanada syntax checking."
  (when (spacemacs/enable-flycheck 'java-mode)
    (require 'flycheck-meghanada)
    (add-to-list 'flycheck-checkers 'meghanada)
    (flycheck-mode)))

(defun spacemacs//java-meghanada-server-livep ()
  "Return non-nil if the Meghanada server is up."
  (and meghanada--client-process (process-live-p meghanada--client-process)))


;; Maven

(defun spacemacs/mvn-clean-compile ()
  "Recompile using maven."
  (interactive)
  (mvn-clean)
  (mvn-compile))


;; Misc

(defun spacemacs//java-delete-horizontal-space ()
  (when (s-matches? (rx (+ (not space)))
                    (buffer-substring (line-beginning-position) (point)))
    (delete-horizontal-space t)))


;; LSP Java

(defun spacemacs//java-setup-lsp ()
  "Setup LSP Java."
  (if (configuration-layer/layer-used-p 'lsp)
      (progn
        (require 'lsp-java)
        (lsp-deferred))
    (message "`lsp' layer is not installed, please add `lsp' layer to your dotfile.")))

(defun spacemacs//java-setup-lsp-dap ()
  "Setup DAP integration."
  (require 'dap-java)
  (spacemacs/set-leader-keys-for-major-mode 'java-mode
    ;; debug
    "ddj" 'dap-java-debug
    "dtt" 'dap-java-debug-test-method
    "dtc" 'dap-java-debug-test-class
    ;; run
    "tt" 'dap-java-run-test-method
    "tc" 'dap-java-run-test-class))

(defun spacemacs//java-setup-lsp-flycheck ()
  "Setup LSP Java syntax checking."
  (unless (configuration-layer/layer-used-p 'lsp)
    (message "`lsp' layer is not installed, please add `lsp' layer to your dotfile.")))

(defun spacemacs/lsp-java-super-type ()
  "Show super type hierarchy."
  (interactive)
  (lsp-java-type-hierarchy 1))

(defun spacemacs/lsp-java-sub-type ()
  "Show sub type hierarchy."
  (interactive)
  (lsp-java-type-hierarchy 0))

(defun lsp-java-lombok/jar-file ()
  "Get the filename for the Lombok jar."
  (concat "lombok"
          (when lsp-java-lombok/version "-")
          lsp-java-lombok/version
          ".jar"))

(defun lsp-java-lombok/jar-path ()
  "Generate the path on disk for the Lombok jar."
  (concat (expand-file-name user-emacs-directory) ".cache/" (lsp-java-lombok/jar-file)))

(defun lsp-java-lombok/download-jar ()
  "Download the latest lombok jar for use with LSP."
  (let* ((lombok-url (url-generic-parse-url lsp-java-lombok/jar-url-base))
         (base-path (file-name-as-directory (url-filename lombok-url)))
         (file-path (concat base-path (lsp-java-lombok/jar-file))))
    (setf (url-filename lombok-url) file-path)
    (url-copy-file lombok-url (lsp-java-lombok/jar-path))))

(defun lsp-java-lombok/append-vmargs ()
  "Apply lombok args to lsp-java-vmargs."
  (setq lsp-java-vmargs
        (append lsp-java-vmargs
                (list (concat "-javaagent:" (lsp-java-lombok/jar-path))))))

(defun lsp-java-lombok/setup ()
  "Download Lombok if it hasn't been downloaded already."
  (when (not (file-exists-p (lsp-java-lombok/jar-path)))
    (message "Could not find lombok for lsp-java.  Downloading...")
    (lsp-java-lombok/download-jar)))

(defun lsp-java-lombok/init ()
  "Initialize lsp-java-lombok."
  (when lsp-java-lombok/enabled
    (lsp-java-lombok/setup)
    (lsp-java-lombok/append-vmargs)))

