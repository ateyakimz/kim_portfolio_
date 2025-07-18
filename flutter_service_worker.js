'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "5ebe27b4f8808e7fd8430e6d40be2c23",
"assets/AssetManifest.bin.json": "6b0b0f248ebec03a514ea1392a65da04",
"assets/AssetManifest.json": "27dae60b5b5215ec25eea0cb30463a42",
"assets/assets/about.png": "711e9915261dc2082a7c97760fa1e368",
"assets/assets/alarm1.jpg": "1748f60ffabbd9be5b5e5c07ba318694",
"assets/assets/alarm1.png": "fd64ff2dd9c67ec6bf832a26f724a521",
"assets/assets/alarm2.jpg": "278913496fcd0e649635f69052a1f176",
"assets/assets/alarm2.png": "a05d43bcda6c8faed0a5c64f7f32291e",
"assets/assets/alarm3.jpg": "86ac43c16950db583627758addf088fb",
"assets/assets/alarm3.png": "00c7dd6ea913199e67319e40962df09f",
"assets/assets/appt.jpg": "d0bd19ec05730e54124284cb192e7666",
"assets/assets/appt2.jpg": "97030f28f6ab43a2c4d4d91739666f12",
"assets/assets/appt3.jpg": "c13a607396108e4293f528864abb2d2f",
"assets/assets/appt4.jpg": "afb961e0e3e463f74c491abff75898b4",
"assets/assets/appt5.jpg": "cb69b56415ee9e40ee835c5bdc0ce6b6",
"assets/assets/appt6.jpg": "289549ba7cb83fcba9911f3f0878d827",
"assets/assets/bhhwappt2.jpg": "af0175d61e2954c2f656fd938d8ac22f",
"assets/assets/bhwappt1.jpg": "1ae365425674f8324cb855073a05da77",
"assets/assets/bhwappt3.jpg": "c983bbe314f6a1bb16febd6628731c80",
"assets/assets/bhwappt4.jpg": "39622d3c9b155acc2d132bed0acecb0d",
"assets/assets/bhwappt5.jpg": "6df8fea09133bba158b4db7f331c88b2",
"assets/assets/bhwdash.jpg": "1c6c3a1a1192064757cdf17e2d8ceaae",
"assets/assets/bhwdash2.jpg": "956aac7ceb8ca836587cb5679e52fb56",
"assets/assets/caf1.png": "6e3ba8b2452db78a0e8b6421d8b034d0",
"assets/assets/caf2.png": "54c59bb07ef8802cf5d29c44f1b9335e",
"assets/assets/caf3.png": "c9b1e9ea3b3c7c64ca331e65ce43d5f6",
"assets/assets/caf4.png": "65e19eb48ca7dd3f06ff65b158b929cd",
"assets/assets/caf5.png": "5084c2ee1e53a90e95ca541843462567",
"assets/assets/caf6.png": "b7fa5a81f8c52f968d10d4000dd28093",
"assets/assets/caf7.png": "578f3d8fdb24b885b6cea0ee2847868b",
"assets/assets/capstone1.png": "65b52b32d753cc55f4c23d86b027ad76",
"assets/assets/cert1.jpg": "184b938901fd3d0e49a3495fe419d228",
"assets/assets/cert10.jpg": "f533e43e822151a92c387b17b8857969",
"assets/assets/cert11.png": "6de7678777a87271edc493b7d89d2c6c",
"assets/assets/cert2.png": "5fa04d9ebb61516cfee559dc52bed9ee",
"assets/assets/cert3.png": "430ec9e818f5c89990735297e01739b8",
"assets/assets/cert4.png": "4322dddf734eed82c6d0a2824902776e",
"assets/assets/cert5.png": "200b9b7b9edad847722ab8cd442472d7",
"assets/assets/cert6.png": "d724942dd0369420679bef29964c00e8",
"assets/assets/cert7.png": "2fd15db9cd7b7702b410ab30a670df1a",
"assets/assets/cert8.jpg": "9cd52761cab1966747677a4c49b97566",
"assets/assets/cert9.jpg": "42468c694f1c8fee8a83b535eec643ea",
"assets/assets/chat1.png": "c531046f10c431d1f8575e42923e0dff",
"assets/assets/chat2.png": "d0c0c396c5e56cdb44da843620916acf",
"assets/assets/chat3.jpg": "831774b075276aff3143cca181c479ed",
"assets/assets/chat4.jpg": "906ac003d5e3487f9c94b4596d0b9a1f",
"assets/assets/chat5.jpg": "195a2806a14cdade401f3db682c955ac",
"assets/assets/chat6.jpg": "58564026b64452c0009a4f5b326cc1ad",
"assets/assets/chat7.jpg": "591bb9092d49384282eac7252524c0e9",
"assets/assets/comptia.png": "b974a030eda327452de12178be5b21f2",
"assets/assets/dent1.jpg": "e0a603ce553770179acda1f37a4ba37f",
"assets/assets/dent2.jpg": "ac72f51beabe83b29f090734c9aab46f",
"assets/assets/dent3.jpg": "16f375c7131d1fd95703da30e1d62597",
"assets/assets/dent4.jpg": "e422cd14b2d5dd9adaff69d9804c9f26",
"assets/assets/dent5.jpg": "f15377e166d3889c72a3f1da5c145734",
"assets/assets/dent6.jpg": "04bd7578e92d7ba69bbc68f48e9a293c",
"assets/assets/dent7.jpg": "6d46ecbbc87478b5504fed3d5067aa7d",
"assets/assets/dent8.jpg": "dab3a93605a3a3d89538ada6ed25bc3e",
"assets/assets/dent9.jpg": "4504797c0e5743ce99a78423a038db3d",
"assets/assets/docappt1.jpg": "11065a43d9774899ee8eb8ddc4a99d00",
"assets/assets/docappt2.jpg": "d9f7158b9bbcfca3877f65f04b9498a0",
"assets/assets/docappt3.jpg": "27a3d644d16f949eb52fd1c741e468e4",
"assets/assets/docdash.jpg": "e719d73c28b7c09108f9d48c26067841",
"assets/assets/docdash2.jpg": "1569f7da4cd6a969e5344f9ad3b250bd",
"assets/assets/emu1.jpg": "aaf89339af76eca1f280e004c2675562",
"assets/assets/emu2.jpg": "51041c354f6afcffda7b7fa5798fa3de",
"assets/assets/emu3.jpg": "1cca1b6126ad14716be14f7b550d95fd",
"assets/assets/emu4.jpg": "2162706701a5ed7a0031cd7299df4394",
"assets/assets/emu5.jpg": "e3ab630f6e6ed8ad10f97163bac8fffb",
"assets/assets/faq.png": "f41de4861afbb6384b92a67bb03621f4",
"assets/assets/file1.jpg": "065926ea8493b1f8b5a08677e26dfc8d",
"assets/assets/file2.jpg": "531cea133f0c1192ab3e5747788712c5",
"assets/assets/file3.jpg": "04645c719199e28802ff02231464a3e9",
"assets/assets/file4.jpg": "8e460709b3181509d4e9551bf143c5d0",
"assets/assets/file5.jpg": "8be6109cd7d80d9964ba2226ee4af755",
"assets/assets/file6.jpg": "1287c2d7e19df9c246caf9c24dd9b05f",
"assets/assets/flower.json": "907b1d24d1fbfce91465a0580bc7a724",
"assets/assets/FPRDI.png": "7a8a50e6828fb2847214489878a28bf5",
"assets/assets/google1.png": "e7de0ae41f1eacf64e3e082160ba9799",
"assets/assets/google2.png": "492f000aba22652b29ebcab4b71a4371",
"assets/assets/google3.png": "039ced435d9343a3f5051a8559313d0f",
"assets/assets/google4.png": "db02c4a7f2a30e89e49ce5779cd9033f",
"assets/assets/google5.png": "3bc290ba8772d39ae0000028c269574c",
"assets/assets/google6.png": "f06c6f6852e9ebc9fa21d3509e42200d",
"assets/assets/google7.png": "214e74943791a27ced4f901a401f45bf",
"assets/assets/google8.png": "c1d7fda158cde8adbce730d2e576992a",
"assets/assets/gwa.jpg": "c65bce9b074d31a8014b8593cc29885a",
"assets/assets/image.png": "c82a83560c66e135b63bf36100bf60ca",
"assets/assets/map2.png": "b09eb0794d874c0e398e7cbedf6a5467",
"assets/assets/map3.png": "68e4571ed447453d56e3dc71fd321bf3",
"assets/assets/map4.png": "31c98603af01ccd6a468e53eba82dc2e",
"assets/assets/map5.png": "30519f075a6e17d42c6b359b36839d74",
"assets/assets/map6.jpeg": "8cdd8091e906df32d7c61b97cf5a3259",
"assets/assets/map7.png": "c12a64c8d6cc1f75f18bf0a2804b2966",
"assets/assets/map8.png": "ea0d36aaa3ce355649569021eaaab3c1",
"assets/assets/mp1.jpg": "f1cc930dd48f7f4ccf618a9796e44837",
"assets/assets/news1.png": "cf66ce364476854fdce00abed2488356",
"assets/assets/notif1.png": "aca082e034569459b571bd401a364795",
"assets/assets/notif2.png": "ecc8cebcaf88bd4c5d4ebce2e1c5b538",
"assets/assets/otp.jpg": "1e2f5b4d5efb2ee318f08384b08fb7ee",
"assets/assets/otpnotif.jpg": "171a5bd77125f6bf972bd11167e742e6",
"assets/assets/patdash.jpg": "8d2518e484f077260f6c2447a05cf7c9",
"assets/assets/patdash2.jpg": "daa3b9d4ef07c66ec901f49a098ca4e2",
"assets/assets/privacy.png": "0b8cdcf05706072ee82b286daf1ac6bd",
"assets/assets/req.png": "7149b6f87381314039e8b09bd31864c8",
"assets/assets/result.png": "9cb0c79ad85ee1fdd09e6109b1510234",
"assets/assets/rps.png": "f8208f18432d5ccb126ffe4e852cf019",
"assets/assets/rps2.png": "3e265b622abcb47526838ec715dcce26",
"assets/assets/rps3.png": "1e3366d6343068dc7692aef7b5dc3b32",
"assets/assets/rps4.png": "5fac93cdf81a79a7279bdd21e5dcbdac",
"assets/assets/rps5.png": "ce52e1326f0a1e1ef19da192ffe7f76f",
"assets/assets/rps6.jpg": "58fb66eaf5367878baaef66516ed86f3",
"assets/assets/rps7.jpg": "9562ad9bc9cc21d34c281502f21175db",
"assets/assets/salary.jpg": "3b70343f77f9918c03a480a7d89ef0e2",
"assets/assets/salary2.jpg": "82c51786f1c4ec95d81f0be5eb52a98c",
"assets/assets/salary3.jpg": "ecb0b7d8eb1dd11ff2dc85df197d38d9",
"assets/assets/salary4.jpg": "a58c6314c6058c372351784c2cf2488e",
"assets/assets/salary5%255D.jpg": "933c8e2e742f4026a5c92f78e7cc768e",
"assets/assets/salary6.jpg": "98f3e1be4f926623dcc287ad9201d18a",
"assets/assets/salary7.jpg": "c8b4826c92381a77351deb526d31b5bf",
"assets/assets/salary8.jpg": "f61f642ee13828de705952f1c4636309",
"assets/assets/salary9.jpg": "03876086b4ef6151002ff79a74b13a10",
"assets/assets/sccare.jpg": "4b30e3dc2edf4282c9946568b11e71c2",
"assets/assets/settings.png": "c9c84d18fe83c50f95d1a77312a4dc04",
"assets/assets/symp1.jpeg": "94b09e965c67c1697f58845136d2abfd",
"assets/assets/symp1.jpg": "92cde9c290362124aa58c746a2bc8e4c",
"assets/assets/symp2.jpeg": "be6e4c044bd7c85ce28703d02398dcb5",
"assets/assets/symp2.jpg": "e537bb4a135eacff326ebe117105af01",
"assets/assets/symp3.jpeg": "fef4d45c24de76467aaffd76a54476d1",
"assets/assets/symp3.jpg": "64d1074d3561f7fd7b90c1022fae419f",
"assets/assets/tk.jpg": "611e8457ae3e78bb6f15998e39a9fff4",
"assets/assets/tmdss.jpeg": "8158506bff638cac5e786b78d8283e3a",
"assets/assets/tnc.png": "b614d127517222c252b33e9220bcc31c",
"assets/assets/training.png": "dac4a104df18d8ced2642d777fc211fa",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d9dea29fd979d6c9e79e09960105552e",
"assets/NOTICES": "583f45dbecc23661234e2c44bd5dbe36",
"assets/OJT%20Final%20Report.pdf": "52551f4995e5fa3e7a6c2a7f1bcecf6c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/Pangilinan,Althea%20Kim%20M.pdf": "0c288b6c855d384388e167d559945a6a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/User%20Manual%20Map.pdf": "1ce0874703900d66d8fe1dbcd406c782",
"assets/User%20Manual.pdf": "95af423f543e3cebb95f071f274293a6",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "4f10f7b420a0c3351558e3104833e836",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "6d43466299fb8e100738c11bf77e1c7a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "bf1e45747974a42ebcf850f57cc46223",
"/": "bf1e45747974a42ebcf850f57cc46223",
"main.dart.js": "1957a298d5b7cd32a90f6cf37517f4ad",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
