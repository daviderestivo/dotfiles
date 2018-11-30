;;; magit-init.el - A minimal Emacs config used for magit bash alias

;;
;; Copyright (C) 2018-2018 Davide Restivo
;;
;; Author: Davide Restivo <davide.restivo@yahoo.it>
;; Maintainer: Davide Restivo <davide.restivo@yahoo.it>
;; URL: https://github.com/daviderestivo/dotfiles
;; Version: 0.0.2
;; Keywords: emacs config magit bash


;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.


;;; Commentary: A minimal Emacs config used for magit bash alias
;;
;; Add the following bash alias into your bashrc file:
;;
;; alias magit="emacs --no-window-system --no-init-file \
;; --load ~/.dotfiles/magit/magit-init.el \
;; --eval '(progn (magit-status) (delete-other-windows))'"


;;; Improve Emacs startup time

;;
;; PLEASE DO NOT ADD ANY CODE `BEFORE' THIS SECTION
;;
;; Avoid garbage collection during startup. The GC eats up quite a bit
;; of time, easily doubling the startup time. The trick is to turn up
;; the memory threshold (500 MB should be sufficient) in order to
;; prevent it from running during startup.
(setq gc-cons-threshold (* 500 1024 1024)
      gc-cons-percentage 0.6)

;; After Emacs startup has been completed, set `gc-cons-threshold' to
;; 16 MB and reset `gc-cons-percentage' to its original value.
(add-hook 'emacs-startup-hook
          '(lambda ()
             (setq gc-cons-threshold (* 16 1024 1024)
                   gc-cons-percentage 0.1)))

;; Log Emacs startup time in *Messages*
(add-hook 'emacs-startup-hook
          '(lambda ()
             (message (format "Emacs startup time: %s" (emacs-init-time)))))

;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; Set LANG and LC_* variables
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")

;; Inhibit startup screen, splash screen and startup message
(setq inhibit-startup-screen t
      inhibit-splash-screen t
      inhibit-startup-message t)

;; Disable the menu bar
(menu-bar-mode -1)

;; Enable visual line fringe and empty line indicator
(setq visual-line-fringe-indicators
      '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil
              indicate-empty-lines t
              indent-tabs-mode nil)

;; Datetime format
(setq display-time-day-and-date t
      display-time-24hr-format t)

;; Blinking cursor
(blink-cursor-mode t)

;; Change cursor type to vertical bar
(setq-default cursor-type 'bar)

;; Use visual bell instead of audio
(setq visible-bell 1)

;; Disable the toolbar and the scroll-bar.
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Turn on highlighting current line
(global-hl-line-mode 1)

;; Fix <DEL> fails to delete on a terminal
(normal-erase-is-backspace-mode 1)

;; Load a better theme than the default
(load-theme 'tango-dark)

;; Insert date function
(defun drestivo/insert-date ()
  (interactive)
  "Insert current datetime into buffer without a newline."
  (insert (concat "Date: " (shell-command-to-string "printf %s \"$(date)\""))))
(global-set-key (kbd "M-+") 'drestivo/insert-date)

;; Load magit and all related dependencies
(add-to-list 'load-path "~/.dotfiles/magit/packages/dash.el")
(add-to-list 'load-path "~/.dotfiles/magit/packages/with-editor")
(add-to-list 'load-path "~/.dotfiles/magit/packages/magit-popup")
(add-to-list 'load-path "~/.dotfiles/magit/packages/ghub")
(add-to-list 'load-path "~/.dotfiles/magit/packages/graphql.el")
(add-to-list 'load-path "~/.dotfiles/magit/packages/treepy.el")
(add-to-list 'load-path "~/.dotfiles/magit/packages/magit/lisp")
(add-to-list 'load-path "~/.dotfiles/magit/packages/magit-org-todos.el")
(require 'magit)
(require 'magit-org-todos)

;;; Magit configuration

;; Expand "unpushed to upstream or recent" magit section
(push (cons [unpushed status] 'show) magit-section-initial-visibility-alist)


;;; magit-init.el ends here
