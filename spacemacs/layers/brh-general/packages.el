;;; packages.el --- brh-general layer packages file for Spacemacs.
;;
(defconst brh-general-packages '(direnv nix-update s solarized-theme ))

(defun brh-general/init-direnv ()
  (use-package direnv
    :config (direnv-mode)))

(defun brh-general/init-nix-update ()
  (use-package nix-update))

(defun brh-general/init-s ()
  (use-package s))

(defun brh-general/init-solarized-theme ()
  (use-package solarized-theme))
