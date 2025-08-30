// ads.js

// Firebase init
const firebaseConfig = {
  apiKey: "AIzaSyAAOYtvC0kiu_vZTYuQ8phPyMqTEFJj9O0",
  authDomain: "new-bike-59133.firebaseapp.com",
  projectId: "new-bike-59133",
  storageBucket: "new-bike-59133.appspot.com",
  messagingSenderId: "966945954091",
  appId: "1:966945954091:web:c1387e3a27af68aef3cd6e"
};

// Firebase Initialize
firebase.initializeApp(firebaseConfig);
const db = firebase.firestore();
const auth = firebase.auth();

// Admin email
const adminEmail = "zarasamajiksevasanstha@gmail.com";

// Google Login function
function loginWithGoogle() {
  const provider = new firebase.auth.GoogleAuthProvider();
  auth.signInWithPopup(provider).then(result => {
    const user = result.user;
    if (user.email === adminEmail) {
      alert("Admin login successful!");
      showAdminPanel();
    } else {
      alert("User login successful!");
      showPostForm(user.email);
    }
  }).catch(err => {
    console.error(err);
    alert("Login failed!");
  });
}

// Show post form for user
function showPostForm(userEmail) {
  const formDiv = document.createElement("div");
  formDiv.innerHTML = `
    <h3>Post an Ad</h3>
    <input type="text" id="imgUrl" placeholder="Image URL" />
    <button onclick="submitAd('${userEmail}')">Submit</button>
    <hr/>
    <div id="allAds"></div>
  `;
  document.body.appendChild(formDiv);
  loadAds();
}

// Submit ad
function submitAd(userEmail) {
  const url = document.getElementById("imgUrl").value;
  if (!url) return alert("Enter image URL");
  
  db.collection("ads").add({
    url: url,
    approved: false,
    user: userEmail,
    timestamp: firebase.firestore.FieldValue.serverTimestamp()
  }).then(() => {
    alert("Ad submitted! Waiting for admin approval.");
    document.getElementById("imgUrl").value = "";
  });
}

// Show admin panel
function showAdminPanel() {
  const panel = document.createElement("div");
  panel.innerHTML = `<h2>Admin Panel</h2><div id="adminAds"></div>`;
  document.body.appendChild(panel);

  db.collection("ads").orderBy("timestamp", "desc").onSnapshot(snapshot => {
    const container = document.getElementById("adminAds");
    container.innerHTML = "";
    snapshot.forEach(doc => {
      const ad = doc.data();
      const div = document.createElement("div");
      div.innerHTML = `
        <img src="${ad.url}" width="200" />
        <p>User: ${ad.user}</p>
        <p>Approved: ${ad.approved}</p>
        <button onclick="approveAd('${doc.id}')">Approve</button>
        <button onclick="rejectAd('${doc.id}')">Reject</button>
        <hr/>
      `;
      container.appendChild(div);
    });
  });
}

// Approve ad
function approveAd(id) {
  db.collection("ads").doc(id).update({approved: true});
}

// Reject ad
function rejectAd(id) {
  db.collection("ads").doc(id).delete();
}

// Load approved ads for popup
function loadAds() {
  db.collection("ads").where("approved", "==", true).get().then(snapshot => {
    const container = document.getElementById("allAds");
    container.innerHTML = "";
    snapshot.forEach(doc => {
      const ad = doc.data();
      const img = document.createElement("img");
      img.src = ad.url;
      img.width = 300;
      img.style.margin = "10px";
      container.appendChild(img);
    });
    // Popup slideshow
    startPopupSlideshow(snapshot.docs.map(d => d.data().url));
  });
}

// Popup slideshow
function startPopupSlideshow(urls) {
  if (urls.length === 0) return;
  let i = 0;
  const popup = document.createElement("div");
  popup.style.position = "fixed";
  popup.style.top = "50%";
  popup.style.left = "50%";
  popup.style.transform = "translate(-50%, -50%)";
  popup.style.background = "#fff";
  popup.style.padding = "20px";
  popup.style.border = "2px solid #000";
  popup.style.zIndex = 10000;
  
  const img = document.createElement("img");
  img.src = urls[0];
  img.width = 400;
  popup.appendChild(img);

  const closeBtn = document.createElement("button");
  closeBtn.innerText = "Close";
  closeBtn.onclick = () => popup.remove();
  popup.appendChild(closeBtn);

  document.body.appendChild(popup);

  setInterval(() => {
    i = (i + 1) % urls.length;
    img.src = urls[i];
  }, 5000); // 5 sec
}
