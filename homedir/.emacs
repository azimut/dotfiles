(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(neo-dir-link-face ((t (:foreground "cyan"))))
 '(neo-file-link-face ((t (:foreground "white"))))
 '(trailing-whitespace ((t nil)))
 '(whitespace-empty ((t nil)))
 '(whitespace-line ((t nil)))
 '(whitespace-newline ((t (:foreground "grey9" :weight normal))))
 '(whitespace-space ((t (:foreground "grey9"))))
 '(whitespace-tab ((t (:foreground "gray9"))))
 '(whitespace-trailing ((t nil))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (kaolin-galaxy)))
 '(custom-safe-themes
   (quote
    ("a7928e99b48819aac3203355cbffac9b825df50d2b3347ceeec1e7f6b592c647" "3788e589eb432e6a515d557cbeb8dc4eaca9e00ae54f932b4bd43ed78605532e" "a70b47c87e9b0940f6fece46656200acbfbc55e129f03178de8f50934ac89f58" "b69323309e5839676409607f91c69da2bf913914321c995f63960c3887224848" "f7b0f2d0f37846ef75157f5c8c159e6d610c3efcc507cbddec789c02e165c121" "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "2d835b43e2614762893dc40cbf220482d617d3d4e2c35f7100ca697f1a388a0e" "d8dc153c58354d612b2576fea87fe676a3a5d43bcc71170c62ddde4a1ad9e1fb" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
          (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
                         (:color "#808080"))
     (implicitParams :underline
                     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#383838")
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (vterm systemd typescript-mode kaolin-themes darcula-theme cyberpunk-theme abyss-theme sly-macrostep sly git-timemachine csound-mode gitignore-templates yasnippet-snippets dimmer diredful toml-mode org-mind-map smartparens focus helm-dash tidal magit-todos redshank gorepl-mode go-dlv flymake-go gotest go-eldoc dockerfile-mode shader-mode glsl-mode lua-mode aggressive-indent string-inflection go-autocomplete phi-search ivy-erlang-complete lfe-mode helm-clojuredocs browse-at-remote which-key gnu-elpa-keyring-update spinner ace-window helm-gtags minimap forge csharp-mode spacemacs-theme spaceline gitignore-mode zeal-at-point imenu-list ggtags peep-dired company-c-headers cmake-mode cpputils-cmake flycheck-rebar3 erlang editorconfig multiple-cursors company-math latex-preview-pane elixir-mode sclang-extensions robe cider web-beautify flycheck go-guru company-go go-mode elpy paredit jinja2-mode yaml-mode ansible magit neotree auto-complete company clojure-mode yasnippet markdown-mode dummyparens extempore-mode chicken-scheme)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef")))
 '(show-trailing-whitespace t))

(load-file "~/.emacs.d/azimut.el")
(put 'downcase-region 'disabled nil)
