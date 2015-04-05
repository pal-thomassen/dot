
(defun load-init-file (name)
  (load-file (concat "~/.emacs.d/init/" (symbol-name name) ".el")))

(mapc 'load-init-file '(bootstrap
			theme))

(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 2 60 2))

;keymap config
(define-key evil-normal-state-map (kbd ";") `evil-ex)
