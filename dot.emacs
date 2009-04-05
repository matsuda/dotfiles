(setq load-path (cons "~/.emacs.d/elisp" load-path))

(set-language-environment "Japanese")
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

(when (eq file-name-coding-system nil) (set-file-name-coding-system 'utf-8))

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\e[ 3~" 'delete-char)

;; Don't show the startup splash screen
(setq inhibit-startup-message t)

;;(set blink-matching-paren nil)
(setq blink-matching-delay 0.1)

;; install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; auto-complete.el
(require 'auto-complete)
(global-auto-complete-mode t)

;; git-mode
(require 'ido)
(ido-mode t)

(require 'git-emacs)

(defadvice git-status-quit
  (after my-git-status-quit activate)
  (delete-window))

(require 'ido)
(ido-mode t)

(require 'git-emacs)

(define-key global-map "¥C-x¥C-g" 'git-status)

(setq git--repository-bookmarks
      '("git://github.com/xcezx/scratch.git"
        "git://github.com/xcezx/dotfiles.git"))


;;HTML helper
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
;;(setq auto-mode-alist (cons '("\\.(html|rhtml)$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist
      (append
       '(
	  ("\\.h$"    . c++-mode)
	   ("\\.hpp$"  . c++-mode)
	    ("\\.txt$"  . text-mode)
	     ("\\.message$" . text-mode)
	      ("\\.htm" . html-helper-mode)
	       ("\\.shtml$" . html-helper-mode)
	        ("\\.php" . html-helper-mode)
		 ) auto-mode-alist))
;;Ctrl-Shift-l
;;(if window-system (require 'hilit19))

;;<!-- hhmts start -->
;;<!-- hhmts end -->
(setq html-helper-do-write-file-hooks t)

;;CSS-mode
(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))

;;javascript-mode
(add-to-list 'auto-mode-alist (cons  "\\.\\(js\\|as\\|json\\|jsn\\)\\'" 'javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 4)

;;ruby-mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
	     (inf-ruby-keys)))
(global-font-lock-mode 1)
(setq default-frame-alist
      (append
       '((foreground-color . "gray")  ;
         (background-color . "black") ;
         (cursor-color     . "blue")  ;
	 )                                                                               
       default-frame-alist))

;;rails-mode
;(defun try-complete-abbrev (old)
;  (if (expand-abbrev) t nil))
;(setq hippie-expand-try-function-list
;      '(try-complete-abbrev
;	try-complete-file-name
;	try-expand-dabbrev))
;(setq rails-use-mogrel t)
;(require 'rails)
;(setq auto-mode-alist (cons '("\\.rhtml$" . ruby-mode) auto-mode-alist))
;(define-key rails-minor-mode-map "\C-c\C-p" 'rails-lib:run-primary-switch)
;(define-key rails-minor-mode-map "\C-c\C-n" 'rails-lib:run-secondary-switch)

(require 'refe)
