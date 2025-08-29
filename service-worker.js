// ZaraFix Service Worker

const CACHE_NAME = "zarafix-cache-v1";
const urlsToCache = [
  "/",             // Home page
  "/index.html",   // Main file
  "/manifest.json",
  "/logo.png",     // App icon (replace with your actual icon name)
  "/style.css",    // CSS (अगर हो तो)
  "/app.js"        // JS (अगर हो तो)
];

// Install Service Worker
self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(urlsToCache);
    })
  );
});

// Activate Service Worker
self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cache) => {
          if (cache !== CACHE_NAME) {
            return caches.delete(cache);
          }
        })
      );
    })
  );
});

// Fetch Requests (Offline Support)
self.addEventListener("fetch", (event) => {
  event.respondWith(
    caches.match(event.request).then((response) => {
      return response || fetch(event.request);
    })
  );
});
