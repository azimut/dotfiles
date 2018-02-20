; If you used option 4 above and installed your own version of the
; files and not in the site-lisp/ directory, uncomment this line and
; replace LOC below with the directory you put the files in
; (setq load-path (cons "LOC" load-path))

; I do NOT want white spaces to be highlighted
(require 'whitespace)
(global-whitespace-mode 0)

; disable menu-bar
; https://www.emacswiki.org/emacs/MenuBar
(menu-bar-mode -1)

; window resize
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

; pretty lambda
(global-prettify-symbols-mode 1)
(defun my-add-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
;;          ("->" . 8594)    ; →
          ("=>" . 8658)    ; ⇒
          (":->" . 8594)   ;
          )))
(add-hook 'lisp-mode-hook 'my-add-pretty-lambda)

;;; concurrent hints
;; https://www.reddit.com/r/lisp/comments/72v6p3/pushing_pixels_with_lisp_episode_18_shadow/
(defun slime-enable-concurrent-hints ()
  (interactive)
  (setq slime-inhibit-pipelining nil))

; melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

; https://www.emacswiki.org/emacs/ShowParenMode
; parens match
(show-paren-mode 1)

; Fuck tilde!
(setq make-backup-files nil)

;; sbcl real
(setq slime-lisp-implementations
      '((sbcl ("set_rlimits" "sbcl")) ...))

; I want spaces for indentation
(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (clojure-mode yasnippet markdown-mode dummyparens extempore-mode chicken-scheme smartparens lua-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

