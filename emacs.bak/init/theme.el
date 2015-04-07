(setq frame-background-mode 'dark)
(load-theme 'solarized t)

(defun toggle-theme-dark ()
  (if (eq frame-background-mode 'dark)
      (setq frame-background-mode 'light)
    (setq frame-background-mode 'dark))
  (load-theme 'solarized t))
