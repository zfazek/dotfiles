(global-auto-revert-mode 1)
(show-paren-mode 1)
(cua-mode t)
(column-number-mode t)
(global-linum-mode t)
(setq auto-save-default nil)
(set-scroll-bar-mode 'right)

(global-set-key (kbd "<f2>") 'save-some-buffers)
;(global-set-key (kbd "<f12>") 'run-shell-command)
(global-set-key (kbd "<f8>") 'speedbar)
(global-set-key (kbd "<RET>") 'newline-and-indent)
;(global-set-key (kbd "<tab>") 'dabbrev-completion)
(global-set-key (kbd "C-a") 'mark-whole-buffer)

(global-set-key (kbd "<C-right>") 'next-buffer)
(global-set-key (kbd "<C-left>") 'previous-buffer)

(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)

(global-set-key "%" 'match-paren)
          
(defun match-paren (arg)
    "Go to the matching paren if on a paren; otherwise insert %."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
          (t (self-insert-command (or arg 1)))))

(defun run-shell-command()
  (interactive)
  (save-buffer)
  (shell-command "javac problem086.java && time java problem086"))
