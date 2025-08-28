<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Zara Fix - Poster View with Login</title>
<style>
  body, html {
    margin: 0; padding: 0; height: 100%;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to bottom, #87ceeb 0%, #e0f7ff 80%);
    overflow-x: hidden;
    position: relative;
  }
  body::before {
    content: "";
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    background: url('https://i.ibb.co/2sWjDvk/clouds.png') repeat-x;
    opacity: 0.3;
    animation: moveClouds 60s linear infinite;
    z-index: 0;
  }
  @keyframes moveClouds {
    0% {background-position-x: 0;}
    100% {background-position-x: 10000px;}
  }

  .container {
    position: relative;
    z-index: 10;
    min-height: 100vh;
    padding: 20px 15px 80px 15px;
    box-sizing: border-box;
    text-align: center;
  }

  /* Logo */
  .logo {
    font-size: 3.5rem;
    font-weight: 900;
    color: #ff3c00;
    text-shadow:
      2px 2px 0 #ffea00,
      4px 4px 0 #00f7ff,
      6px 6px 8px rgba(0,0,0,0.35);
    user-select: none;
    margin-bottom: 25px;
  }

  /* Google Login Button top-right */
  #googleLoginBtn {
    position: fixed;
    top: 15px;
    right: 15px;
    background: #4285F4;
    color: white;
    font-weight: 700;
    padding: 8px 14px;
    font-size: 13px;
    border-radius: 10px;
    box-shadow: 0 3px 8px rgba(0,0,0,0.25);
    cursor: pointer;
    user-select: none;
    transition: transform 0.15s ease;
    z-index: 20;
    border: none;
    outline: none;
  }
  #googleLoginBtn:hover {
    transform: scale(1.1);
  }

  /* Buttons container */
  .button-grid {
    display: flex;
    flex-direction: column;
    gap: 12px;
    max-width: 480px;
    margin: 0 auto 35px auto;
  }

  .line {
    display: flex;
    justify-content: center;
    gap: 12px;
  }

  /* 3D Buttons */
  .btn-3d {
    padding: 12px 20px;
    font-size: 14px;
    font-weight: 700;
    border-radius: 14px;
    border: none;
    color: white;
    cursor: pointer;
    box-shadow:
      0 5px 0 #444,
      0 9px 15px rgba(0,0,0,0.25);
    transition: transform 0.15s ease;
    min-width: 120px;
    text-align: center;
    user-select: none;
  }
  .btn-3d:hover:not(:disabled) {
    transform: translateY(3px);
    box-shadow:
      0 2px 0 #444,
      0 5px 8px rgba(0,0,0,0.15);
  }
  .btn-3d:disabled {
    opacity: 0.5;
    cursor: not-allowed;
    box-shadow: none;
    transform: none !important;
  }

  /* Button Colors */
  .green { background: linear-gradient(to right, #4caf50, #2e7d32); }
  .blue { background: linear-gradient(to right, #2196f3, #0d47a1); }
  .red { background: linear-gradient(to right, #f44336, #b71c1c); }
  .purple { background: linear-gradient(to right, #9c27b0, #6a1b9a); }
  .orange { background: linear-gradient(to right, #ff9800, #e65100); }
  .teal { background: linear-gradient(to right, #009688, #004d40); }

  /* Poster Card */
  #posterCard {
    max-width: 360px;
    margin: 0 auto 50px auto;
    background: white;
    padding: 20px 25px;
    border-radius: 18px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.3);
    text-align: left;
    font-size: 16px;
  }
  .field {
    margin-bottom: 10px;
  }

  /* Scrolling text at bottom */
  .scrolling-text {
    position: fixed;
    bottom: 15px;
    width: 100%;
    background: rgba(255 255 255 / 0.85);
    color: #222;
    font-weight: 700;
    padding: 8px 0;
    box-shadow: 0 0 12px rgba(0,0,0,0.1);
    user-select: none;
    z-index: 15;
    overflow: hidden;
    white-space: nowrap;
  }
  .scrolling-text span {
    display: inline-block;
    padding-left: 100%;
    animation: scroll-left 18s linear infinite;
  }
  @keyframes scroll-left {
    0% { transform: translateX(0); }
    100% { transform: translateX(-100%); }
  }

  /* Responsive */
  @media(max-width: 520px) {
    .btn-3d {
      min-width: 90px;
      font-size: 13px;
      padding: 10px 16px;
    }
    #posterCard {
      max-width: 90%;
      padding: 15px 20px;
      font-size: 14px;
    }
  }
</style>
</head>
<body>

<div class="container">

  <div class="logo" aria-label="Zara Fix Logo">Zara Fix</div>

  <!-- Google Login Button -->
  <button id="googleLoginBtn">Google Login</button>

  <!-- Buttons: 3 lines with 2 buttons each -->
  <div class="button-grid">
    <div class="line">
      <button class="btn-3d green" onclick="location.href='https://zarafix.vercel.app/recharge.html'">Recharge Request</button>
      <button class="btn-3d blue" onclick="location.href='https://zarafix.vercel.app/requestbottun.html'">Service Request</button>
    </div>
    <div class="line">
      <button class="btn-3d red" onclick="location.href='https://zarafix.vercel.app/2poster.html'">Service Provider</button>
      <button class="btn-3d purple" onclick="location.href='https://zararealstate.blogspot.com/'">Real Estate</button>
    </div>
    <div class="line">
      <button class="btn-3d orange" onclick="location.href='admin-dashboard.html'">Admin Dashboard</button>
      <button class="btn-3d teal" onclick="location.href='#'">Extra Button</button>
    </div>
  </div>

  <!-- Poster slider card from your original code -->
  <div id="posterCard"><p>Loading posters...</p></div>

</div>

<!-- Scrolling text -->
<div class="scrolling-text" aria-live="polite">
  <span>यहाँ आपका स्क्रोलिंग संदेश आएगा • Zara Fix में आपका स्वागत है • नई अपडेट्स देखें • जल्दी ही नया फीचर आ रहा है •</span>
</div>

<!-- Firebase SDK -->
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-auth.js"></script>

<script>
  // Firebase Config
  const firebaseConfig = {
    apiKey: "AIzaSyCH17_8W_UPmPt4KqpCaV7BpN6KsA4a67E",
    authDomain: "zara-fix.firebaseapp.com",
    databaseURL: "https://zara-fix-default-rtdb.firebaseio.com",
    projectId: "zara-fix",
    storageBucket: "zara-fix.appspot.com",
    messagingSenderId: "476473209200",
    appId: "1:476473209200:web:9f6efe6c32fd4248949fb5"
  };
  firebase.initializeApp(firebaseConfig);
  const db = firebase.database();
  const auth = firebase.auth();

  let posters = [];
  let current = 0;

  function showPoster(i) {
    const container = document.getElementById("posterCard");
    if (!posters.length) {
      container.innerHTML = "<p>No poster data found.</p>";
      return;
    }
    const p = posters[i];
    container.innerHTML = `
      <div class="field"><b>Shop:</b> ${p.shop || "N/A"}</div>
      <div class="field"><b>Name:</b> ${p.name || "N/A"}</div>
      <div class="field"><b>Address:</b> ${p.address || "N/A"}</div>
    `;
  }

  // Load posters from Firebase
  db.ref("posters").once("value").then(snapshot => {
    snapshot.forEach(child => {
      posters.push(child.val());
    });
    if (posters.length) {
      showPoster(current);
      setInterval(() => {
        current = (current + 1) % posters.length;
        showPoster(current);
      }, 4000);
    } else {
      document.getElementById("posterCard").innerHTML = "<p>No posters found.</p>";
    }
  });

  // Login button & buttons enable/disable handling
  const loginBtn = document.getElementById('googleLoginBtn');
  const allMainButtons = document.querySelectorAll('.btn-3d');

  function setButtonsEnabled(enabled) {
    allMainButtons.forEach(btn => {
      btn.disabled = !enabled;
      btn.style.opacity = enabled ? '1' : '0.5';
      btn.style.cursor = enabled ? 'pointer' : 'not-allowed';
    });
  }

  // Disable buttons initially until login
  setButtonsEnabled(false);

  loginBtn.addEventListener('click', () => {
    if (auth.currentUser) {
      auth.signOut()
      .then(() => {
        alert("Logged out successfully!");
        loginBtn.textContent = "Google Login";
        setButtonsEnabled(false);
      })
      .catch(err => alert("Logout failed: " + err.message));
    } else {
      const provider = new firebase.auth.GoogleAuthProvider();
      auth.signInWithPopup(provider)
      .then(result => {
        alert("Login successful! Welcome, " + result.user.displayName);
        loginBtn.textContent = "Logout";
        setButtonsEnabled(true);
      })
      .catch(error => alert("Login failed: " + error.message));
    }
  });

  auth.onAuthStateChanged(user => {
    if (user) {
      loginBtn.textContent = "Logout";
      setButtonsEnabled(true);
    } else {
      loginBtn.textContent = "Google Login";
      setButtonsEnabled(false);
    }
  });
</script>

</body>
</html>





















<!DOCTYPE html>
<html lang="hi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Amazon Posts - Gallery Version</title>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://www.gstatic.com/firebasejs/9.23.0/firebase-app-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.23.0/firebase-auth-compat.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.23.0/firebase-database-compat.js"></script>

<style>
body { background:#0b1220; color:#e6eef8; }
.card { background: linear-gradient(160deg, rgba(255,255,255,.03), rgba(255,255,255,.01)); border:1px solid rgba(255,255,255,.06); border-radius:12px; cursor:pointer; transition:0.2s; }
.card:hover { transform:scale(1.01); }
.img-cover { width:100%; height:160px; object-fit:cover; border-top-left-radius:12px; border-top-right-radius:12px; }

#lightboxOverlay { display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,.9); justify-content:center; align-items:center; z-index:9999; }
#lightboxContent { position:relative; max-width:90%; max-height:90%; text-align:center; }
#lightboxContent img { max-width:100%; max-height:80vh; object-fit:contain; border-radius:8px; }
#lightboxClose { position:absolute; top:10px; right:10px; font-size:32px; color:#fff; cursor:pointer; }
#lightboxCounter { position:absolute; bottom:10px; left:50%; transform:translateX(-50%); color:#fff; font-size:16px; }
#lightboxThumbs { display:flex; gap:5px; overflow-x:auto; margin-top:10px; justify-content:center; }
#lightboxThumbs img { width:50px; height:50px; object-fit:cover; cursor:pointer; border:2px solid transparent; border-radius:6px; }
#lightboxThumbs img.active { border-color:#ffd700; }
</style>
</head>
<body class="min-h-screen flex flex-col items-center p-4">

<header class="w-full max-w-5xl mb-6">
<div class="flex items-center justify-between">
<h1 class="text-2xl font-bold">Amazon Sale Offer</h1>
<div class="flex items-center gap-3">
<span id="userEmail" class="text-sm opacity-80"></span>
<button id="authBtn" class="px-4 py-2 rounded-lg border btn-3d bg-white/5">Login with Google</button>
</div>
</div>
<p class="text-sm opacity-70 mt-2">zara fix</p>
</header>

<section id="adminPanel" class="w-full max-w-5xl mb-6 hidden">
<div class="card p-4">
<h2 class="text-lg font-semibold mb-3">Admin — New Amazon Post</h2>
<div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
<input id="a_title" placeholder="Title" class="px-3 py-2 rounded-lg bg-white/5"/>
<input id="a_price" type="number" placeholder="Price (₹)" class="px-3 py-2 rounded-lg bg-white/5"/>
<input id="a_image" placeholder="Image URLs (comma-separated)" class="px-3 py-2 rounded-lg bg-white/5"/>
<input id="a_aff" placeholder="Affiliate URL (https://... ?tag=...)" class="px-3 py-2 rounded-lg bg-white/5"/>
<textarea id="a_desc" placeholder="Short description" rows="2" class="col-span-full px-3 py-2 rounded-lg bg-white/5"></textarea>
</div>
<div class="mt-3 flex gap-2">
<button id="addBtn" class="px-4 py-2 rounded-lg bg-emerald-500 text-black font-bold">Publish</button>
<span id="adminMsg" class="text-sm opacity-70"></span>
</div>
</div>
</section>

<main class="w-full max-w-5xl">
<div id="postsGrid" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4"></div>
</main>

<div id="lightboxOverlay" class="flex">
<div id="lightboxContent">
<span id="lightboxClose">&times;</span>
<img id="lightboxImage" src="" alt="">
<div id="lightboxCounter"></div>
<div id="lightboxThumbs"></div>
</div>
</div>

<script>
const firebaseConfig = {
apiKey: "AIzaSyD6C87XJ8Wyb0-KFy_2l5fBiXz14Qv38OI",
authDomain: "muslim-nikah-67180.firebaseapp.com",
projectId: "muslim-nikah-67180",
storageBucket: "muslim-nikah-67180.appspot.com",
messagingSenderId: "161767924118",
appId: "1:161767924118:web:9ce4529390e8c3462f3db7",
measurementId: "G-TD19YVTEWG"
};
const ADMIN_EMAIL = "zarasamajiksevasanstha@gmail.com";

firebase.initializeApp(firebaseConfig);
const auth = firebase.auth();
const db = firebase.database();
const postsRef = db.ref('amazon_posts');

const authBtn = document.getElementById('authBtn');
const userEmailEl = document.getElementById('userEmail');
const adminPanel = document.getElementById('adminPanel');
const adminMsg = document.getElementById('adminMsg');
const addBtn = document.getElementById('addBtn');
const postsGrid = document.getElementById('postsGrid');

const a_title = document.getElementById('a_title');
const a_price = document.getElementById('a_price');
const a_image = document.getElementById('a_image');
const a_aff = document.getElementById('a_aff');
const a_desc = document.getElementById('a_desc');

authBtn.addEventListener('click', async () => {
if(auth.currentUser) await auth.signOut();
else { const provider=new firebase.auth.GoogleAuthProvider(); try { await auth.signInWithPopup(provider); } catch(e){ alert('Login failed: '+e.message); } }
});

auth.onAuthStateChanged(user => {
if(user){ userEmailEl.textContent=user.email; authBtn.textContent='Logout'; }
else{ userEmailEl.textContent=''; authBtn.textContent='Login with Google'; }
adminPanel.classList.toggle('hidden',!(user && user.email===ADMIN_EMAIL));
});

addBtn.addEventListener('click', async ()=>{
const user=auth.currentUser;
if(!user || user.email!==ADMIN_EMAIL){ adminMsg.textContent='Only admin allowed.'; setTimeout(()=>adminMsg.textContent='',3000); return; }

const title=a_title.value.trim();
const price=Number(a_price.value)||0;
const images=a_image.value.trim().split(',').map(s=>s.trim()).filter(Boolean);
const aff=a_aff.value.trim();
const desc=a_desc.value.trim();
if(!title||!aff||images.length===0){ adminMsg.textContent='Title, Affiliate URL & 1 image required.'; setTimeout(()=>adminMsg.textContent='',3000); return; }

const id=postsRef.push().key;
const item={id,title,price,images,aff,desc,createdAt:Date.now()};
try{ await postsRef.child(id).set(item); adminMsg.textContent='Published!'; a_title.value=a_price.value=a_image.value=a_aff.value=a_desc.value=''; setTimeout(()=>adminMsg.textContent='',2000);}catch(e){adminMsg.textContent='Error: '+e.message;}
});

postsRef.on('value', snapshot=>{
const obj=snapshot.val()||{};
const list=Object.values(obj).sort((a,b)=>(b.createdAt||0)-(a.createdAt||0));
renderList(list);
});

function renderList(list){
postsGrid.innerHTML='';
if(!list.length){ postsGrid.innerHTML=`<div class="col-span-full text-center p-6 opacity-70">No posts yet.</div>`; return;}
list.forEach(p=>{
const card=document.createElement('div');
card.className='card overflow-hidden';
card.dataset.images=JSON.stringify(p.images);
card.innerHTML=`
${p.images[0]?`<img src="${escapeHtml(p.images[0])}" class="img-cover">`:''}
<div class="p-3">
<div class="flex justify-between items-start">
<div>
<div class="font-bold text-lg">${escapeHtml(p.title)}</div>
<div class="text-sm opacity-70 mt-1">${escapeHtml(p.desc||'')}</div>
</div>
<div class="text-right">
<div class="font-extrabold text-xl">₹${Number(p.price||0).toLocaleString('en-IN')}</div>
</div>
</div>
<div class="mt-3 flex gap-2">
<a target="_blank" rel="noopener" href="${escapeAttribute(p.aff)}" class="flex-1 text-center px-3 py-2 rounded-lg bg-yellow-400 text-black font-bold">Buy</a>
${isCurrentAdmin()?`<button data-id="${p.id}" class="delBtn px-3 py-2 rounded-lg bg-rose-600 font-bold">Delete</button>`:''}
</div>
</div>
`;
postsGrid.appendChild(card);
});

document.querySelectorAll('.delBtn').forEach(b=>{b.addEventListener('click', async e=>{const id=e.currentTarget.dataset.id; if(!confirm('Delete this post?')) return; try{await postsRef.child(id).remove();}catch(err){alert('Delete failed:'+err.message);}});});

document.querySelectorAll('.card').forEach(card=>{
card.addEventListener('click', ()=>openLightbox(JSON.parse(card.dataset.images)));
});
}

// ===== Lightbox =====
const overlay=document.getElementById('lightboxOverlay');
const lightImg=document.getElementById('lightboxImage');
const lightClose=document.getElementById('lightboxClose');
const lightCounter=document.getElementById('lightboxCounter');
const lightThumbs=document.getElementById('lightboxThumbs');
let currentImages=[],currentIndex=0;

function openLightbox(images){currentImages=images; currentIndex=0; updateLightbox(); overlay.style.display='flex';}
function updateLightbox(){lightImg.src=currentImages[currentIndex]; lightCounter.textContent=`${currentIndex+1}/${currentImages.length}`; lightThumbs.innerHTML=''; currentImages.forEach((img,i)=>{const t=document.createElement('img'); t.src=img; if(i===currentIndex) t.classList.add('active'); t.addEventListener('click', ()=>{currentIndex=i; updateLightbox();}); lightThumbs.appendChild(t);});}

// Click outside or close
lightClose.addEventListener('click', ()=>overlay.style.display='none');
overlay.addEventListener('click', e=>{if(e.target===overlay) overlay.style.display='none';});

// Keyboard & swipe support
let startX=0;
lightImg.addEventListener('touchstart', e=>{startX=e.touches[0].clientX;});
lightImg.addEventListener('touchend', e=>{let endX=e.changedTouches[0].clientX; if(endX-startX>50){currentIndex=(currentIndex-1+currentImages.length)%currentImages.length; updateLightbox();} else if(startX-endX>50){currentIndex=(currentIndex+1)%currentImages.length; updateLightbox();}});

document.addEventListener('keydown', e=>{
if(overlay.style.display==='flex'){
if(e.key==='ArrowRight'){ currentIndex=(currentIndex+1)%currentImages.length; updateLightbox();}
if(e.key==='ArrowLeft'){ currentIndex=(currentIndex-1+currentImages.length)%currentImages.length; updateLightbox();}
if(e.key==='Escape') overlay.style.display='none';
}
});

function isCurrentAdmin(){return auth.currentUser && auth.currentUser.email===ADMIN_EMAIL;}
function escapeHtml(s){if(!s) return ''; return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');}
function escapeAttribute(s){if(!s) return '#'; return String(s).replace(/"/g,'&quot;').replace(/'/g,'&#39;');}
</script>
</body>
</html>
