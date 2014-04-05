(global-auto-revert-mode 1)
(cua-mode t)
(column-number-mode t)
(global-linum-mode t)

(global-set-key (kbd "<f2>") 'save-some-buffers)
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

