;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(protobuf
     (javascript :variables
                 javascript-backend 'lsp
                 javascript-import-tool 'import-js
                 javascript-fmt-tool 'prettier
                 javascript-fmt-on-save t
                 node-add-modules-path t
                 js2-include-node-externs t
                 lsp-javascript-preferences-import-module-specifier "relative"
                 )
     (prettier)
     (import-js)
     (typescript :variables
                 typescript-backend 'lsp
                 typescript-fmt-tool 'prettier
                 typescript-fmt-on-save t
                 typescript-linter 'eslint
                 typescript-indent-level 2
                 )
     react
     (vue :variables
          )
     ;; (node :variables node-add-modules-path t)
     tern
     (html :variables
           web-mode-enable-auto-pairing t
           web-mode-enable-auto-closing t
           js2-strict-missing-semi-warning nil
           js2-missing-semi-one-line-override nil
           js-indent-level 2
           js2-basic-offset 2
           css-indent-offset 2
           web-mode-markup-indent-offset 2
           web-mode-css-indent-offset 2
           web-mode-code-indent-offset 2
           web-mode-attr-indent-offset 2
           )
     (rust :variables
           rust-format-on-save t
           )
     yaml
     nginx
     (sql :variables
          sql-capitalize-keywords t
          sql-backend nil
          sql-auto-indent nil
          sqlfmt-executable "~/.emacs.d/private/bin/sqlfmt"
          )
     (helm :variables
           helm-enable-auto-resize t
           hybrid-style-enable-hjkl-bindings t
           helm-no-header t
           helm-find-files-doc-header nil
           helm-buffer-max-length nil
           helm-buffers-fuzzy-matching t
           helm-use-fuzzy 'source
           helm-buffer-details-flag nil
           helm-ff-skip-git-ignored-files t
           helm-grep-split-line-regexp "^\\([[:lower:][:upper:]]?:?.*?\\):\\([0-9]+\\)[:-]\\(.*\\)"
           )
     smex
     (treemacs :variables
               treemacs-use-git-mode 'deferred
               treemacs-lock-width t
               treemacs-hide-gitignored-files-mode t
               treemacs-project-follow-mode t
               )
     (lsp :variables
          lsp-auto-guess-root t
          lsp-enable-semantic-highlighting t
          lsp-ui-remap-xref-keybindings t
          lsp-ui-sideline-show-symbol t
          lsp-prefer-flymake t
          lsp-enable-snippet t
          lsp-headerline-breadcrumb-enable nil
          lsp-ui-doc-enable nil
          )
     (go :variables
         godoc-at-point-function 'godoc-gogetdoc
         go-backend 'lsp
         go-format-before-save t
         gofmt-command "goimports"
         go-use-golangci-lint t
         go-tab-width 4
         go-backend 'lsp
         )
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-test-runner 'rspec
           ruby-version-manager 'rvm
           ruby-backend 'robe
           )
     ruby-on-rails
     (python :variables
             python-backend 'anaconda
             python-formatter 'yapf
             python-format-on-save t
             python-sort-imports-on-save t
             python-pipenv-activate t
             ;; python-fill-column 120
             )
     django
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-idle-delay 0
                      )
     better-defaults
     emacs-lisp
     dash
     syntax-checking
     git
     lua
     markdown
     asciidoc
     dap
     graphql
     docker
     (shell :variables
            shell-default-shell 'vterm
            shell-default-term-shell "/bin/zsh"
            shell-enable-smart-eshell t
            shell-protect-eshell-prompt nil
            spacemacs-vterm-history-file-location "~/.zsh_history"
            )
     (plantuml :variables
               plantuml-jar-path "/usr/local/Cellar/plantuml/1.2021.9/libexec/plantuml.jar"
               org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2021.9/libexec/plantuml.jar"
               plantuml-default-exec-mode 'jar
               )
     (org :variables
          org-enable-github-support t
          org-enable-hugo-support t
          org-enable-github-support t
          org-enable-notifications t
          org-wild-notifier-alert-time '(0)
          org-agenda-span 'day
          org-download-image-dir "~/org/download"
          org-enable-org-journal-support t
          org-journal-dir "~/org/journal/"
          org-enable-org-brain-support t
          alert-default-style 'notifier
          org-persp-startup-with-agenda "a"
          org-agenda-files '("~/org/notes.org")
          org-persp-startup-org-file "~/org/notes.org"
          )
     (c-c++ :variables
           c-c++-backend 'lsp-clangd
           c-c++-enable-google-style t
           c-c++-enable-auto-newline t
           c-c++-adopt-subprojects t
           )
     (java :variables
           )
     (kotlin :variables
             kotlin-backend 'lsp
             )
     (groovy :variables
             groovy-backend 'lsp
             groovy-lsp-jar-path "~/.emacs.d/private/groovy/groovy-language-server-all.jar"
             )
     eww
     (dart :variables
           dart-backend 'lsp
           lsp-enable-on-type-formatting t
           lsp-dart-sdk-dir "~/Documents/flutter_project/flutter/bin/cache/dart-sdk/"
           )
     imenu-list
     protoc
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      xclip
                                      thrift
                                      reveal-in-osx-finder
                                      exec-path-from-shell
                                      company-tabnine
                                      flycheck-projectile
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '(
                                  )
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 300
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner '001
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '()
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 1000
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ; 国内源
  ;(setq configuration-layer-elpa-archives
  ;  '(("melpa-cn" . "http://mirrors.cloud.tencent.com/elpa/melpa/")
  ;    ("org-cn"   . "http://mirrors.cloud.tencent.com/elpa/org/")
  ;    ("gnu-cn"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
  ;    ("nongnu"   . "https://elpa.nongnu.org/nongnu/")
  ;    ))
