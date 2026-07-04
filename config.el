;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Alex Taylor"
      user-mail-address "alex@ataylor-us.dev")
(setq org-directory "~/org/")
(setq doom-font (font-spec :family "NotoMono Nerd Font" :size 15))

;; Fullscreen on open
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Auto open README.md w/ projectile if it exists
(after! projectile
  (setq projectile-switch-project-action
        (lambda ()
          (treemacs-add-and-display-current-project-exclusively)
          (other-window 1)
          (let* ((case-fold-search t)
                 (readme (car (directory-files (projectile-project-root)
                                               t "\\`README\\(\\.\\|\\'\\)"))))
            (if readme (find-file readme) (projectile-find-file))))))

;; Highlight changed dirs in treemacs
(setq +treemacs-git-mode 'deferred)

(use-package! claude-code-ide
  :config)

(map! :leader
      (:prefix ("c a" . "Claude")
       :desc "Menu (transient)"    "a" #'claude-code-ide-menu
       :desc "Start"               "s" #'claude-code-ide
       :desc "Resume"              "r" #'claude-code-ide-resume
       :desc "Continue"            "c" #'claude-code-ide-continue
       :desc "Toggle window"       "t" #'claude-code-ide-toggle
       :desc "Switch to buffer"    "b" #'claude-code-ide-switch-to-buffer
       :desc "List sessions"       "l" #'claude-code-ide-list-sessions
       :desc "Send prompt"         "p" #'claude-code-ide-send-prompt
       :desc "Insert selection"    "i" #'claude-code-ide-insert-at-mentioned
       :desc "Send escape"         "e" #'claude-code-ide-send-escape
       :desc "Stop session"        "k" #'claude-code-ide-stop))
