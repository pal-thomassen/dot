; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun global-set-keys (key def &rest bindings)
  (while key
    (global-set-key (kbd key) def)
    (setq key (pop bindings)
          def (pop bindings))))

(defun dotspacemacs/layers ()
  (setq exec-path-from-shell-arguments '("-l"))

  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(
                                       emmet
                                       terraform
                                       ;; csharp
                                       ;; gnus
                                       auto-completion
                                       git
                                       github
                                       html
                                       javascript
                                       osx
                                       tmux
                                       react
                                       typescript
                                       themes-megapack
                                       )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    tern
                                    tern-mode
                                    smartparens
                                    evil-org-mode
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."


  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   ;; dotspacemacs-startup-banner 'official
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacesmacs-default-theme 'monokai
   dotspacemacs-themes '(
                         monokai
                         smyx
                         solarized-light
    )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes

   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 95
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 95
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)

  (setq vc-follow-symlinks t)

  ;; gpg encryption
  (require 'epa-file)
  (setq epa-file-select-keys 0)
  (setq epa-file-cache-passphrase-for-symmetric-encryption)

  (setq
   backup-directory-alist '(("." . "~/.saves"))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)
  )


;; Scale fonts
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(defun dotspacemacs/user-config ()
  "Configuration function. This function is called at the very end of Spacemacs initialization"
  (spacemacs/toggle-mode-line-version-control-off)

  ; Editing
  (global-hl-line-mode -1) ; Disable current line highlight
  (global-linum-mode t) ; Show line numbers by default
  (global-auto-revert-mode t)
  (setq indent-tabs-mode nil)
  (setq company-idle-delay 0.05
                json-encoding-default-indentation 2
                lua-indent-level 2
                evil-shift-width 2
                web-mode-markup-indent-offset 2
                web-mode-css-indent-offset 2
                typescript-indent-level 2
                css-indent-offset 2
                js-indent-level 2
                js2-basic-offset 2
                json-reformat:indent-width 2
                web-mode-code-indent-offset 2)
  (turn-off-smartparens-mode)
  (define-key evil-normal-state-map ";" 'evil-ex)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (setq evil-ex-substitute-global 1)
  (setq web-mode-enable-auto-quoting nil)

  (setq create-lockfiles nil)

  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  (global-evil-search-highlight-persist)
  (evil-search-highlight-persist 0)
  (turn-off-search-highlight-persist)

  ; Custom leader
  (evil-leader/set-key "oe" 'eval-region)
  (evil-leader/set-key "os" 'helm-google-suggest)
  (evil-leader/set-key "oa" 'helm-apropos)
  (evil-leader/set-key "oo" 'helm-occur)
  (evil-leader/set-key "oo" 'js2-mode-hide-warnings-and-errors)


  ; Helm
  (require 'helm)
  (setq projectile-switch-project-action 'helm-projectile-find-file)
  (setq projectile-switch-project-action 'helm-projectile)
  (setq helm-autoresize-mode t)
  (setq helm-apropos-fuzzy-match t)
  (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
  (setq projectile-enable-caching nil)
  (setq projectile-file-exists-remote-cache-expire (* 10 60))

  (define-key helm-find-files-map (kbd "C-r") 'helm-ff-run-rename-file)
  (define-key helm-find-files-map (kbd "C-d") 'helm-ff-run-delete-file)

  (defun my-configure-neotree()
    (define-key neotree-mode-map (kbd "o") (neotree-make-executor :dir-fn 'neo-open-dir))
    (define-key neotree-mode-map (kbd "C-l") 'windmove-right)
    )
  (add-hook 'neotree-mode-hook 'my-configure-neotree)
  )


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 2)
 '(package-selected-packages
   (quote
    (zonokai-theme zenburn-theme zen-and-art-theme ws-butler window-numbering web-mode web-beautify volatile-highlights vi-tilde-fringe underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tss yaxception log4e tronesque-theme toxi-theme terraform-mode hcl-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline powerline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rainbow-delimiters railscasts-theme purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox hydra spinner page-break-lines osx-trash orgit organic-green-theme open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme move-text monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme magit-gitflow magit-gh-pulls lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gitignore-mode github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh marshal logito pcache ht gandalf-theme flx-ido flx flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight espresso-theme emmet-mode dracula-theme django-theme define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web web-completion-data company-tern s dash-functional tern dash company-statistics company-quickhelp pos-tip company colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil monokai-theme)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