;  (setq url-proxy-services
;        '(("no_proxy" . "^\\(localhost\\|127.0.0.1\\|10.*\\)")
;          ("http" . "127.0.0.1:7890")
;          ("https" . "127.0.0.1:7890")))

  (if (daemonp)
      (progn
        (setq default-directory (concat (getenv "HOME") "/"))
        )
    )
  ;; end of user-init
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Helm配置
  (with-eval-after-load 'helm
    (define-key helm-find-files-map (kbd "/") 'helm-ff-TAB)
    )
  ;; Dired配置
  (require 'dired-x)
  (with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
    )

  ;; 禁用鼠标
  (xterm-mouse-mode -1)

  ;; 自动换行
  (global-visual-line-mode 1)

  ;; 粘贴到系统剪切版
  (xclip-mode 1)

  ;; 自动跟踪链接
  (setq vc-follow-symlinks t)

  ;; 退出时需要确认
  (setq confirm-kill-emacs 'y-or-n-p)

  ;; 去除临时文件
  (setq make-backup-files nil)
  (setq-default make-backup-files nil)
  (setq auto-save-mode nil)
  (setq auto-save-default nil)
  (setq create-lockfiles nil)

  ;; tmp fix https://github.com/syl20bnr/spacemacs/issues/16200
  (setq helm-ag-use-grep-ignore-list nil)

  ;; flycheck-projectile
  (eval-after-load 'flycheck-projectile
    '(add-to-list 'popwin:special-display-config
                  `(,flycheck-projectile-error-list-buffer
                    :regexp nil :dedicated t :position bottom :stick t
                    :noselect nil)
                  )
    )

  ;; golang
  (eval-after-load 'go-mode
    '(add-hook 'go-mode-hook
               (lambda ()
                 (push '(company-tabnine :separate company-capf) company-backends)
                 )
               )
    )
  (eval-after-load 'lsp-mode
    '(lsp-register-custom-settings
       '(
          ("gopls.allExperiments" t t)
        )
      )
    )


  ;; Ruby相关配置
  ;; 重写 https://github.com/senny/rvm.el/blob/master/rvm.el#L398，rvm 配置了BUNDLE_PATH ，会导致emacs下载的gem路径和console中的路径不一致，带来问题
  (eval-after-load "rvm"
    '(defun rvm--set-gemhome (gemhome gempath gemset)
       (if (and gemhome gempath gemset)
           (progn
             (setenv "GEM_HOME" gemhome)
             (setenv "GEM_PATH" gempath)
             (rvm--change-path 'rvm--current-gem-binary-path (rvm--gem-binary-path-from-gem-path gempath)))
         (setenv "GEM_HOME" "")
         (setenv "GEM_PATH" ""))))
  (add-hook 'enh-ruby-mode-hook
            (lambda ()
              (push '(company-tabnine :separate company-dabbrev-code company-gtags company-etags company-keywords) company-backends)
              ))

  ;; 搜索不要高亮
  (setq-default evil-ex-search-highlight-all nil)
  (setq-default evil-insert-state-cursor 'box)

  ;; 全局开启补全
  (global-company-mode)
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)


  ;; 禁止分window后自动resize
  (setq window-combination-resize nil)

  ;; smartparens 如果是在某个词前，禁止自动补全
  (eval-after-load 'smartparens
    '(progn
       (sp-pair "\"" nil :unless '(sp-point-before-word-p))
       (sp-pair "'" nil :unless '(sp-point-before-word-p))
       (sp-pair "(" nil :unless '(sp-point-before-word-p))
       (sp-pair "[" nil :unless '(sp-point-before-word-p))
       (sp-pair "{" nil :unless '(sp-point-before-word-p))
       )
    )

  ;; Evil 配置
  (define-key evil-insert-state-map (kbd "C-l") 'forward-char)
  (define-key evil-insert-state-map (kbd "C-h") 'backward-char)

  ;; LSP配置
  (with-eval-after-load 'lsp-mode
    (dolist (dir '(
                   "[/\\\\]vendor$"
                   "[/\\\\]thrift_rb$"
                   "[/\\\\]thrift_go$"
                   "[/\\\\]tmp$"

                   ))
      (push dir lsp-file-watch-ignored-directories))
    )

  ;; 处理Search模式无法正常结束 https://github.com/syl20bnr/spacemacs/issues/10410
  (defun kill-minibuffer-search ()
    (interactive)
    (when (windowp (active-minibuffer-window))
      (evil-ex-search-exit)))
  (add-hook 'mouse-leave-buffer-hook #'kill-minibuffer-search)

  ;; 小程序
  (add-to-list 'auto-mode-alist '("\\.wxml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.wxss\\'" . css-mode))
  (add-to-list 'auto-mode-alist '("\\.wpy\\'" . vue-mode))
  (add-hook 'vue-mode-hook
            (lambda ()
              (add-hook 'before-save-hook #'prettier-js nil t)))

  ;; org
  (with-eval-after-load 'org-capture
    (defun org-task-capture-template()
      "Return `org-capture' template string for Task"
      (let* ((scheduled (format-time-string "<%Y-%m-%d %H:%M>" (time-add (current-time) 7200)))
             (deadline (format-time-string "<%Y-%m-%d %H:%M>" (time-add (current-time) 86400))))
        (mapconcat #'identity
                   `(
                     "* TODO %?"
                     ,(concat "  DEADLINE: " deadline " SCHEDULED: " scheduled)
                     ,(concat "  %u")
                     )
                   "\n"
                   )))
    (add-to-list 'org-capture-templates
                 '(
                   "t"
                   "Task"
                   entry
                   (file+headline "" "Tasks")
                   (function org-task-capture-template)
                   )
                 )
    (add-to-list 'org-capture-templates
                 '(
                   "n"
                   "Note"
                   entry
                   (file+headline "" "Notes")
                   "* %^{heading} %t %^g
  %?
"
                   )
                 )
    (defun org-hugo-new-subtree-post-capture-template ()
      "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
      (let* ((title (read-from-minibuffer "Title: ")) ;Prompt to enter the post title
             (category (read-from-minibuffer "Category: "))
             (fname (org-hugo-slug title)))
        (mapconcat #'identity
                   `(
                     ,(concat "* TODO " title)
                     ":PROPERTIES:"
                     ,(concat ":EXPORT_FILE_NAME: " fname)
                     ,(concat ":EXPORT_HUGO_BUNDLE: " category)
                     ,(concat ":EXPORT_HUGO_CATEGORIES: " category)
                     ,(concat (concat ":EXPORT_HUGO_TAGS: " category) "  %?")
                     ":END:"
                     "\n")          ;Place the cursor here finally
                   "\n")))
    (add-to-list 'org-capture-templates
                 '("b"                ;`org-capture' binding + h
                   "Blog"
                   entry
                   ;; It is assumed that below file is present in `org-directory'
                   ;; and that it has a "Blog Ideas" heading. It can even be a
                   ;; symlink pointing to the actual location of notes.org!
                   (file "blog.org")
                   (function org-hugo-new-subtree-post-capture-template)))
    )

  ;; emacs 守护进程负责Notify
  (message "Emacs started")
  (if (daemonp)
      (progn
        (org-wild-notifier-mode 1)
        (message "Emacs Org Notify Started")
        (exec-path-from-shell-initialize)
        )
    )

  ;; react
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

  ;;emacs
  (helm-mode 1)

  ;;neotree
  (with-eval-after-load 'neotree
    (add-hook 'neo-after-create-hook
              #'(lambda (_)
                  (with-current-buffer (get-buffer neo-buffer-name)
                    (setq truncate-lines t)
                    (setq word-wrap nil)
                    (make-local-variable 'auto-hscroll-mode)
                    (setq auto-hscroll-mode nil))))
    )

  ;;tmpl
  (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))
  (setq web-mode-engines-alist '(
    ("go"    . "\\.tmpl\\'")
    ))

  ;; python
  (with-eval-after-load 'python-mode
    (add-hook 'python-mode ((lambda () (interactive "") )
                            add-hook 'before-save-hook #'spacemacs/python-remove-unused-imports
                            ))
    )

  ;; end of user-config
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc dash-functional tern coffee-mode stan-mode scad-mode qml-mode matlab-mode julia-mode arduino-mode thrift projectile-rails inflections feature-mode wgrep smex ivy-hydra counsel-projectile counsel swiper ivy xclip go-guru go-eldoc company-go go-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest enh-ruby-mode chruby bundler inf-ruby unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck mmm-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-lido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-timeout-seconds 0.01)
 '(evil-want-Y-yank-to-eol t)
 '(ibuffer-default-shrink-to-minimum-size t)
 '(package-selected-packages
   '(protobuf-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc dash-functional tern coffee-mode stan-mode scad-mode qml-mode matlab-mode julia-mode arduino-mode thrift projectile-rails inflections feature-mode wgrep smex ivy-hydra counsel-projectile counsel swiper ivy xclip go-guru go-eldoc company-go go-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest enh-ruby-mode chruby bundler inf-ruby unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck mmm-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-lido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(package-selected-packagess
   '(typescript-mode import-js grizzl add-node-modules-path web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode stan-mode scad-mode qml-mode matlab-mode julia-mode arduino-mode thrift projectile-rails inflections feature-mode wgrep smex ivy-hydra counsel-projectile counsel swiper ivy xclip go-guru go-eldoc company-go go-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest enh-ruby-mode chruby bundler inf-ruby unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flycheck-pos-tip pos-tip flycheck mmm-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-lido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(warning-minimum-level :error)
 '(word-wrap-by-category t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)
