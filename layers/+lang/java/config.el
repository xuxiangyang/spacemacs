;;; config.el --- Java configuration File for Spacemacs
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


;; variables

(spacemacs|define-jump-handlers java-mode)

(defvar java-backend (if (configuration-layer/layer-used-p 'lsp) 'lsp 'meghanada)
  "The backend to use for IDE features.
Possible values are `lsp' and `meghanada'.
If `nil' then `meghanada' is the default backend unless `lsp' layer is used.")

(defvar lsp-java-lombok/enabled t
  "Indicates the LSP server should be started with Lombok.")

(defvar lsp-java-lombok/version nil
  "When non-nil, use the specified Lombok version, otherwise use the latest.")

(defvar lsp-java-lombok/jar-url-base "https://projectlombok.org/downloads/"
  "The base path to download Lombok jars from.")

(defvar lsp-java-lombok/dir user-emacs-directory
  "The path on disk where lombok jars are saved.")
