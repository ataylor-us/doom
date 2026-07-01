;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq doom-font (font-spec :family "NotoMono Nerd Font" :size 15))

;; Fulscreen on open
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; When opening a project with projectile, open treemacs then pick file
(after! projectile
  (setq projectile-switch-project-action
        (lambda ()
          (treemacs-add-and-display-current-project-exclusively)
          (other-window 1)
          (projectile-find-file))))

;; Highlight changed dirs in treemacs
(setq +treemacs-git-mode 'deferred)

;; Pasted from docs
(use-package! claude-code-ide
  :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools

(map! :leader
      :desc "Resume Claude Code" "c t" #'claude-code-ide-resume)
