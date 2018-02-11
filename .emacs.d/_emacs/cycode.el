;;==============================================================
;;gdb-UI配置
;;==============================================================
(setq gdb-many-windows t)
(load-library "multi-gud.el")
(load-library "multi-gdb-ui.el")

;;==================================================
;;cedet插件设置
;;==================================================
(add-to-list 'load-path "~/.emacs.d/plugins/cedet-1.1/speedbar")
(add-to-list 'load-path "~/.emacs.d/plugins/cedet-1.1/eieio")
(add-to-list 'load-path "~/.emacs.d/plugins/cedet-1.1/semantic")
 
 ;;----------------------------------------------------------------------
(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

(global-ede-mode t)
;;代码折叠
;;(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
;;折叠和打开整个buffer的所有代码
(define-key semantic-tag-folding-mode-map (kbd "C--") 'semantic-tag-folding-fold-all)
(define-key semantic-tag-folding-mode-map (kbd "C-=") 'semantic-tag-folding-show-all)
;;折叠和打开单个buffer的所有代码
(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-block)


;;==============================================================
;;ecb配置
;;==============================================================
;;(require 'ecb)
;;开启ecb用,M-x:ecb-activate
(require 'ecb-autoloads)
;;自动启动ecb并且不显示每日提示
;;(require 'ecb)
;;(setq ecb-auto-activate t)
(setq ecb-tip-of-the-day nil)

(require 'cc-mode)
(c-set-offset 'inline-open 0)
(c-set-offset 'friend '-)
(c-set-offset 'substatement-open 0)


(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  ;;; hungry-delete and auto-newline
;;  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
 (define-key c-mode-base-map [(return)] 'newline-and-indent)

  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
;;  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
;;  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  ;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
)
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(defun my-c++-mode-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (c-set-style "stroustrup")
;;  (define-key c++-mode-map [f3] 'replace-regexp)
)

;;配置Semantic搜索范围
(setq semanticdb-project-roots
	  (list
	   (expand-file-name "/")))
;;自定义补全命令，如果单词在中间就补全，否则就tab
(defun my-indent-or-complete()
  (interactive)
  (if (looking-at "\\>")
	  (hippie-expand nil)
	  (indent-for-tab-command))
  )

;;补全快捷键，ctrl+tab用senator补全，不显示列表
;;alt+/补全，显示列表让选择
(global-set-key [(control tab)] 'my-indent-or-complete)
(define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)

;;==========================================================
;;加载cscope
;;==========================================================
(require 'xcscope)

