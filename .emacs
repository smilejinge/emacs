;;============================Manual Start===================================

;;(1)将.emacs、.emacs.d放在家目录下，其中各项的配置即可起作用了，一般Emacs启动时会自动创建，覆盖即可。
;;(2).emacs是Emacs的配置文件，.emacs.d是Emacs的配置目录，都位于家目录下。使用这两种方式都可以对Emacs进行配置，可以删除.emacs文件，然后在.emacs.d目录下新建一个init.el文件，这个init.el文件的作用相当于.emacs文件，但是.emacs文件的执行优先于init.el文件。Emacs启动时会自动执行.emacs.d目录下的init.el文件。
;; (3)help
;; C-h ? : 查看帮助信息
;; C-h f : 查看一个函数
;; C-h v : 查看一个变量
;; C-h k : 查看一个键绑定 (C-h c 也是查看键绑定，但是信息较简略)
;; C-h C-f : 查看一个函数的info，非常有用
;; C-h i : 看Info
;; (4)tags
;; M-! etags .c .h : 创建TAGS文件
;; M-. : 跳到tag所在位置
;; M-x list-tags : 列出tags
;; (5)others
;; M-! : 执行外部shell命令
;; M-x term : 模拟terminal, C-c k 关闭terminal

;;============================Manual End===================================


;;============================Question Start===================================

;;Q：在EMACS中没有自动换行，使得查看较长的行的时候不是很方便。如何实现？
;; 1. M－x：customize-option；
;; 2. 输入truncate-partial-width-windows，使用过程中为防止命令拼写错误，可以用Tab键补齐； 
;; 3. 将设置页面中的参数改为off，然后点击保存按钮（save for furture sessions），再点击finish按钮。

;;============================Question End===================================


;;============================Config Start===================================

;;++++++++++++++++++++++++++++Init Start++++++++++++++++++++++++++++++
;;把目录.emacs.d添加到搜索路径中去
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d" user-emacs-directory))

