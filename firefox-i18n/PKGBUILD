# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=firefox-i18n
pkgver=129.0.1
pkgrel=1
pkgdesc="Language pack for Firefox"
url="https://www.mozilla.org/firefox/"
arch=(any)
license=(MPL-2.0)

_url=https://archive.mozilla.org/pub/firefox/releases/$pkgver
source=(
  "firefox-$pkgver-SHA512SUMS::$_url/SHA512SUMS"
  "firefox-$pkgver-SHA512SUMS.asc::$_url/SHA512SUMS.asc"
)
validpgpkeys=(
  # Mozilla Software Releases <release@mozilla.com>
  # https://blog.mozilla.org/security/2023/05/11/updated-gpg-key-for-signing-firefox-releases/
  14F26682D0916CDD81E37B6D61B7B526D98F0353
)

_languages=(
  'ach         "Acholi"'
  'af          "Afrikaans"'
  'an          "Aragonese"'
  'ar          "Arabic"'
  'ast         "Asturian"'
  'az          "Azerbaijani"'
  'be          "Belarusian"'
  'bg          "Bulgarian"'
  'bn          "Bengali"'
  'br          "Breton"'
  'bs          "Bosnian"'
  'ca          "Catalan"'
  'ca-valencia "Catalan (Valencian)"'
  'cak         "Maya Kaqchikel"'
  'cs          "Czech"'
  'cy          "Welsh"'
  'da          "Danish"'
  'de          "German"'
  'dsb         "Lower Sorbian"'
  'el          "Greek"'
  'en-CA       "English (Canadian)"'
  'en-GB       "English (British)"'
  'en-US       "English (US)"'
  'eo          "Esperanto"'
  'es-AR       "Spanish (Argentina)"'
  'es-CL       "Spanish (Chile)"'
  'es-ES       "Spanish (Spain)"'
  'es-MX       "Spanish (Mexico)"'
  'et          "Estonian"'
  'eu          "Basque"'
  'fa          "Persian"'
  'ff          "Fulah"'
  'fi          "Finnish"'
  'fr          "French"'
  'fur         "Friulian"'
  'fy-NL       "Frisian"'
  'ga-IE       "Irish"'
  'gd          "Gaelic (Scotland)"'
  'gl          "Galician"'
  'gn          "Guarani"'
  'gu-IN       "Gujarati (India)"'
  'he          "Hebrew"'
  'hi-IN       "Hindi (India)"'
  'hr          "Croatian"'
  'hsb         "Upper Sorbian"'
  'hu          "Hungarian"'
  'hy-AM       "Armenian"'
  'ia          "Interlingua"'
  'id          "Indonesian"'
  'is          "Icelandic"'
  'it          "Italian"'
  'ja          "Japanese"'
  'ka          "Georgian"'
  'kab         "Kabyle"'
  'kk          "Kazakh"'
  'km          "Khmer"'
  'kn          "Kannada"'
  'ko          "Korean"'
  'lij         "Ligurian"'
  'lt          "Lithuanian"'
  'lv          "Latvian"'
  'mk          "Macedonian"'
  'mr          "Marathi"'
  'ms          "Malay"'
  'my          "Burmese"'
  'nb-NO       "Norwegian (Bokmål)"'
  'ne-NP       "Nepali"'
  'nl          "Dutch"'
  'nn-NO       "Norwegian (Nynorsk)"'
  'oc          "Occitan"'
  'pa-IN       "Punjabi (India)"'
  'pl          "Polish"'
  'pt-BR       "Portuguese (Brazilian)"'
  'pt-PT       "Portuguese (Portugal)"'
  'rm          "Romansh"'
  'ro          "Romanian"'
  'ru          "Russian"'
  'sat         "Santali"'
  'sc          "Sardinian"'
  'sco         "Scots"'
  'si          "Sinhala"'
  'sk          "Slovak"'
  'skr         "Saraiki"'
  'sl          "Slovenian"'
  'son         "Songhai"'
  'sq          "Albanian"'
  'sr          "Serbian"'
  'sv-SE       "Swedish"'
  'szl         "Silesian"'
  'ta          "Tamil"'
  'te          "Telugu"'
  'tg          "Tajik"'
  'th          "Thai"'
  'tl          "Tagalog"'
  'tr          "Turkish"'
  'trs         "Chicahuaxtla Triqui"'
  'uk          "Ukrainian"'
  'ur          "Urdu"'
  'uz          "Uzbek"'
  'vi          "Vietnamese"'
  'xh          "Xhosa"'
  'zh-CN       "Chinese (Simplified)"'
  'zh-TW       "Chinese (Traditional)"'
)

