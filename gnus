(setq gnus-select-method '(nnimap "imap.gmail.com"))
(setq smtpmail-default-smtp-server "smtp.gmail.com")

(setq nnimap-authinfo-file "~/.authinfo")

;; ;; Get email, and store in nnml
;; (setq gnus-secondary-select-methods
;;       '(
;;         (nnimap "gmail"
;;                 (nnimap-address "imap.gmail.com")
;;                 (nnimap-server-port 993)
;;                 (nnimap-stream ssl))
;;                 (nnimap-authinfo-file "~/.authinfo")
;;         ))

;; (setq gnus-select-method '(nnimap "imap.gmail.com"))
;; (setq smtpmail-default-smtp-server "smtp.gmail.com")

;; ;; Send email via Gmail:
;; (setq message-send-mail-function 'smtpmail-send-it)

;; (setq smtpmail-stream-type 'ssl)
;; (setq smtpmail-smtp-server "smtp.gmail.com")
;; (setq smtpmail-smtp-service 465)

;; ;; Archive outgoing email in Sent folder on imap.gmail.com:
;; (setq gnus-message-archive-method '(nnimap "imap.gmail.com")
;;       gnus-message-archive-group "[Gmail]/Sent Mail")

;; ;; store email in ~/gmail directory
(setq nnml-directory "~/gmail")
(setq message-directory "~/gmail")

(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; (setq smtpmail-auth-credentials "~/.authinfo")

;; (gnus-subscribe-hierarchically "nnimap+gmail:INBOX")
