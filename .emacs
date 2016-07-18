;; $HeadURL: svn://rdnzl/dotfiles/.emacs $
;; $Id: .emacs 16474 2009-12-23 08:06:06Z funamoto $

(setq load-path 
    (append (list (expand-file-name "~/lib/elisp")) load-path))

(set-language-environment "Japanese")
(setq user-mail-address "kazuhisa.funamoto@gmail.com")

(require 'server)
(unless (server-running-p) (server-start))

;; 日本語infoを正しく表示させるため [debian-users:38795]
(auto-compression-mode 1)

(menu-bar-mode 0)
(tool-bar-mode 0)
(font-lock-mode t)
;(set-foreground-color "white")
;(set-background-color "black")
;(defconst FONT_SIZE 7)

;;
;; Key Bindings
;;
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-j" 'fill-region)
(global-set-key "\C-x%" 'query-replace-regexp)
(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-h" 'backward-delete-char-untabify)

;;;
; ibus (mozc)
;;
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)
;(define-key global-map "\C-\\" 'ibus-toggle)
;(ibus-define-common-key ?\C-\s nil)

(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)

;;
;; navi2ch
;;
(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
;;
;; for C/C++
;;
(add-hook 'c-mode-hook
	  '(lambda () 
	     (c-set-style "bsd")
	     (font-lock-mode t)))
;;
;; for Ruby
;;
;; (setq ruby-program-name "/usr/local/bin/ruby")
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)
	     (font-lock-mode t)
	     (setq ruby-indent-level 4)))

;;
;; ChangeLog
;;
(defun memo ()
  (interactive)
  (let ((add-log-current-defun-function 'ignore))
    (if (featurep 'meadow)
	(setq memo-file "c:/users/funamoto/documents/doc/Changelog")
      (setq memo-file "~/Documents/Changelog"))
    (set-buffer (find-file-noselect memo-file))
    (add-change-log-entry
     nil
     (expand-file-name memo-file))))
(define-key ctl-x-map "M" 'memo)

;;
;; Version Control
;;
(setq vc-command-message t)
(setq process-coding-system-alist
	(append '( ("cvs" . euc-jp-unix)
		   ("gpg" . euc-jp-unix)
		   ("gpgv" . euc-jp-unix)
		   ("w3m" . euc-jp-unix)
		   ("rcs" . euc-jp-unix)
		   ("ci" . euc-jp-unix) )
		 process-coding-system-alist) )

;;
;; 式を入力できるgoto-line
;;
;; (defun goto-line (arg)
;;   "Goto line ARG, counting from line 1 at beginning of buffer."
;;   (interactive "XGoto line: ")
;;   (setq arg (prefix-numeric-value arg))
;;   (save-restriction
;;     (widen)
;;     (goto-char 1)
;;     (if (eq selective-display t)
;;         (re-search-forward "[\n\C-m]" nil 'end (1- arg))
;;       (forward-line (1- arg)))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ruby-indent-level 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

;;
;; evernote mode
;;
;; (require 'evernote-mode)
;; (setq evernote-username "combatf") ; optional: you can use this username as default.
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; optional
;; (global-set-key "\C-cec" 'evernote-create-note)
;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)
;; (global-set-key "\C-cep" 'evernote-post-region)
;; (global-set-key "\C-ceb" 'evernote-browser)

;; flymake for ruby
(require 'flymake)
;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       (file-truename temp-file)
                       (file-name-directory (file-truename buffer-file-name)))))
    (list "ruby21" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
(add-hook
 'ruby-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))
    ;; エラー行で C-c d するとエラーの内容をミニバッファで表示する
    (define-key ruby-mode-map "\C-cd" 'credmp/flymake-display-err-minibuf)))

(defun credmp/flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no             (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count               (length line-err-info-list)))
    (while (> count 0)
      (when line-err-info-list
        (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file  (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))