pkgname=()
noextract=()

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-i18n-${_locale,,}
  _pkg=firefox-i18n-$pkgver-$_locale.xpi

  pkgname+=($_pkgname)
  source+=("$_pkg::$_url/linux-x86_64/xpi/$_locale.xpi")
  noextract+=($_pkg)
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

prepare() {
  sed -n "s|  linux-x86_64/xpi/|  firefox-i18n-$pkgver-|p" \
    firefox-$pkgver-SHA512SUMS | sha512sum -c -
}

_package() {
  pkgdesc="$2 language pack for Firefox"
  depends=("firefox>=$pkgver")
  install -Dm644 firefox-i18n-$pkgver-$1.xpi \
    "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

b2sums=('b86117a7631193f9a2d2bceb35c5cc78f529288884d147acdefc766cda1c5a1b43db714988df62b491d097e47e0c3e6b4268441c011c1d1e5e77721f04862664'
        'SKIP'
        '1bf400d04a11d92e935f39ff1d0d667337e4f3467d3c23afc83eac072c876fa3ce27ef094e37386e700a484e6a85313c24608bda4f3aeb6e0347b9974cda3825'
        'af551df18aa2d22702084c5a3d44b2d13e95908723973b3f9013693a464b030890a05f8368eaf20ca566a71f5ed74512a298a877453f76913f9aae886c8da227'
        '528f5baf0c7aad059c486c83f94333edf24f2b4b38987f23cae90ff0ba4f64ce9fc3fc933dc1b29f3cc9023a14de7a62e4211733354a1bd0713d2fc7c7a465e7'
        'fd315b78f59e3637b1633dc2311ad13e5d524b441f1faf8d1cca199bc456339174a386d627decfe561da600fcf7fbfad3564169b42bd3c50a13b680197cc2343'
        'c6f1e430609e2188ffdde33f6205477a75422480499919eb12c51547ef2239b778671fb2e2e7ec4a544b26e5c1e055624104d0596656f3a9bccd35342417e38b'
        '7bba0415ffba2b4b40aaafcf40af859421aec43ce0df6fa07e65315650da4525e4c0f609b0a8ce4a0b2944fe31ca0eb5fc5d1d052b7024bcee832008ce6e32c1'
        '4b53dc0ae6353911dfae66864cf254dd4113a37a8605b66cebda8f4be3800b1c95c2daa054f230ebab6715726356ac10aa65e82f0143c10a41b9f30e6b96b684'
        'a0dd3973ccf6468ff0f10e68c2c85525edfc49fa9e85c391db7360ea19430cf3edeb01eb3f8c09f3cd09a8e2670b61abb0d1fc10233e5cf8cf887277b1f43de8'
        '30807365f0d737a1887b33c94ca78cf8cc1200bfdc3a0d66d03ea45ad1fbccd0a204ab3dc0858ff80552e1cc9615fc765026914cd31a9fe02f16bea5ef198ade'
        'dda4d91c881a795ee6ab2d0188ca4c8be4042d1c2b9c4c23577cea1b3b642cd484a1a90a354100612bd913fbae9ce15438539c9772c51569754dcaaa0df3ae72'
        'b0d9897a2d987b3f20d6ed165d41c8982f2a63c0ce1837fc4e0f41ddc8516002bee6d7d565d403ed8fa96189d505eaebf879049c77ea04b92c2a5ca810d35a23'
        '5a17782d69e50e9388c5aef3e3376381bec44a8a5d64f3ca3e49a9f4ca4dc3aec3765b156cfce6ac358faa679fc3c233c736553c8d08a4114719a645ce244366'
        'de03d04d8b09651fd8329a6979f27ed7c88ee2e003010f6723fc9fc81ec72cf7c4e8a349f5744fc1f1fd67653d769c365c3c86f8f9f7058278fc285fac065ed0'
        'cb7f40cee94b1cfede1f3e0509e3c073b7323ff2e7405d473a88a606a8886e47b4c4b3307dccc9db40bffc325dcb02dd5d95df23ffaa84b3b60ceb4f2bea07f3'
        '3e3a51161026e1713f721a12e7131af95404ad36049837e955cbdae05c2e913483155383f1bd8b77ad8143e7b9bccf9806b899c12bbe6bf56ac71662260552cc'
        'e99299a027e7c8594fa6194b5b1fbe256c933d383fd2100938568b35d3a7c1851196ab4eae1e8584517e6368bed5a653cded04fbe6fc3b7bea0888bd3d5a734e'
        '5c5df91ad11df90d8cacd5a4cff3f0cd3c6f125d7edd54fcf60072c584c82488f6020bd86196d3eb5f74767430872580737beef4400e9cd285560eab6fa06cda'
        '854b59464263b31886d58116a2563cdd4398eb1efd448508db71909981b5b75fe06aaa295d39bdeecafcaf64fbab7cf4f66229fc8d91ef7e9076bd34a3eaa185'
        'c140321c20059ec8c00c9871f89bfdaf7474889936496c4eb44d0b580548c29fb75b270fe92d6cd409805ce27fbb62f4d8a990cb0eca0e55210aac0c470a48b6'
        '43c751c24341c0cacab30d88faacd7f85fb2098c62ac39fbf89e8a56f037fe60e44a0f971613249c89da83f7388d410e15a0c0f564bba0fa3a684a90fc1921ef'
        'e5729f83a9420b4d4b30c8d7e1af810c940a96fe21beb80817c569a40258ba626861823ce9684ab7acf89d706284d267513bf6e038345fa637db8eb0e12afded'
        '6c86c26037ad3655bee98d7c4a561d43dd7fb1ab740fba559758d89e694574ea92c2b1a0d5e10d6a7b1ae15e8561310e0bfa8995e94ad784aa78c3e0f46580cc'
        '48d3e49019acc24e23cdf0b8cd8a950a26eb40c9b752a87308c36dcdb83100134867f842f8fcd52c6a642776f5b93930f49d57dc3ba66e8552be28dedf888825'
        'f171ad8a71b30089f8e9685264f94a2b4c2ac37fc22896a472084152f368ce251adfcf7b09868c74730e92ecdb1225aa22837576fafbf38ca470bf67a5846f11'
        '1b486eabd8cf09e33603c2dd0c515cc5442917367dbf79198d1bef0fa39c4b6cb8d28f826796755fc45d453b278493c6c0de6a77984945b945a222673959c41d'
        'a8c07e26cb529a486de0fef592e76e08a24fff5df853aed110f45c1c70002e446fe21a8098428b4b0a944ffb2ba6645737068b5e5d4499c71f73dbd4e440bb97'
        '7e29a50f2e8a7c83ce12a46257a8b7e252a6d1f2491adfd22ccc52b8abac4c5fed41272eba9ce749a2403987d52c68b99f74de2b140603eae875909767e2050b'
        'b0121faa225b09c0993b9d55940af36e6fa4ebca1edb06a8dff5e4beb20791d5e5157333781dda890f10424f63124b0e5d357907b62e2df10eb95a2dfbaba2d0'
        '2c6abd2d1f0e130981fcd1ac39eb0264a6cd5f495950e406698decbd5f8842a8e4fd8000a43ac9aed0a07abb51118bedc33041f455448e776c4d5a44940c1def'
        '6a215d0f29cc57264fda64b633b97caf90def36b9d30ff9542eb336f750366cf02240970430a58fd9b9dd83991442fc23e2b7e09aab6f420c5b4b83e28da07eb'
        '2a3bc28ceb76ab5ea94f524b1b2b3003ac02e04297b19212b011e57a4453be6618ba0531e3809cd8d094f4deaa39e48e2f1b28411fa9bf681ac64c8419142b41'
        'ca1d42bdb9e7f181e01d1f09ff8d2cc4a82d243fbbf7c99c3e03dbed62a6c3ff9476b3f428e21650fe112cad7c95383af173afa4fd624866b916235defbf6453'
        '3db7001071af69865efc7388d8dc3afa387d8897bbf87a843512a51d5f17bbd72efc6da22bdc22e19f9e01bb8f3cb0fdcb91a5c625f2e52224e12e977e46570c'
        '075e85a273a8702c13a57c57596424852c462d85c8132ccbe9d1fe4bf5d75592304b1d9b554f84d008e8055cff0cd8ff05f50d58dae4d1de63f17b0c70ce2b92'
        'f23236c24d9b50377bdcb5825999e6c4b855503b302a43169fdf5443e07e24804291ec7001480cc3d6ad564c97f9fb4bed198b72f4833a0d53bb5cef7dc70848'
        '58842827f65cbb3758bc3073752da321ed801e3509ab118820077a1df7d04cefe9c0bd1c310fd0e5083d1029704ff9abde7288d6bd4660e65b4676f355537b95'
        'e5f9224cba4e3db16773ca6152a8c0693b0bb6bd1942eb159492651cc5f1282eb5808c35c3b02346f38486d50c8ed3e743e8cdd0c43db92e5b2d16d50b25d89d'
        'af2dc2be23ba83b28604d924b3bb45a112a66e714637a1fba8a67dfc5c83d83905ad953f92d84bf85bfacb1a4d26e01dfda32e5aee0be507b78622f08126cb69'
        '84ed6dd3a5310d4b9a0c6070ccc757a306f864a26ea93e4efd2e17eda6e1080b5ff19fd75a99780684f2a7ec99afc757263b758ff8dc20964e6e2b32e2a44538'
        '27726aca9297137f0a65939b49379485f48692fa05b9b170869452057e342c125348312dfce07a34f5a02912cec3cd5bf2ef75218ca728e9354ed54e811f3fa4'
        'd7be7ea6ef906f633a4ec60c6954764879a3fb25129c928ed7806f97c28d15f1c6ece9dbb63410f3d7a3632a9ada509876801b6c546ba71253dc1a83c76f7a69'
        '6b1019925046ac1885358896b169625c2b1317b96f0259f4d2eb2a964a913a70ab85b3218aedbff19a5443aeb57e5102d6a4b9bf985c251eb79cb14b6d15ba82'
        '55e37a33508edbb3e22bb9f34cf92436a110b2d7651df01232a894621ed653b08614540b148f0f500f03fd40169726e0f658525b3d11b81e023ccbc719a51e24'
        '5d95ae7470fa1af451dab642251e620e99727ed9d5f5c2664d1c72c5ac35ed49a7646c4029e450a7666df8087c147b5d3d849f90ca5ddb04649a8d219eca43ad'
        '802f8fd9d9f2e1c5ede6f162000fc3bd49afe9a4ebf2cc816351b4a3339155c911565021c25663687cce420355c3313537c058c136e39e19b6b21af948fe51db'
        '34fb48e146aec439944849560837cd3541c1e3bd4d4588e9aef01f3dd5e009fcf2b3ddbffe0c570367f281f143fad862c5338dd099bb3e40f1761901427f152f'
        '23140d16794aae5b0ed9dc1fa1244dd60d62d0a9c995e7154d4c7af8276b453ee5effd5f8412a7189596fda95e84087218835864188c5e81a51ff429b2dd3765'
        '4b0d1cda70a3a5298c173516a29ac645b18b1660c4ce752b100f3d87c952080313306a8abd8fd36ecdb540a32f7336619613f9b4038b6c6c9c604479bedd0f26'
        '0d958a1a8f728c70097e8393b831b234ce5774fee6478601b2997286638014c4a716e2e7a814a99c1f3beb76cdec628c57c72d9102c22d31e104975e74a62349'
        '3394a770de2b98452cc58b98ca9d00b6390c773e9483270235d26445bdb9256f471d7ad7202d1f856e1a6103be0e637277f76ad02938ff928ef7c6f8d1b5b5ff'
        'ec6cff3f29c867cccb1ba97b3ecaf25fc623e644fc05a9fb059094ed6d1e7b6f89413115f1cf8c497a082f7007364a06ac33ea655ff69fc4f43436aea224ffea'
        '0faa398029ed46d1edc73972be8a2303adac5ae0134ea0f0d717ef12db3fa17d1119ee370b71265634af62fbe95971ba1a4bed0eddc3bf8490906de5ed79c6ea'
        'da553f260971ccbbbab99122faa816dc304a438eaf7edac083cfc99bce17fb63ab7f864e1a1cd5126ef7a8d89a25610cc8deb280ead21fafb4d7d465878c19c9'
        'e1826f655870243a973f3054cb79afff27c3f7548035bb5ed7083fcd3bb0dcaaa21e478e7ac7588fa7f4199df76289494ebdbad1d0a1721fc7bd8ef5879bcb3a'
        'f927b7c58b91a8f1ac94f3f0c6e48b8efed8eddc4af3960d69a7fb3d17de1c4540a982e0b9ab5cb4c92c358573b83c0553568ed3be89b3119d3bed4f73dd5483'
        '1b8074b0b870a6a66637d8851422613d95119694bdf525160d155b519a18f85a1b8678a4b3d5e091ff61ff728a9d0cbf90496669ab1af3de5177509512065113'
        '341e75a230c26d3ee7623b0b6afbac15b36200d6f919624159600a3394cd8127af8ed77a47310bf895bbed721b00020d8831e05a1315678755bde7b2a328d9e0'
        'a68c441db4d9e2a1cf84cce9e46283269336282a2bfcc7cc1ebfcbeeabdd6f5ee1557fb624b5dfa8bb7365eec6c1f00874cc67a4745f5721f46d71742f0a1198'
        'a412bb332132e2805842d9bdc716d9323f732b3ccaeb8e612dd6a4a576dde57768e6cc026477c618d6ea4bf79601cfb0fce909834e4196152efd7aac6765a27b'
        '352543b71ea1aec10fd127997437f81f07d0b7d55142fddc4da5c8246a860c51e15f2c0953aa65a64a5fb276152cfdc719047e4065ff370d3b52d258f134479d'
        'd869d4011e9b26c72283be3a7e439efbcd716f3ac7f619d1020711b2a2ca300bf2313d5def1b9666f0e9e14397684f3eaf66c61f49929c9aa1e256eafb257c0c'
        '7ca49f40963320653ad8b2600dbf160f15d5bf9a7837a2367643b633840afb278a0d2ac99276e3c888b7d422e1dae26776510f335f7f46250cedc3f022708e90'
        '7e15b0bc6ce1566a2d311f2f761be31d892ddf3d0e00cefd54072352ab887d93ece496ba6c8deea92ced91795731e9e61b8ddf98bf0350629fa86e1104868aa3'
        'a5c0ac2d1d714f51459faa8287d18db33c7938a780b391c1a510c935ec6031838716fb42d842e202354e18f516f2b9dbd9b93870a85bd69b34aa53108c28cd10'
        'cbebb504804e3493d62e43be9d99be2e296ac38c5984d1ef26e4bec1e89bbdef76b0abbc5a1cfa5b07bf6b7c6ed51ab98d984ed79f9c2803ec9841edd66f966e'
        '04787e8c149b24d9d0e7f1f70dcbf464b28eec830fe269405f6a14eeade139afd5b1ef1fdb2bf5f561246e0736eac771a5ac35dbdf8f04de2ad863514ccbbc08'
        '2f1c45451c9a7803f478af15d4e04c0868d8d98f7ebc483f863f87acfaebb7759b3f060761fcdbba941b7f4978086d1614ac0cb2a9aae88c83ca56265f619587'
        'f9f09451f35efa1950f4470644b6ad9396e4c073af80c8b10335e82c43c98bafb138defdf4837b21d6c182095492368577b33ae7d60503a3ef17ad2d078dee27'
        '8b306a92cbb8c3359af0d550979598c5416355c12264e26dfc961aeb6d3901290d70aef99e3e49f391dc8b8eb8ae3983a8df32b2abac1810562e3a4428002753'
        '233686ef25b00d5bc552c40f126df33310793abf29504c57a0d42e0a2846636ce55ad2d905bfb16aff3aed2927a750808cb6c12de3982f994f6c63cd3566937b'
        '8e3a1036a7913942a040caa75472238dcacbdfc1eef6984f750350a2d5af006cc205b3eef8dd5d0033fcf92bdace993d7992a24bfa863d06cc293261632c71eb'
        '5028addd444102cc3beb15f1fbfcb7a32925fa5104eb1b0a9e125c115c0da77bbf8e26119485ff86fc966b80200a43c925b457e3f0dc0b6492de122ba7ed4cd9'
        '3aedbae07d5b7988b3bc997b8255fceac60a4b884425d7a9ffa9b2edd179f68ba7771c7de1eb88c58058b0d35b5136489a4abdfde0ce54bc8d0f2672cd27153a'
        '28fa48ce6e89de74a3cb7e9499089d339023cf86ff2205bb6a2fb9ffa05573199fe7783f8a4ac2a453381a006df782cf18ebcffc4816eb2ebeb32019321333b9'
        '3feb509d7ece9aafede83d3f92021eac119b8b615b35dd5434a098613241e1f00bf68dceac0a4a8e9e9faec88ea80312392a808e9693325caa8dd8923836849e'
        '8358651d9bcda9d9ca044e92f775f0c53f8ea0865e725f67933b8a5283785bdb512c7c10b6d66c65303964b996ed0868bfdf121d8f9bdef7d73d0da3ed89cb0d'
        '1f84ccc179be0fc91e65cd3567535afa90ec32cf5fd06fc72d900028b7145c01ee3c750a36b25b8b06b3ac23a7f271286432e027a068f7093ea1389b8f057388'
        '146a7f12e61e744cde9d4886eb327f0973b97658568cef5ed78d6ef94373154d5aee4d8b098993710efd113f71831ba6d17ccfe0295da89ff637fa8b22b5dba5'
        '3f86c784cff3f7c8ea063d3fc662b2bd37ee4d96b5d019d4cf228b7c62a68dabaa6dd028dc3404eb9df275e3c6b4973b8e628eef5e7a080b58484cc9a51f8d97'
        'fbbd3f18175203e2ba014e4b968e6e69d2a8dd7e1cd8ddf7884873ce8b36c0574ac4bbc2307fa64cfffef86b800dace882e34dcdc8b0eb77aa5587dfd5a92884'
        'c4f017139a9cdcd1a7aa512fccd3a31646d5b5c19123368860b2d70157d98ddc72d2a1c353c23cd5c79a5e9e63f84726b7263efb67e4c864a3796f7f4cae8284'
        'ead6474886f1b1de2120a131ee0d4233e831d4d5328fed2aceecf6c741197a904dcb0b7e4e9e714ad1302a68065eb6fa021d1bba3ec0f44c2a4e444f2ef78fa4'
        '75e9796f333f8bada8cd74858a1934177e68e0d0e8b0c1ec7c264372bc197726e2a877e1be40d4fdba5f4c186a360e62e2e599801f946ed5be129b05afc3c33e'
        '42b431b7e1baf3a53c2612f965832b43063f6ead342de9259f0a4e8a922bb2555135266027e858616477f580c08b4ba3e7948fd6d0fa90f4627aa0aabdc49cf8'
        'fa9cd55cb6fa0ac7c784aba1612446e1b202b82c61a21e97c53b0f38f3ca6b773cadb849d625561f72f2f9343fa06744baf6cf599e62e53365eecb2c90942908'
        '03b4398710c0f2125456c5c3845d53666954b9d61f498f1019319467000af62859b0ddef3f5296e9b57103568165e5ef1f07268fcb549356ad6370c48bd38def'
        '0a4e2407a1cdb527921bf4d76bf2d2b7495ca7cb0ef29aaeef7dcb4588ca5a92b782f786b202e08f85750604ca3efa75210a47ca4d2a5885824d3a92bc51ab83'
        '8fcc866c3b2dc29230b78854185350dfbab0a0e977b788e56a86f2307718b3ded9e550e7eaadcf93d0a562068d7613ebed017a99f0ee4a82511979ab3c339d7b'
        '3ab91fc172d934e6beaab8cee50aea44a816f3d10d9bde40f1adb9b6d542e4c35fdfcc7bc97aaa279a7c4e3a97dd2ef19c554a7f11ed541ad8d42e20d6ffb732'
        'bce4f91dc8583dfc1eb2f1e4fbbaaae79a2fc27468f52dd6928eb0ebc2c22c121b63bfdf6f434ba9755d601beee0aed579e6a82044bc013c6f24c3c7b4645eae'
        'a95d7efaed3d917c5ad1dc429965cfccfdb7c02a169257bd228a47e97d7caf1b83e0e8e5365f5ad6d4a98c46a1185e51719464195f2d79af9fd8e3d6afd979e8'
        'cd528f3df08a787d79d98d2757577ce02f94ac62c07f1d3c9abcee1574b065069e96a6bfb11ac247f1165301162c4d5c8381f7aae18987b7ee1357f1efbebe8d'
        'd2832b0e8610a5eb774186fd3f99e4904107f7c8dbbb62608530a9ac2e0924d07882a29cd346a3cdb67aa67cb1aa9a9e2f260280013126ed131e09cbd4a86d89'
        '520a3a743665621e05606be0de18a6360e167f447fdf83d3271fcd034059188650321ad464fb4cda0f92260c5b25ed9d9dd068c66e744d6e16b63d5ab79849ae'
        '8fe509b61b32e57a483e01b39a303a87e6555a3fcce70f6ba19834499e82c5cbcbe1e308257b1d5459e915207940c4c5ab4bdc243a5bfac0e4197933865c43cd'
        '1031164022990dca404c6ab5199c94c5bc730810c499b0a332ac5e4a1e411b97f7e531958f9b0448ac755d830dddfe7ce093cf97517dc18bbf9ba084a1fd8a10'
        'c6e06569b6bceb41ddb9da28c722d2a542549d3a227740e73d3a6fdee8bee3519dbb45d854b19d3488a193c59c6f90428ca5f573620c294097c968fd88b6336c'
        'e3dd2b0bf06e060faea6dab6ba5b89a5f841b946d0637a5603269eb31b39f00352f754acad3609eae4b244d94ec717a3e9b6750ba71fd30508f0cf301b2f3623'
        'd4f217f97b1562f3ac371ff0631219659b3dc32851ebbc7960f4645f23b25b341577b53d6731f713f44a95e45954c03edb7c05e1e9087324d8f5b0f4f94b8fe7'
        '953ff69fc4a9020458b49c0a016957af071105896f571643352a87afaf52c6a533c4d6e8755a1d2ae36bd29bfaf19d9bb52516b083835ad2cfcb2ca144447cd3'
        '882dfe172ee101d73e8f1d4766721ebb9bd9c50ebb2e8a20f395368b9bb170406d8e775e3e3ac754e8d7fa7610f1a2a2114a11b2e22b7c6c7d3633927503a075'
        '5dae54b24daa3bf7edc91cd5f1c06522a148312f9e9e79926464743dfb6d83ac940b6dc72c0ac7261b79da9b92af0f3b534b12f0c36e2631268e80592691ac8d'
        '7b1132f1472ba56fa5ad8b090da4d275dd6aa6e00ad2c26dbac42ae2beac1209cb70d79232dd9aa2991bede17f71967d4bac48064757120f53c473d7b2546a35')
