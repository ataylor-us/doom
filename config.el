;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Alex Taylor"
      user-mail-address "alex@ataylor-us.dev")
(setq org-directory "~/Documents/org/")
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

;; Keep fringe diff marks visible for staged (uncommitted) changes
(after! diff-hl
  (setq diff-hl-show-staged-changes t))
