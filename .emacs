(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package key-chord)

(require 'key-chord)
(key-chord-mode t)
(setq key-chord-two-keys-delay 0.1)
(setq key-chord-one-key-delay 0.2)
;; (key-chord-define-global "jj" 'newline-and-indent)

(setq-default show-trailing-whitespace t)

(global-auto-revert-mode t)
(show-paren-mode t)
(cua-mode t)
(column-number-mode t)
;; (global-linum-mode t)
(setq auto-save-default nil)
(setq echo-keystrokes 0.02)
(set-scroll-bar-mode 'right)

(global-set-key (kbd "<f2>") 'save-some-buffers)
(global-set-key (kbd "<f5>") 'list-buffers)
(global-set-key (kbd "<f6>") 'dired)
;; (global-set-key (kbd "<f8>") 'speedbar)
(global-set-key (kbd "<f12>") 'run-shell-command)

(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "C-a") 'mark-whole-buffer)

(global-set-key (kbd "<C-right>") 'next-buffer)
(global-set-key (kbd "<C-left>") 'previous-buffer)

(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
;; (global-set-key (kbd "<M-left>") 'windmove-left)
;; (global-set-key (kbd "<M-right>") 'windmove-right)

(global-set-key "%" 'match-paren)

(defun match-paren (arg)
    "Go to the matching paren if on a paren; otherwise insert %."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list t) (backward-char t))
          ((looking-at "\\s\)") (forward-char t) (backward-list t))
          (t (self-insert-command (or arg t)))))

(defun run-shell-command()
  (interactive)
  (save-buffer)
  ;; (shell-command "cd ../build/ && make -j && ./tetris")
  )
