
(setq backup-directory-alist '((".*" . "~/.emacs.d/backup")))
(setq version-control t)
(setq delete-old-versions t)

(setq auto-save-list-file-prefix "~/.emacs.d/autosave/")
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave/" t)))

(setq server-use-tcp t)

(menu-bar-mode -1)
(setq gc-cons-threshold 50000000)
(setq line-number-display-limit-width 10000)
(setq gnutls-min-prime-bits 4096)

;; (setq initial-scratch-message "")
;; (setq initial-major-mode 'emacs-lisp-mode)
;; (setq remember-notes-initial-major-mode 'org-mode)
;; (setq initial-buffer-choice 'remember-notes)

; Always immediately load evil mode
(evil-mode t)
(global-evil-matchit-mode t)

;; (require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)
;; (require 'ac-helm)


(add-hook 'prog-mode-hook
          (lambda ()
            (rainbow-delimiters-mode t)
            (evil-commentary-mode t)))