(add-to-list 'load-path "~/_emacs")
(add-to-list 'load-path "~/_emacs/codepilot")
(add-to-list 'load-path "~/_emacs/emacs-eclim")
(add-to-list 'load-path "~/_emacs/icicles")
(add-to-list 'load-path "~/_emacs/gnuserv")
;;++++++++++++++++++++++++++++Init End++++++++++++++++++++++++++++++

;;++++++++++++++++++++++++++++Switch Start++++++++++++++++++++++++++++++
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(show-paren-mode t)
 '(transient-mark-mode t)
 '(truncate-partial-width-windows nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;去掉工具栏
;;(tool-bar-mode nil)
;;(tool-bar-mode 0)

;;去掉菜单栏
;;(menu-bar-mode nil)
;;(menu-bar-mode 0)

;;取消滚动栏
;;(set-scroll-bar-mode nil)
(scroll-bar-mode nil)

;;取消欢迎语
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;语法高亮显示
(global-font-lock-mode t)

;;允许屏幕左移
(put 'scroll-left 'eabled nil) 

;;允许屏幕右移
(put 'scroll-right 'eabled nil)

;;自动的在文件末增加一新行
(setq require-final-newline t)

;;当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)

;;时间使用24小时制
(setq display-time-24hr-format t)

;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)

;;显示行号
(global-linum-mode t)

;;显示行列号
(column-number-mode t)

;;显示列号
(setq mouse-yank-at-point t)

;;显示行列号,它显示在minibuffer上面那个杠上
(setq column-number-mode t)
(setq line-number-mode t)

;;高亮当前行
;;(require 'hl-line+);;貌似不需要加载此插件
(global-hl-line-mode t)

;;打开图片显示功能
(auto-image-file-mode t)

;;关闭烦人的出错时的提示声。
(setq visible-bell t)

;;打开括号匹配显示模式
(setq show-paren-mode t) 

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end-double-space nil)

;;可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;;显示文件完整路径
(setq helm-ff-transformer-show-only-basename nil)

;;-----------------自动编译开始----------------------
;; (defalias 'make-local-hook
;;   (if (featurep 'xemacs)
;;       'make-local-hook
;;     'ignore))

;; (setq byte-compile-warnings nil)
;;(setq stack-trace-on-error t)
;;-----------------自动编译结束----------------------

;;-----------------gdb开始----------------------
;;gdb-many-window 多窗口gdb
(setq gdb-many-windows t)

;;fringe-mode 断点栏显示，why：不起作用
(setq fringe-mode t)

;;run、step、next快捷键
(add-hook 'gdb-mode-hook'(lambda()
                           (define-key c-mode-base-map [(f5)] 'gud-go)
                           (define-key c-mode-base-map [(f7)] 'gud-step)
                           (define-key c-mode-base-map [(f8)] 'gud-next)))
;;-----------------gdb结束----------------------

;; 关闭自动保存功能，默认值是t，要关闭直接用nil更改默认值
;; M-x recover file <Return>来恢复你的编辑
;;(setq auto-save-default nil)
;;不生成 #filename# 临时文件
;;(setq auto-save-default nil)
;;++++++++++++++++++++++++++++Switch End++++++++++++++++++++++++++++++

;;++++++++++++++++++++++++++++Hotkeys Start++++++++++++++++++++++++++++++
;;把M-g绑定到”到达指定行”上(goto-line)
(global-set-key (kbd "M-g") 'goto-line)

;;设置M-SPC作为标志位，默认C-@来setmark,C-@不太好用
(global-set-key (kbd "M-SPC") 'set-mark-command)

;;查找替换
(global-set-key (kbd "M-q") 'query-replace)

;;复制一行或者多行
(global-set-key (kbd "C-x c") 'copy-lines)

;;剪切一行
(global-set-key (kbd "C-x k") 'kill-line)

;;删除一行
(global-set-key (kbd "C-x d") 'zl-delete-line)

;;删除匹配括号间内容
(global-set-key (kbd "C-x a") 'kill-match-paren)

;;窗口间切换
(global-set-key (kbd "C-x i") 'windmove-up)
(global-set-key (kbd "C-x k") 'windmove-down)
(global-set-key (kbd "C-x j") 'windmove-left)
(global-set-key (kbd "C-x l") 'windmove-right)

;;用S-<up>、S-<right>等跳转窗口
;;(windmove-default-keybindings)
;;(windmove-default-keybindings 'meta)
;;(windmove-default-keybindings 'super)
(windmove-default-keybindings 'C)

;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-j" 'newline)
(global-set-key (kbd "C-<return>") 'newline)

;;F9:格式化代码，以使代码缩进清晰，容易阅读
;;(global-set-key [f9] 'c-indent-line-or-region)

;;F10:注释 / 取消注释
;;(global-set-key [f10] 'comment-or-uncomment-region)
(global-set-key (kbd "C-u") 'comment-or-uncomment-region)

;;把”键入一个Tab“绑定到一个空闲的C-tab组合键上，输入1个Ascii为9的字符（即tab）
;;(global-set-key [S-tab] '(lambda () (interactive) (insert-char 9 1)))
;;(global-set-key (kbd "<tab>") '(lambda () (interactive) (insert-char 9 1)))

;;刷新buffer，重新载入文件。why：并未起作用
(defun refresh-file ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t))
(global-set-key [(control f5)] 'refresh-file)

;;从光标位置开始，处理单词后半部分
;;capitalize-word (M-c) ;; 单词首字母转为大写
;;upcase-word (M-u)     ;; 整个单词转为大写
;;downcase-word (M-l)   ;; 整个单词转为小写（注意，这里是 META － l(* 小写字母 L)）
;; 从光标位置开始，处理单词前半部分
;; negtive-argument; capitalize-word (M-- M-c) ;; 单词首字母转为大写
;; negtive-argument; upcase-word (M-- M-u)     ;; 整个单词转为大写
;; negtive-argument; downcase-word (M-- M-l)   ;; 整个单词转为小写
;; 改变选定区域的大小写

;; downcase-region (C-x C-l) ;; 选定区域全部改为小写
;; upcase-region (C-x C-u)   ;; 选定区域全部改为大写

;; 保存文件时，自动设置为unix模式
;;(global-set-key (kbd "C-x C-s")
;;				(lambda()
;;				  (interactive)
;;				  (set-buffer-file-coding-system 'unix 't)
;;				  (save-buffer)))

;;++++++++++++++++++++++++++++Hotkeys End++++++++++++++++++++++++++++++

;;++++++++++++++++++++++++++++Set Start++++++++++++++++++++++++++++++
;;设置字体颜色为灰色，默认为黑色
(set-foreground-color "grey")
;;设置背景为黑色，默认为白色，你也可以自由设置其它颜色
(set-background-color "black")
;;设置光标的颜色为金黄(gold1),白色(white)，默认为黑色
(set-cursor-color "white")
;;设置鼠标的颜色
(set-mouse-color "gold1")

;; 设置语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "red")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")

;; Fonts setting
;; 设置两个字体变量，一个中文的一个英文的
;; 之所以设置两个字体大小是因为有的中文和英文相同字号的显示大小不一样，需要手动调整一下。
(setq cjk-font-size 16)
(setq ansi-font-size 16)

;;设置字体
;;(set-default-font "Courier New-12")
(set-default-font "-outline-Courier New-normal-italic-normal-mono-16-*-*-*-c-*-iso8859-1")
;;(set-default-font "chinese-gb2312:-*-ar pl shanheisun uni-medium-r-normal--16-*-*-*-c-*-gb2312*-*");;宋体2

;;设置中文语言环境
;;(set-language-environment 'Chinese-GB)

;;写文件的编码方式
;;(set-buffer-file-coding-system 'gb2312)
;;(set-buffer-file-coding-system 'utf-8)

;;新建文件的编码方式
;;(setq default-buffer-file-coding-system 'gb2312)
(setq default-buffer-file-coding-system 'utf-8)

;;终端方式的编码方式
;;(set-terminal-coding-system 'utf-8)

;;键盘输入的编码方式
;;(set-keyboard-coding-system 'gb2312)
;;(set-keyboard-coding-system 'utf-8)

;;读取或写入文件名的编码方式
;;(setq file-name-coding-system 'utf-8) 

;; 一打开就起用 text 模式。 
(setq default-major-mode 'text-mode)
;;设置自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "king@%b")

;; 默认显示 80列就换行 
;;(setq default-fill-column 80)

;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)

;;使用aspell程序作为Emacs的拼写检查程序
(setq-default ispell-program-name "aspell")

;;可以显示所有目录以及文件
(setq speedbar-show-unknown-files t)

;;设置默认工作路径
;;(setq command-line-default-directory "E:/WorkSpace/ProjectA/server/GameServer/")
;;(setq default-directory "E:/WorkSpace/ProjectA/server/GameServer/")

;;防止页面滚动时跳动
;;scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动
;;scroll-step 1 设置每次都是一行一行向下翻，更有连贯性。
(setq scroll-step 1 
scroll-margin 3 
scroll-conservatively 10000)

;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
(setq show-paren-style 'parenthesis)

;;改变Emacs要你回答yes的行为。按y或空格键表示yes，n表示no。
(fset 'yes-or-no-p 'y-or-n-p)

;;光标靠近鼠标指针时，让鼠标指针自动让开
(mouse-avoidance-mode 'animate) 

;;设置tab每次缩进4个空格
(setq default-tab-width 4)
;;(setq-default indent-tabs-mode  nil)	;;此行会导致C-b只回退一个空格
;;(setq tab-width 4 c-basic-offset 4)
;;(setq tab-width 4 indent-tabs-mode nil)

;;设置Emacs启动时窗口最大化，针对于Windows等界面版Emacs
;;(defun w32-restore-frame ()
;;    "Restore a minimized frame"
;;     (interactive)
;;     (w32-send-sys-command 61728))
;;(defun w32-maximize-frame ()
;;    "Maximize the current frame"
;;     (interactive)
;;     (w32-send-sys-command 61488))
;;(w32-maximize-frame)

;;-----------------设置代码自动格式化开始----------------------
;;Emacs 里对代码的格式化支持的非常好，不但可以在编辑的时候自动帮你格式化，还可以选中一块代码，
;;按 Ctrl-Alt-\ 对这块代码重新进行格式化.如果要粘贴一块代码的话，粘贴完了紧接着按 Ctrl-Alt-\,
;;就可以把新加入的代码格式化好。可是，对于这种粘贴加上重新格式化的机械操作，Emacs 应该可以将
;;它自动化才能配得上它的名气，把下面的代码加到配置文件里，你的 Emacs 就会拥有这种能力了
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
	  (and (not current-prefix-arg)
		   (member major-mode
				   '(
					 c-mode
					 c++-mode
					 clojure-mode
					 emacs-lisp-mode
					 haskell-mode
					 js-mode
					 latex-mode
					 lisp-mode
					 objc-mode
					 perl-mode
					 cperl-mode
					 plain-tex-mode
					 python-mode
					 rspec-mode
					 ruby-mode
					 scheme-mode))
		   (let ((mark-even-if-inactive transient-mark-mode))
			 (indent-region (region-beginning) (region-end) nil))))))
;;-----------------设置代码自动格式化开始----------------------

;;-----------------设置自动缩进开始----------------------
(defun linux-cpp-mode ()
"my cpp mode define"
(interactive)
(c-set-style "K&R")
(setq c-basic-offset 4) ;;设置缩进4个字符
;;(c-toggle-auto-hungry-state)
(define-key c++-mode-map [return] 'newline-and-indent)
)
(defun linux-c-mode ()
"my c mode define"
(interactive)
;;(c++-mode)
(c-set-style "K&R")
(setq c-basic-offset 4)
;;(c-toggle-auto-hungry-state)
(define-key c-mode-map [return] 'newline-and-indent)
)
(add-hook 'c++-mode-hook 'linux-cpp-mode)
(add-hook 'c-mode-hook 'linux-c-mode)
;;-----------------设置自动缩进结束---------------------

;;-----------------设置自动补全符号开始----------------------
;;自动补全右边的部分.包括<>, "", '', (), //, [] , {}等等。
(defun my-c-mode-auto-pair ()
(interactive)
(make-local-variable 'skeleton-pair-alist)
(setq skeleton-pair-alist '(

;;自动补全<>
;;(?\< ? _ ">")
;;(?\< _ ">")

;;自动补全//
;;(?` ?` _ "/")

;;自动补全()
;;(?\( ? _ ")") ;;此方式括号中间会插入一空格，例：( )
(?\( _ ")")

;;自动补全[]
;;(?\[ ? _ "]")
(?\[ _ "]")

;;设自动补全""
;;(?\" ? _ "\"")
(?\" _ "\"")

;;自动补全''
;;(?\' ? _ "'")
(?\' _ "'")

;;自动补全{}
;;(?{ \n > _ \n ?} >)
(?{ \n > _ \n "}" >)

))

(setq skeleton-pair t)
;;(local-set-key (kbd "<") 'skeleton-pair-insert-maybe)
;;(local-set-key (kbd "/") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;(local-set-key (kbd "/") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "{") 'skeleton-pair-insert-maybe))

;;设置C/C++模式
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
;;-----------------设置自动补全符号结束----------------------

;;删除 ^M
(defun remove-dos-eol ()
"Do not show ^M in files containing mixed UNIX and DOS line endings."
(interactive)
(setq buffer-display-table (make-display-table))
(aset buffer-display-table ?\^M []))
(add-hook 'python-mode-hook 'remove-dos-eol)
(add-hook 'javascript-mode-hook 'remove-dos-eol)
(add-hook 'html-mode-hook 'remove-dos-eol)
(add-hook 'css-mode-hook 'remove-dos-eol)
(add-hook 'c++-mode-hook 'remove-dos-eol)
(add-hook 'c-mode-hook 'remove-dos-eol)
;;++++++++++++++++++++++++++++Set End++++++++++++++++++++++++++++++

;;++++++++++++++++++++++++++++Plugin Start++++++++++++++++++++++++++++++

;;颜色主题，将color-theme.el文件放在.emacs.d目录下
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-comidia)
;;(color-theme-midnight)
;;(color-theme-renegade)
;;(color-theme-taming-mr-arneson)
;;(color-theme-dark-laptop)
;;(color-theme-calm-forest)  

;;自动识别编码类型，将unicad.el文件放在.emacs.d目录下
(require 'unicad)

;;-----------------语法高亮开始----------------------
;;加载highlight-symbol.el文件，语法高亮文件
(require 'highlight-symbol)

;;设置操作快捷键
(global-set-key "\M-h" 'highlight-symbol-at-point) ; 高亮所有
(global-set-key "\M-u" 'highlight-symbol-remove-all) ; 取消高亮
(global-set-key "\M-n" 'highlight-symbol-next) ; 查找下一个符号
(global-set-key "\M-p" 'highlight-symbol-prev) ; 查找上一个符号
;;-----------------语法高亮结束----------------------

;;-----------------auto-header开始----------------------
;;加载auto-header.el文件,自动添加文件头
(require 'auto-header)

;; 设置文件头中的姓名
(setq header-full-name "jinweiwei")

;; 设置邮箱
(setq header-email-address "jinweiwei1@jd.com")

;; 设置每次保存时要更新的项目
(setq header-update-on-save
      '(  filename
          modified
          counter
          copyright))

;; 设置文件头的显示格式
(setq header-field-list
      '(  filename  ;文件名
          ;;blank   ;空行，下同
          ;;copyright ;;版权
          version
          author    ;作者
          created   ;创建人
          ;;blank
          description   ;描述
          ;;blank
          ;;modified_by ;更改者
          ;;blank
          ;;status  ;状态，是否发布
          ;;blank
          )) 
;;-----------------auto-header结束----------------------

;;将子窗口自动编号,然后按M-0…9跳转，将window-numbering.el放在.emacs.d目录下
;;(require 'window-numbering)
;;(window-numbering-mode 1)
;;++++++++++++++++++++++++++++Plugin End++++++++++++++++++++++++++++++

;;-----------------Cedet 1.1 开始----------------------
;; (load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
;; ;; Enable the Project management system
;; (global-ede-mode 1)

;; ;;This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; ;; * This enables even more coding tools such as the nascent intellisense mode
;; ;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; ;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; ;; This turns on modes that aid in grammar writing and semantic tool
;; ;; development.  It does not enable any other features such as code
;; ;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

;; ;; Enable prototype help and smart completion
;; (semantic-load-enable-code-helpers)

;; ;; Enable template insertion menu
;; (global-srecode-minor-mode 1)

;; (global-set-key [(f4)] 'speedbar-get-focus)
;;-----------------Cedet 1.1 结束----------------------

;;-----------------ECB 2.4 开始----------------------
;; (add-to-list 'load-path
;;              "~/.emacs.d/plugins/ecb-2.40")
;; (require 'ecb)
;; (require 'ecb-autoloads)

;; ;;激活ecb
;; (global-set-key [(f5)] 'ecb-activate)

;; ;;show&hide window
;; (global-set-key (kbd "C-c h") 'ecb-hide-ecb-windows)
;; (global-set-key (kbd "C-c s") 'ecb-show-ecb-windows)

;; ;; 使某一ecb窗口最大化
;; (global-set-key (kbd "C-c 1") 'ecb-maximize-window-directories)
;; (global-set-key (kbd "C-c 2") 'ecb-maximize-window-sources)
;; (global-set-key (kbd "C-c 3") 'ecb-maximize-window-methods)
;; (global-set-key (kbd "C-c 4") 'ecb-maximize-window-history)

;; ;;恢复原始窗口布局
;; (global-set-key (kbd "C-c 0") 'ecb-restore-default-window-sizes)
;;-----------------ECB 2.4 结束----------------------

;;-----------------yasnippet 0.6.1 开始----------------------
;;载入yasnippet 这是一个模板补全工具 简单来说 for【tab】 就会自动帮你补全出一个for的大概结构，支持自定义模板。
;; (add-to-list 'load-path
;;             "~/.emacs.d/plugins/yasnippet-0.6.1c")
;; (require 'yasnippet) ;; not yasnippet-bundle
;; (yas/initialize)
;; (yas/global-mode 1)
;; (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
;;-----------------yasnippet 0.6.1 结束----------------------

;;-----------------auto-complete 开始----------------------
;;(add-to-list 'load-path "~/.emacs.d/")
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(ac-config-default)
;;-----------------auto-complete 结束----------------------

;;============================Config End===================================

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)
