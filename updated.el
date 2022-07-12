(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(require 'font-lock)
(require 'font-lock+)
(use-package all-the-icons)
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode dracula-theme json-mode))
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))
(load-theme 'afternoon t)
(helm-mode)

(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)
(which-key-mode)
(add-hook 'prog-mode-hook #'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'
(with-eval-after-load 'lsp-mode
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))
;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c0f4b66aa26aa3fded1cbefe50184a08f5132756523b640f68f3e54fd5f584bd" "42ec9eaa86da5f052feed0e35b578681015b9e21ab7b5377a5a34ea9a0a9e1b9" "94a94c957cf4a3f8db5f12a7b7e8f3e68f686d76ae8ed6b82bd09f6e6430a32c" "1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" "57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" default)))
 '(helm-completion-style (quote helm))
 '(lsp-dired-mode t nil (lsp-dired))
 '(package-selected-packages
   (quote
    (font-lock-studio all-the-icons-ibuffer all-the-icons-ivy-rich all-the-icons-completion all-the-icons-dired zerodark-theme zweilight-theme cyberpunk-2019-theme cyberpunk-theme dracula-theme treemacs-tab-bar treemacs-persp use-package js2-mode dracula-theme lsp-mode yasnippet helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode json-mode)))
 '(projectile-mode t nil (projectile)))
;;this are personal configurations i wrote myself
(menu-bar-mode -1)
;;stop startup message
(tool-bar-mode -1) 
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(setq inhibit-splash-screen t)
(scroll-bar-mode -1)
(setq c-default-style "bsd"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)
;;disable creation of backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; define custom keybindings here use the example provided below
(global-set-key (kbd "C-q") 'shell)
(global-set-key (kbd "C-x w") 'quit-window)
(global-set-key (kbd "C-x q") 'delete-trailing-whitespace)
(global-set-key (kbd "C-x t") 'neotree-toggle)
(global-set-key (kbd "C-x 9") 'eval-buffer)
;;font size
(set-face-attribute 'default nil :height 110)
(global-display-line-numbers-mode 1)
;;; treemacs-projectile.el ends here
(electric-pair-mode 1)
(electric-indent-mode 1)
(load-theme 'zerodark)
(electric-quote-mode 1)

(when (display-graphic-p)
  (require 'all-the-icons))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
