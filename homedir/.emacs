(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight regular :height 157 :width normal))))
 '(col-highlight ((t (:background "color-233"))))
 '(dap-ui-pending-breakpoint-face ((t (:background "dark gray" :foreground "black"))))
 '(dap-ui-verified-breakpoint-face ((t (:background "green" :foreground "black")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(auth-source-save-behavior nil)
 '(column-number-mode t)
 '(company-show-quick-access nil nil nil "Customized with use-package company")
 '(custom-enabled-themes '(doom-homage-black))
 '(custom-safe-themes
   '("38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee" "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67" "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "2853dd90f0d49439ebd582a8cbb82b9b3c2a02593483341b257f88add195ad76" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "a589c43f8dd8761075a2d6b8d069fc985660e731ae26f6eddef7068fece8a414" "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc" "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "c865644bfc16c7a43e847828139b74d1117a6077a845d16e71da38c8413a5aaa" "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" "919fabfc5cb6165ce07b9d8668f78fe75fe8bd08566006bc87513c29b4f34ade" "500244baf96301754cf9f388e33115405b9d75f561dd535c0a26f97a5eab52c8" "74e2ed63173b47d6dc9a82a9a8a6a9048d89760df18bc7033c5f91ff4d083e37" "5a00018936fa1df1cd9d54bee02c8a64eafac941453ab48394e2ec2c498b834a" "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52" "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "e8567ee21a39c68dbf20e40d29a0f6c1c05681935a41e206f142ab83126153ca" "a131602c676b904a5509fff82649a639061bf948a5205327e0f5d1559e04f5ed" "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428" "2ce76d65a813fae8cfee5c207f46f2a256bac69dacbb096051a7a8651aa252b0" "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34" "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3" "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "b66970f42d765a40fdb2b6b86dd2ab6289bed518cf4d8973919e5f24f0ca537b" "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" "f00a605fb19cb258ad7e0d99c007f226f24d767d01bf31f3828ce6688cbdeb22" "73320ccc14ab4987fe2e97cfd810b33a1f4a115f5f056c482c3d38a4429e1705" "c342ef444e7aca36f4b39a8e2848c4ba793d51c58fdb520b8ed887766ed6d40b" "9f9450547564423166a7d2de976c9ca712293170415ec78ed98d198748b44a90" "bb28b083fe1c61848c10c049be076afc572ea9bee6e1f8dc2631c5ee4f7388c8" "c1c459af570241993823db87096bc775506c378aa02c9c6cd9ccaa8247056b96" "6a0d7f41968908e25b2f56fa7b4d188e3fc9a158c39ef680b349dccffc42d1c8" "10845272b6fa47a6cdfc49816748bdb1dc1cb9be647801c25c054a8e6a27ef72" "643b4d181b6afa4306d65db76889d8b987e095ae8f262a4c71dd5669d39c9b09" "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483" "8ce796252a78d1a69e008c39d7b84a9545022b64609caac98dc7980d76ae34e3" "fc0fe24e7f3d48ac9cf1f87b8657c6d7a5dd203d5dabd2f12f549026b4c67446" "c499bf4e774b34e784ef5a104347b81c56220416d56d5fd3fd85df8704260aad" "9089d25e2a77e6044b4a97a2b9fe0c82351a19fdd3e68a885f40f86bbe3b3900" "c0fef082e36bb01efb44c8becead9f1d56234d61d84a849370195ca26d09cfa0" "a7928e99b48819aac3203355cbffac9b825df50d2b3347ceeec1e7f6b592c647" "3788e589eb432e6a515d557cbeb8dc4eaca9e00ae54f932b4bd43ed78605532e" "a70b47c87e9b0940f6fece46656200acbfbc55e129f03178de8f50934ac89f58" "b69323309e5839676409607f91c69da2bf913914321c995f63960c3887224848" "f7b0f2d0f37846ef75157f5c8c159e6d610c3efcc507cbddec789c02e165c121" "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "2d835b43e2614762893dc40cbf220482d617d3d4e2c35f7100ca697f1a388a0e" "d8dc153c58354d612b2576fea87fe676a3a5d43bcc71170c62ddde4a1ad9e1fb" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(display-line-numbers-type 'relative)
 '(ensime-sem-high-faces
   '((var :foreground "#9876aa" :underline
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
     (deprecated :strike-through "#a9b7c6")))
 '(fci-rule-color "#383838")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
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
     ("\\?\\?\\?+" . "#dc752f")))
 '(inhibit-startup-screen t)
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(package-selected-packages
   '(company-box prettier json-mode company-quickhelp elisp-mode vertico lorem-ipsum flycheck-inline evil-numbers impatient-mode emmet-mode add-node-modules-path web-mode fsharp-mode shfmt haskell-snippets flycheck-ocaml eglot merlin utop org-modern tuareg interaction-log rainbow-delimiters sql-indent rainbow-blocks a async counsel dash dash-docs forge rjsx-mode sly sly-macrostep markless ccls flycheck-clj-kondo flycheck-golangci-lint godoctor helm-company cpp-auto-include auctex auctex-latexmk tex-fold tex latex ormolu hindent python-black google-c-style arduino-cli-mode auto-minor-mode arduino-mode ob-go aggressive-indent rust-mode lice ag systemd darcula-theme cyberpunk-theme abyss-theme git-timemachine csound-mode dimmer diredful toml-mode org-mind-map focus helm-dash tidal redshank gorepl-mode gotest dockerfile-mode shader-mode glsl-mode lua-mode phi-search lfe-mode helm-clojuredocs browse-at-remote gnu-elpa-keyring-update spinner ace-window helm-gtags minimap csharp-mode spaceline gitignore-mode imenu-list ggtags peep-dired cmake-mode cpputils-cmake flycheck-rebar3 erlang editorconfig multiple-cursors company-math latex-preview-pane elixir-mode sclang-extensions robe cider web-beautify go-guru go-mode elpy paredit jinja2-mode yaml-mode ansible neotree auto-complete company clojure-mode yasnippet dummyparens extempore-mode chicken-scheme))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(pos-tip-background-color "#2a2931")
 '(pos-tip-foreground-color "#d4d4d6")
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil))

(setq straight-repository-branch "develop")
(load-file "~/.emacs.d/azimut.el")
(put 'downcase-region 'disabled nil)
