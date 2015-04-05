(package-initialize)
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(mapc 'quelpa '(
                ac-helm
                ag
                auto-complete
                color-theme-solarized
                evil
                evil-commentary
                evil-leader
                evil-matchit
		rainbow-delimiters
                ))

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
