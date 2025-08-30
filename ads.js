<!-- ads.js -->
<script src="https://www.gstatic.com/firebasejs/9.23.0/firebase-app-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.23.0/firebase-database-compat.js"></script>

<script>
  // ---- Firebase Init (Your config) ----
  const firebaseConfig = {
    apiKey: "AIzaSyAAOYtvC0kiu_vZTYuQ8phPyMqTEFJj9O0",
    authDomain: "new-bike-59133.firebaseapp.com",
    projectId: "new-bike-59133",
    storageBucket: "new-bike-59133.appspot.com",
    messagingSenderId: "966945954091",
    appId: "1:966945954091:web:c1387e3a27af68aef3cd6e",
    databaseURL: "https://new-bike-59133-default-rtdb.firebaseio.com"
  };
  if (!firebase.apps.length) firebase.initializeApp(firebaseConfig);
  const rtdb = firebase.database();

  // ---- Popup DOM inject (one-time) ----
  (function injectPopup() {
    if (document.getElementById('zf-ad-popup')) return;

    const wrap = document.createElement('div');
    wrap.id = 'zf-ad-popup';
    wrap.innerHTML = `
      <style>
        #zf-ad-popup { position:fixed; inset:0; display:none; align-items:center; justify-content:center; z-index:999999; }
        #zf-ad-popup .backdrop { position:absolute; inset:0; background:rgba(0,0,0,.55); }
        #zf-ad-popup .box { position:relative; width:min(92vw, 420px); height:min(60vh, 520px);
          background:#0b0b0b; border-radius:18px; overflow:hidden; box-shadow:0 20px 60px rgba(0,0,0,.6);
          display:flex; flex-direction:column; }
        #zf-ad-popup .head { height:44px; display:flex; align-items:center; justify-content:flex-end; padding:0 8px; }
        #zf-ad-popup .close { border:none; background:transparent; color:#fff; font-size:22px; cursor:pointer; }
        #zf-ad-popup .stage { flex:1; position:relative; display:flex; align-items:center; justify-content:center; perspective:1200px; }
        #zf-ad-popup img, #zf-ad-popup a.linkwrap { width:100%; height:100%; object-fit:cover; display:block; }
        #zf-ad-popup .slide { position:absolute; inset:0; opacity:0; transform:rotateY(-10deg) scale(.98);
          transition:opacity .5s ease, transform .7s ease; }
        #zf-ad-popup .slide.active { opacity:1; transform:rotateY(0deg) scale(1); }
        #zf-ad-popup .dots { position:absolute; bottom:10px; left:0; right:0; display:flex; gap:6px; justify-content:center; }
        #zf-ad-popup .dot { width:7px; height:7px; border-radius:50%; background:#ffffff66; }
        #zf-ad-popup .dot.active { background:#fff; }
        @media (max-width: 480px){
          #zf-ad-popup .box{ height: 55vh; }
        }
      </style>
      <div class="backdrop" onclick="document.getElementById('zf-ad-popup').style.display='none'"></div>
      <div class="box">
        <div class="head"><button class="close" title="Close" onclick="document.getElementById('zf-ad-popup').style.display='none'">✕</button></div>
        <div class="stage" id="zf-stage"></div>
      </div>
    `;
    document.body.appendChild(wrap);
  })();

  // ---- Load approved ads & run slider ----
  let zfAds = [];    // {url, link?, title?}
  let zfIndex = 0;
  let zfTimer = null;

  function renderSlides() {
    const stage = document.getElementById('zf-stage');
    if (!stage) return;
    stage.innerHTML = '';
    const frag = document.createDocumentFragment();

    zfAds.forEach((ad, i) => {
      const slide = document.createElement('div');
      slide.className = 'slide' + (i === 0 ? ' active' : '');
      if (ad.link) {
        const a = document.createElement('a');
        a.href = ad.link;
        a.target = '_blank';
        a.rel = 'noopener';
        a.className = 'linkwrap';
        const img = document.createElement('img');
        img.src = ad.url;
        img.alt = ad.title || 'ad';
        a.appendChild(img);
        slide.appendChild(a);
      } else {
        const img = document.createElement('img');
        img.src = ad.url;
        img.alt = ad.title || 'ad';
        slide.appendChild(img);
      }
      frag.appendChild(slide);
    });

    stage.appendChild(frag);

    // dots
    const dotsWrap = document.createElement('div');
    dotsWrap.className = 'dots';
    zfAds.forEach((_, i) => {
      const d = document.createElement('div');
      d.className = 'dot' + (i === 0 ? ' active' : '');
      dotsWrap.appendChild(d);
    });
    stage.appendChild(dotsWrap);
  }

  function startSlider(intervalMs = 3000) {
    const popup = document.getElementById('zf-ad-popup');
    if (!popup || zfAds.length === 0) return;

    popup.style.display = 'flex';

    const slides = Array.from(document.querySelectorAll('#zf-stage .slide'));
    const dots = Array.from(document.querySelectorAll('#zf-stage .dot'));
    if (slides.length === 0) return;

    if (zfTimer) clearInterval(zfTimer);
    zfIndex = 0;

    zfTimer = setInterval(() => {
      slides[zfIndex]?.classList.remove('active');
      dots[zfIndex]?.classList.remove('active');
      zfIndex = (zfIndex + 1) % slides.length;
      slides[zfIndex]?.classList.add('active');
      dots[zfIndex]?.classList.add('active');
    }, intervalMs);
  }

  // Fetch approved ads from RTDB
  rtdb.ref('ads/approved').on('value', (snap) => {
    const val = snap.val() || {};
    // val: {pushId: {url, link?, title?}}
    zfAds = Object.values(val);
    if (zfAds.length > 0) {
      renderSlides();
      startSlider(3000); // हर 3 सेकंड में बदले (चाहें तो 2000 कर लें)
    }
  });

  // Auto-open on page load
  window.addEventListener('load', () => {
    // अगर ads पहले से आ गए हैं, तो popup चालू रहेगा
    // वरना data आने पर startSlider call होगा
  });
</script>
