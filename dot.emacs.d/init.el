;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-to-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf")

;; (install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(when (require 'auto-install nil t)
  ;; インストールディレクトリの設定 default is '~/.emacs.d/auto-install'
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWiKi に登録されている elisp の名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればプロキシの設定を行う
  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
  ;; install-elips の関数を利用可能にする
  (auto-install-compatibility-setup))

;; anything.el
(require 'anything)
;; Emacs コマンドを表示する
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)

;; (install-elisp "http://www.emacswiki.org/emacs/download/redo+.el")
(when (require 'redo+ nil t)
  ;; global-map
  (global-set-key (kbd "C-'") 'redo)) ;C-'にredoを割り当てる

;; ruby-mode
(add-to-list 'load-path "~/.emacs.d/elisp/ruby")
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

;; ruby-electric.el --- electric editing commands for ruby files
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; magickコメントを挿入する
(defun ruby-insert-magic-comment-if-needed ()
  "バッファのcoding-systemをもとにmagic commentをつける。"
  (when (and (eq major-mode 'ruby-mode)
	     (find-multibyte-characters (point-min) (point-max) 1))
    (save-excursion
      (goto-char 1)
      (when (looking-at "^#!")
	(forward-line 1))
      (if (re-search-forward "^#.+coding" (point-at-eol) t)
	  (delete-region (point-at-bol) (point-at-eol))
	(open-line 1))
      (let* ((coding-system (symbol-name buffer-file-coding-system))
	     (encoding (cond ((string-match "japanese-iso-8bit\\|euc-j" coding-system)
			      "euc-jp")
			     ((string-match "shift.jis\\|sjis\\|cp932" coding-system)
			      "shift_jis")
			     ((string-match "utf-8" coding-system)
			      "utf-8"))))
	(insert (format "# -*- coding: %s -*-" encoding))))))

(add-hook 'before-save-hook 'ruby-insert-magic-comment-if-needed)

;; (let ((mode '(("ruby" . ruby-mode)
;; 	      ("ruby19" . ruby-mode))))
;;   (while mode
;;     (setq interpreter-mode-alist (cons (car mode) interpreter-mode-alist))
;;     (setq mode (cdr mode))))

;; magickコメント挿入関数を無効にする
;; http://blog.s21g.com/articles/1030
(require 'ruby-mode)
(defun ruby-mode-set-encoding () ())

;;
;; For Rails development
;; http://rinari.rubyforge.org/


;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
;; https://github.com/eschulte/rinari
;; http://rinari.rubyforge.org/Basic-Setup.html#Basic-Setup
(add-to-list 'load-path "~/.emacs.d/elisp/rinari")
(require 'rinari)

;; rhtml-mode
;; https://github.com/eschulte/rhtml
;; http://rinari.rubyforge.org/rhtml_002dMode.html#rhtml_002dMode
(add-to-list 'load-path "~/.emacs.d/elisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
	  (lambda () (rinari-launch)))

;; yasnippet
;; http://code.google.com/p/yasnippet/
(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/elisp/yasnippet-0.6.1c/snippets")

;; yasnippets-rails
;; https://github.com/eschulte/yasnippets-rails
(yas/load-directory "~/.emacs.d/elisp/yasnippets-rails/rails-snippets")

;; https://github.com/defunkt/textmate.el
(add-to-list 'load-path "~/.emacs.d/elisp/textmate.el")
(require 'textmate)
(textmate-mode)

;; yaml-mode
;; https://github.com/yoshiki/yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
