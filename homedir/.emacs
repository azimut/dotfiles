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
   ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3"
    "#dcdccc"])
 '(auth-source-save-behavior nil)
 '(column-number-mode t)
 '(company-show-quick-access nil nil nil "Customized with use-package company")
 '(custom-enabled-themes '(doom-ayu-dark))
 '(custom-safe-themes
   '("9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9"
     "166a2faa9dc5b5b3359f7a31a09127ebf7a7926562710367086fcc8fc72145da"
     "dfcd2b13f10da4e5e26eb1281611e43a134d4400b06661445e7cbb183c47d2ec"
     "e4d4cc443964b8a64defc06de3edb2363f7cb1b3c3ae2272b2c1487f626e4318"
     "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0"
     "b99ff6bfa13f0273ff8d0d0fd17cc44fab71dfdc293c7a8528280e690f084ef0"
     "7c3d62a64bafb2cc95cd2de70f7e4446de85e40098ad314ba2291fc07501b70c"
     "7771c8496c10162220af0ca7b7e61459cb42d18c35ce272a63461c0fc1336015"
     "5c8a1b64431e03387348270f50470f64e28dfae0084d33108c33a81c1e126ad6"
     "d97ac0baa0b67be4f7523795621ea5096939a47e8b46378f79e78846e0e4ad3d"
     "21d2bf8d4d1df4859ff94422b5e41f6f2eeff14dd12f01428fa3cb4cb50ea0fb"
     "088cd6f894494ac3d4ff67b794467c2aa1e3713453805b93a8bcb2d72a0d1b53"
     "fffef514346b2a43900e1c7ea2bc7d84cbdd4aa66c1b51946aade4b8d343b55a"
     "2f8af2a3a2fae6b6ea254e7aab6f3a8b5c936428b67869cef647c5f8e7985877"
     "f1e8339b04aef8f145dd4782d03499d9d716fdc0361319411ac2efc603249326"
     "b7a09eb77a1e9b98cafba8ef1bd58871f91958538f6671b22976ea38c2580755"
     "e1df746a4fa8ab920aafb96c39cd0ab0f1bac558eff34532f453bd32c687b9d6"
     "4b88b7ca61eb48bb22e2a4b589be66ba31ba805860db9ed51b4c484f3ef612a7"
     "7de64ff2bb2f94d7679a7e9019e23c3bf1a6a04ba54341c36e7cf2d2e56e2bcc"
     "72d9086e9e67a3e0e0e6ba26a1068b8b196e58a13ccaeff4bfe5ee6288175432"
     "19d62171e83f2d4d6f7c31fc0a6f437e8cec4543234f0548bad5d49be8e344cd"
     "1bc640af8b000ae0275dbffefa2eb22ec91f6de53aca87221c125dc710057511"
     "87fa3605a6501f9b90d337ed4d832213155e3a2e36a512984f83e847102a42f4"
     "fd22a3aac273624858a4184079b7134fb4e97104d1627cb2b488821be765ff17"
     "2f7fa7a92119d9ed63703d12723937e8ba87b6f3876c33d237619ccbd60c96b9"
     "f253a920e076213277eb4cbbdf3ef2062e018016018a941df6931b995c6ff6f6"
     "2ab8cb6d21d3aa5b821fa638c118892049796d693d1e6cd88cb0d3d7c3ed07fc"
     "d12b1d9b0498280f60e5ec92e5ecec4b5db5370d05e787bc7cc49eae6fb07bc0"
     "e14289199861a5db890065fdc5f3d3c22c5bac607e0dbce7f35ce60e6b55fc52"
     "921f165deb8030167d44eaa82e85fcef0254b212439b550a9b6c924f281b5695"
     "6963de2ec3f8313bb95505f96bf0cf2025e7b07cefdb93e3d2e348720d401425"
     "2771ec93656faf267521dce9ffe1a6ad88cd0bea87aa0e8c4fc80bf355c58c1d"
     "452068f2985179294c73c5964c730a10e62164deed004a8ab68a5d778a2581da"
     "30d174000ea9cbddecd6cc695943afb7dba66b302a14f9db5dd65074e70cc744"
     "2b20b4633721cc23869499012a69894293d49e147feeb833663fdc968f240873"
     "3c08da65265d80a7c8fc99fe51df3697d0fa6786a58a477a1b22887b4f116f62"
     "350fef8767e45b0f81dd54c986ee6854857f27067bac88d2b1c2a6fa7fecb522"
     "7758a8b8912ef92e8950a4df461a4d510484b11df0d7195a8a3d003965127abc"
     "c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751"
     "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4"
     "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "3061706fa92759264751c64950df09b285e3a2d3a9db771e99bcbb2f9b470037"
     "0d2c5679b6d087686dcfd4d7e57ed8e8aedcccc7f1a478cd69704c02e4ee36fe"
     "4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e"
     "e978b5106d203ba61eda3242317feff219f257f6300bd9b952726faf4c5dee7b"
     "48042425e84cd92184837e01d0b4fe9f912d875c43021c3bcb7eeb51f1be5710"
     "9e36779f5244f7d715d206158a3dade839d4ccb17f6a2f0108bf8d476160a221"
     "2b501400e19b1dd09d8b3708cefcb5227fda580754051a24e8abf3aff0601f87"
     "6a5584ee8de384f2d8b1a1c30ed5b8af1d00adcbdcd70ba1967898c265878acf"
     "9d5124bef86c2348d7d4774ca384ae7b6027ff7f6eb3c401378e298ce605f83a"
     "e8ceeba381ba723b59a9abc4961f41583112fc7dc0e886d9fc36fa1dc37b4079"
     "4b6cc3b60871e2f4f9a026a5c86df27905fb1b0e96277ff18a76a39ca53b82e1"
     "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d"
     "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc"
     "ffafb0e9f63935183713b204c11d22225008559fa62133a69848835f4f4a758c"
     "7964b513f8a2bb14803e717e0ac0123f100fb92160dcf4a467f530868ebaae3e"
     "6e33d3dd48bc8ed38fd501e84067d3c74dfabbfc6d345a92e24f39473096da3f"
     "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d"
     "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     "013728cb445c73763d13e39c0e3fd52c06eefe3fbd173a766bfd29c6d040f100"
     "1f292969fc19ba45fbc6542ed54e58ab5ad3dbe41b70d8cb2d1f85c22d07e518"
     "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
     "81f53ee9ddd3f8559f94c127c9327d578e264c574cda7c6d9daddaec226f87bb"
     "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
     "9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14"
     "b754d3a03c34cfba9ad7991380d26984ebd0761925773530e24d8dd8b6894738"
     "c5878086e65614424a84ad5c758b07e9edcf4c513e08a1c5b1533f313d1b17f1"
     "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1"
     "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec"
     "7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d"
     "571661a9d205cb32dfed5566019ad54f5bb3415d2d88f7ea1d00c7c794e70a36"
     "f5f80dd6588e59cfc3ce2f11568ff8296717a938edd448a947f9823a4e282b66"
     "37b6695bae243145fa2dfb41440c204cd22833c25cd1993b0f258905b9e65577"
     "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290"
     "c8b3d9364302b16318e0f231981e94cbe4806cb5cde5732c3e5c3e05e1472434"
     "691d671429fa6c6d73098fc6ff05d4a14a323ea0a18787daeb93fde0e48ab18b"
     "6f1f6a1a3cff62cc860ad6e787151b9b8599f4471d40ed746ea2819fcd184e1a"
     "d6b934330450d9de1112cbb7617eaf929244d192c4ffb1b9e6b63ad574784aad"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
     "f4d1b183465f2d29b7a2e9dbe87ccc20598e79738e5d29fc52ec8fb8c576fcfd"
     "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7"
     "02d422e5b99f54bd4516d4157060b874d14552fe613ea7047c4a5cfa1288cf4f"
     "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8"
     "32f22d075269daabc5e661299ca9a08716aa8cda7e85310b9625c434041916af"
     "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2"
     "e14884c30d875c64f6a9cdd68fe87ef94385550cab4890182197b95d53a7cf40"
     "a9eeab09d61fef94084a95f82557e147d9630fbbb82a837f971f83e66e21e5ad"
     "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176"
     "9013233028d9798f901e5e8efb31841c24c12444d3b6e92580080505d56fd392"
     "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0"
     "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1"
     "6f96a9ece5fdd0d3e04daea6aa63e13be26b48717820aa7b5889c602764cf23a"
     "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641"
     "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882"
     "4e2e42e9306813763e2e62f115da71b485458a36e8b4c24e17a2168c45c9cf9d"
     "dccf4a8f1aaf5f24d2ab63af1aa75fd9d535c83377f8e26380162e888be0c6a9"
     "014cb63097fc7dbda3edf53eb09802237961cbb4c9e9abd705f23b86511b0a69"
     "38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434"
     "a44e2d1636a0114c5e407a748841f6723ed442dc3a0ed086542dc71b92a87aee"
     "a138ec18a6b926ea9d66e61aac28f5ce99739cf38566876dc31e29ec8757f6e2"
     "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964"
     "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8"
     "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554"
     "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294"
     "89d9dc6f4e9a024737fb8840259c5dd0a140fd440f5ed17b596be43a05d62e67"
     "51c71bb27bdab69b505d9bf71c99864051b37ac3de531d91fdad1598ad247138"
     "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561"
     "0c08a5c3c2a72e3ca806a29302ef942335292a80c2934c1123e8c732bb2ddd77"
     "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33"
     "0c83e0b50946e39e237769ad368a08f2cd1c854ccbcd1a01d39fdce4d6f86478"
     "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68"
     "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef"
     "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789"
     "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c"
     "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006"
     "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00"
     "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52"
     "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25"
     "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a"
     "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a"
     "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da"
     "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0"
     "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f"
     "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443"
     "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71"
     "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78"
     "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22"
     "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68"
     "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725"
     "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0"
     "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d"
     "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039"
     "2853dd90f0d49439ebd582a8cbb82b9b3c2a02593483341b257f88add195ad76"
     "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b"
     "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4"
     "a589c43f8dd8761075a2d6b8d069fc985660e731ae26f6eddef7068fece8a414"
     "2e05569868dc11a52b08926b4c1a27da77580daa9321773d92822f7a639956ce"
     "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4"
     "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e"
     "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426"
     "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68"
     "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410"
     "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc"
     "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6"
     "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d"
     "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195"
     "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2"
     "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259"
     "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644"
     "70b596389eac21ab7f6f7eb1cf60f8e60ad7c34ead1f0244a577b1810e87e58c"
     "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a"
     "8b6506330d63e7bc5fb940e7c177a010842ecdda6e1d1941ac5a81b13191020e"
     "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874"
     "4fda8201465755b403a33e385cf0f75eeec31ca8893199266a6aeccb4adedfa4"
     "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700"
     "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da"
     "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851"
     "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350"
     "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738"
     "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948"
     "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184"
     "c865644bfc16c7a43e847828139b74d1117a6077a845d16e71da38c8413a5aaa"
     "570263442ce6735821600ec74a9b032bc5512ed4539faf61168f2fdf747e0668"
     "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb"
     "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9"
     "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4"
     "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525"
     "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf"
     "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940"
     "919fabfc5cb6165ce07b9d8668f78fe75fe8bd08566006bc87513c29b4f34ade"
     "500244baf96301754cf9f388e33115405b9d75f561dd535c0a26f97a5eab52c8"
     "74e2ed63173b47d6dc9a82a9a8a6a9048d89760df18bc7033c5f91ff4d083e37"
     "5a00018936fa1df1cd9d54bee02c8a64eafac941453ab48394e2ec2c498b834a"
     "06ed754b259cb54c30c658502f843937ff19f8b53597ac28577ec33bb084fa52"
     "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336"
     "e8567ee21a39c68dbf20e40d29a0f6c1c05681935a41e206f142ab83126153ca"
     "a131602c676b904a5509fff82649a639061bf948a5205327e0f5d1559e04f5ed"
     "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428"
     "2ce76d65a813fae8cfee5c207f46f2a256bac69dacbb096051a7a8651aa252b0"
     "11cc65061e0a5410d6489af42f1d0f0478dbd181a9660f81a692ddc5f948bf34"
     "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3"
     "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c"
     "6128465c3d56c2630732d98a3d1c2438c76a2f296f3c795ebda534d62bb8a0e3"
     "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3"
     "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041"
     "b66970f42d765a40fdb2b6b86dd2ab6289bed518cf4d8973919e5f24f0ca537b"
     "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b"
     "f00a605fb19cb258ad7e0d99c007f226f24d767d01bf31f3828ce6688cbdeb22"
     "73320ccc14ab4987fe2e97cfd810b33a1f4a115f5f056c482c3d38a4429e1705"
     "c342ef444e7aca36f4b39a8e2848c4ba793d51c58fdb520b8ed887766ed6d40b"
     "9f9450547564423166a7d2de976c9ca712293170415ec78ed98d198748b44a90"
     "bb28b083fe1c61848c10c049be076afc572ea9bee6e1f8dc2631c5ee4f7388c8"
     "c1c459af570241993823db87096bc775506c378aa02c9c6cd9ccaa8247056b96"
     "6a0d7f41968908e25b2f56fa7b4d188e3fc9a158c39ef680b349dccffc42d1c8"
     "10845272b6fa47a6cdfc49816748bdb1dc1cb9be647801c25c054a8e6a27ef72"
     "643b4d181b6afa4306d65db76889d8b987e095ae8f262a4c71dd5669d39c9b09"
     "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483"
     "8ce796252a78d1a69e008c39d7b84a9545022b64609caac98dc7980d76ae34e3"
     "fc0fe24e7f3d48ac9cf1f87b8657c6d7a5dd203d5dabd2f12f549026b4c67446"
     "c499bf4e774b34e784ef5a104347b81c56220416d56d5fd3fd85df8704260aad"
     "9089d25e2a77e6044b4a97a2b9fe0c82351a19fdd3e68a885f40f86bbe3b3900"
     "c0fef082e36bb01efb44c8becead9f1d56234d61d84a849370195ca26d09cfa0"
     "a7928e99b48819aac3203355cbffac9b825df50d2b3347ceeec1e7f6b592c647"
     "3788e589eb432e6a515d557cbeb8dc4eaca9e00ae54f932b4bd43ed78605532e"
     "a70b47c87e9b0940f6fece46656200acbfbc55e129f03178de8f50934ac89f58"
     "b69323309e5839676409607f91c69da2bf913914321c995f63960c3887224848"
     "f7b0f2d0f37846ef75157f5c8c159e6d610c3efcc507cbddec789c02e165c121"
     "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3"
     "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183"
     "2d835b43e2614762893dc40cbf220482d617d3d4e2c35f7100ca697f1a388a0e"
     "d8dc153c58354d612b2576fea87fe676a3a5d43bcc71170c62ddde4a1ad9e1fb"
     "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088"
     "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476"
     default))
 '(display-line-numbers-type 'relative t)
 '(ensime-sem-high-faces
   '((var :foreground "#9876aa" :underline (:style wave :color "yellow"))
     (val :foreground "#9876aa") (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline (:color "#808080"))
     (implicitParams :underline (:color "#808080"))
     (operator :foreground "#cc7832") (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6")))
 '(fci-rule-color "#383838")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f") ("NEXT" . "#dc752f") ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3") ("OKAY" . "#3a81c3") ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f") ("DONE" . "#42ae2c") ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d") ("HACK" . "#b1951d") ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f") ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(inhibit-startup-screen t)
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(marginalia-annotator-registry
   '((command marginalia-annotate-command marginalia-annotate-binding
              builtin none)
     (embark-keybinding marginalia-annotate-embark-keybinding builtin
                        none)
     (customize-group marginalia-annotate-customize-group builtin none)
     (variable marginalia-annotate-variable builtin none)
     (function marginalia-annotate-function builtin none)
     (face marginalia-annotate-face builtin none)
     (color marginalia-annotate-color builtin none)
     (unicode-name marginalia-annotate-char builtin none)
     (minor-mode marginalia-annotate-minor-mode builtin none)
     (symbol marginalia-annotate-symbol builtin none)
     (environment-variable marginalia-annotate-environment-variable
                           builtin none)
     (input-method marginalia-annotate-input-method builtin none)
     (coding-system marginalia-annotate-coding-system builtin none)
     (charset marginalia-annotate-charset builtin none)
     (package marginalia-annotate-package builtin none)
     (imenu marginalia-annotate-imenu builtin none)
     (bookmark marginalia-annotate-bookmark builtin none)
     (file none marginalia-annotate-file builtin)
     (project-file none marginalia-annotate-project-file builtin)
     (buffer none marginalia-annotate-buffer builtin)
     (library marginalia-annotate-library builtin none)
     (theme marginalia-annotate-theme builtin none)
     (tab marginalia-annotate-tab builtin none)
     (multi-category marginalia-annotate-multi-category builtin none)))
 '(marginalia-annotators
   '((command marginalia-annotate-command marginalia-annotate-binding
              builtin none)
     (embark-keybinding marginalia-annotate-embark-keybinding builtin
                        none)
     (customize-group marginalia-annotate-customize-group builtin none)
     (variable marginalia-annotate-variable builtin none)
     (function marginalia-annotate-function builtin none)
     (face marginalia-annotate-face builtin none)
     (color marginalia-annotate-color builtin none)
     (unicode-name marginalia-annotate-char builtin none)
     (minor-mode marginalia-annotate-minor-mode builtin none)
     (symbol marginalia-annotate-symbol builtin none)
     (environment-variable marginalia-annotate-environment-variable
                           builtin none)
     (input-method marginalia-annotate-input-method builtin none)
     (coding-system marginalia-annotate-coding-system builtin none)
     (charset marginalia-annotate-charset builtin none)
     (package marginalia-annotate-package builtin none)
     (imenu marginalia-annotate-imenu builtin none)
     (bookmark marginalia-annotate-bookmark builtin none)
     (file none marginalia-annotate-file builtin)
     (project-file none marginalia-annotate-project-file builtin)
     (buffer none marginalia-annotate-buffer builtin)
     (library marginalia-annotate-library builtin none)
     (theme marginalia-annotate-theme builtin none)
     (tab marginalia-annotate-tab builtin none)
     (multi-category marginalia-annotate-multi-category builtin none)))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(package-selected-packages
   '(company-box prettier json-mode company-quickhelp elisp-mode vertico
                 lorem-ipsum flycheck-inline evil-numbers
                 impatient-mode emmet-mode add-node-modules-path
                 web-mode fsharp-mode shfmt haskell-snippets
                 flycheck-ocaml eglot merlin utop org-modern tuareg
                 interaction-log rainbow-delimiters sql-indent
                 rainbow-blocks a async counsel dash dash-docs forge
                 rjsx-mode sly sly-macrostep markless ccls
                 flycheck-clj-kondo flycheck-golangci-lint godoctor
                 helm-company cpp-auto-include auctex auctex-latexmk
                 tex-fold tex latex ormolu hindent python-black
                 google-c-style arduino-cli-mode auto-minor-mode
                 arduino-mode ob-go aggressive-indent rust-mode lice
                 ag systemd darcula-theme cyberpunk-theme abyss-theme
                 git-timemachine csound-mode dimmer diredful toml-mode
                 org-mind-map focus helm-dash tidal redshank
                 gorepl-mode gotest dockerfile-mode shader-mode
                 glsl-mode lua-mode phi-search lfe-mode
                 helm-clojuredocs browse-at-remote
                 gnu-elpa-keyring-update spinner ace-window helm-gtags
                 minimap csharp-mode spaceline gitignore-mode
                 imenu-list ggtags peep-dired cmake-mode
                 cpputils-cmake flycheck-rebar3 erlang editorconfig
                 multiple-cursors company-math latex-preview-pane
                 elixir-mode sclang-extensions robe cider web-beautify
                 go-guru go-mode elpy paredit jinja2-mode yaml-mode
                 ansible neotree auto-complete company clojure-mode
                 yasnippet dummyparens extempore-mode chicken-scheme))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(pos-tip-background-color "#2a2931")
 '(pos-tip-foreground-color "#d4d4d6")
 '(safe-local-variable-values
   '((dape-configs
      (go-debug-newspod-gofetch modes (go-mode go-ts-mode) command
                                "dlv" command-args
                                ("dap" "--listen" "127.0.0.1:55878")
                                command-cwd default-directory host
                                "127.0.0.1" port 55878 :buildFlags
                                "-tags 'sqlite_fts5 sqlite_foreign_keys'"
                                :request "launch" :mode "debug" :type
                                "go" :showLog "true" :cwd
                                "/home/sendai/projects/go/newspod/jobs/go/"
                                :program "./..."))))
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil))

(setq straight-repository-branch "develop")
(load-file "~/.emacs.d/azimut.el")
(put 'downcase-region 'disabled nil)
