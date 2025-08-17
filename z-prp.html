<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ZaraFix Real Estate</title>
<style>
body { margin:0; font-family:Arial,sans-serif; background:#f0f2f5; }
header { display:flex; justify-content:space-between; align-items:center; padding:10px 20px; background:#2563eb; color:white; box-shadow:0 3px 6px rgba(0,0,0,0.2); }
header h1 { font-size:28px; font-weight:bold; text-shadow:2px 2px 5px #000, 0 0 5px #fff; }
button { cursor:pointer; border:none; border-radius:8px; padding:8px 14px; font-weight:bold; box-shadow:0 4px 6px rgba(0,0,0,0.2); transition:0.2s; }
button:hover { transform:translateY(-2px); box-shadow:0 6px 12px rgba(0,0,0,0.3); }
.grid { max-width:1100px; margin:20px auto; display:grid; grid-template-columns:repeat(auto-fit,minmax(280px,1fr)); gap:15px; }
.card { background:white; border-radius:12px; padding:10px; box-shadow:0 4px 8px rgba(0,0,0,0.1); position:relative; transition:transform 0.3s, box-shadow 0.3s; }
.card:hover { transform: translateY(-5px); box-shadow:0 8px 20px rgba(0,0,0,0.3); }
.card.pending { border:2px solid yellow; animation: glowBlink 1s infinite; }
@keyframes glowBlink {0%,50%,100%{ box-shadow:0 0 10px yellow; } 25%,75%{ box-shadow:0 0 20px yellow; }}
.card img { width:100%; border-radius:8px; margin:5px 0; cursor:pointer; }
.card h3 { margin:5px 0; font-size:18px; }
.card p { margin:2px 0; font-size:14px; }
.card-footer { display:flex; gap:8px; margin-top:10px; justify-content:flex-end; flex-wrap:wrap; }
.card .whatsapp-btn { display:inline-block; margin-top:5px; padding:6px 10px; border-radius:8px; background:linear-gradient(to right,#25D366,#128C7E); color:white; text-decoration:none; font-weight:bold; box-shadow:0 4px 6px rgba(0,0,0,0.2); transition:0.2s; }
.card .whatsapp-btn:hover { transform:translateY(-2px); box-shadow:0 6px 12px rgba(0,0,0,0.3); }
.card .admin-btn { background: linear-gradient(145deg,#43cea2,#185a9d); color:white; padding:6px 12px; border-radius:8px; box-shadow:0 4px 6px rgba(0,0,0,0.3); transition: transform 0.2s, box-shadow 0.2s; }
.card .admin-btn:hover { transform:translateY(-2px); box-shadow:0 6px 12px rgba(0,0,0,0.4); }
#postForm { max-width:600px;margin:20px auto;padding:15px;background:white;border-radius:12px; display:none; }
.modal, #confirmModal { display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.8); justify-content:center; align-items:center; z-index:999; }
.modal-content, #confirmModal .modal-content { background:white; padding:15px; border-radius:12px; max-width:90%; max-height:90%; overflow-y:auto; }
.modal img { width:100%; max-height:300px; object-fit:contain; margin-bottom:10px; }
.pagination { display:flex; justify-content:center; margin:20px 0; gap:10px; }
.pagination button:disabled { opacity:0.5; cursor:not-allowed; }
</style>
</head>
<body>
<header>
  <h1>ZaraFix</h1>
  <div id="loginDiv"><button onclick="login()">Login</button></div>
</header>

<div id="postForm">
  <h3>Post Property</h3>
  <input type="text" id="title" placeholder="Title" style="width:100%;margin:5px 0;"><br>
  <textarea id="description" placeholder="Description" style="width:100%;margin:5px 0;"></textarea><br>
  <input type="number" id="price" placeholder="Price" style="width:100%;margin:5px 0;"><br>
  <input type="text" id="location" placeholder="Location" style="width:100%;margin:5px 0;"><br>
  <input type="file" id="images" multiple accept="image/*"><br>
  <input type="text" id="whatsapp" placeholder="WhatsApp Number" style="width:100%;margin:5px 0;"><br>
  <button onclick="submitPost()">Submit</button>
</div>

<div class="grid" id="postsGrid"></div>
<div class="pagination">
  <button id="prevBtn" onclick="prevPage()">⬅ Prev</button>
  <button id="nextBtn" onclick="nextPage()">Next ➡</button>
</div>

<div class="modal" id="modal"><div class="modal-content" id="modalContent"></div></div>
<div class="modal" id="confirmModal"><div class="modal-content"><p>Are you sure?</p><button id="confirmYes">Yes</button><button id="confirmNo">No</button></div></div>

<script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-auth.js"></script>
<script>
const firebaseConfig = { apiKey:"AIzaSyDTj2n1yhr1sFmuyBZ-jUwOmx1YqAN5QjA", authDomain:"property-20d6d.firebaseapp.com", databaseURL:"https://property-20d6d-default-rtdb.firebaseio.com", projectId:"property-20d6d", storageBucket:"property-20d6d.appspot.com", messagingSenderId:"916859697394", appId:"1:916859697394:web:2a8f9ad2d62f8306dcb86b" };
const imgbbKey="cad1f0dbfbd25346460789376cc2d7d5";
firebase.initializeApp(firebaseConfig);
const db=firebase.database();
const auth=firebase.auth();

let currentUser=null, postsData=[], postsPerPage=10, currentPage=0, admins=["zarasamajiksevasanstha@gmail.com"], isAdmin=false, deleteId=null;

// Login / Logout
function login(){ auth.signInWithPopup(new firebase.auth.GoogleAuthProvider()); }
function logout(){ auth.signOut(); currentUser=null; isAdmin=false; document.getElementById('loginDiv').innerHTML=`<button onclick="login()">Login</button>`; document.getElementById('postForm').style.display='none'; }

auth.onAuthStateChanged(user=>{
  if(user){
    currentUser=user;
    isAdmin=admins.includes(user.email);
    document.getElementById('loginDiv').innerHTML=`<button onclick="logout()">Logout</button>`;
    if(!isAdmin) document.getElementById('postForm').style.display='block';
    fetchPosts();
  } else {
    fetchPosts(); // still show posts even if not logged in
  }
});

// Fetch posts
function fetchPosts(){
  db.ref('posts').on('value',snap=>{
    postsData=[]; snap.forEach(child=>postsData.push({id:child.key,...child.val()})); currentPage=0; renderPage();
  });
}

// Render posts
function renderPage(){
  const grid=document.getElementById('postsGrid'); grid.innerHTML='';
  let start=currentPage*postsPerPage, end=start+postsPerPage, paginated=postsData.slice(start,end);
  paginated.forEach(post=>{
    const card=document.createElement('div'); 
    card.className='card '+(post.approved?'':'pending');
    card.innerHTML=`
      <img src="${post.images?post.images[0]:''}" onclick="openModal('${post.id}')">
      <h3>${post.title||''}</h3>
      <p>${post.description||''}</p>
      <p>Price: ${post.price||''}</p>
      <p>Location: ${post.location||''}</p>
    `;

    const footer=document.createElement('div'); 
    footer.className='card-footer';

    if(currentUser){
      if(isAdmin){
        const approveBtn=document.createElement('button'); 
        approveBtn.className='admin-btn'; approveBtn.textContent='Approve'; approveBtn.onclick=()=>approvePost(post.id);
        const rejectBtn=document.createElement('button'); 
        rejectBtn.className='admin-btn'; rejectBtn.textContent='Reject'; rejectBtn.onclick=()=>rejectPost(post.id);
        const delBtn=document.createElement('button'); 
        delBtn.className='admin-btn'; delBtn.textContent='Delete'; delBtn.onclick=()=>showConfirm(post.id);
        footer.appendChild(approveBtn); footer.appendChild(rejectBtn); footer.appendChild(delBtn);
      } else {
        if(currentUser.email!==post.poster){
          const waBtn=document.createElement('a'); 
          waBtn.className='whatsapp-btn'; 
          waBtn.href=`https://wa.me/${post.whatsapp}`; waBtn.target='_blank'; 
          waBtn.textContent='📞 WhatsApp'; footer.appendChild(waBtn);
        } else {
          const label=document.createElement('span'); label.textContent='Your Post'; label.style.fontWeight='bold'; footer.appendChild(label);
          const delBtn=document.createElement('button'); delBtn.className='admin-btn'; delBtn.textContent='Delete'; delBtn.onclick=()=>showConfirm(post.id); footer.appendChild(delBtn);
        }
      }
    }

    card.appendChild(footer); grid.appendChild(card);
  });

  document.getElementById('prevBtn').style.display=(currentPage===0?'none':'inline-block');
  document.getElementById('nextBtn').style.display=((currentPage+1)*postsPerPage>=postsData.length?'none':'inline-block');
}

// Approve / Reject / Delete
function approvePost(id){ db.ref('posts/'+id).update({approved:true}); }
function rejectPost(id){ db.ref('posts/'+id).update({approved:false}); }
function showConfirm(id){ deleteId=id; document.getElementById('confirmModal').style.display='flex'; }
document.getElementById('confirmYes').onclick=()=>{ if(deleteId) db.ref('posts/'+deleteId).remove(); document.getElementById('confirmModal').style.display='none'; }
document.getElementById('confirmNo').onclick=()=>{ document.getElementById('confirmModal').style.display='none'; deleteId=null; }

// Modal
function openModal(id){
  db.ref('posts/'+id).once('value').then(snap=>{
    const post=snap.val(); if(!post) return;
    const modalContent=document.getElementById('modalContent'); 
    let imgs=post.images?post.images.map(src=>`<img src="${src}">`).join(''):'';
    modalContent.innerHTML=`
      ${imgs}
      <h2>${post.title||''}</h2>
      <p>${post.description||''}</p>
      <p>Price: ${post.price||''}</p>
      <p>Location: ${post.location||''}</p>
      <p><a class="whatsapp-btn" href="https://wa.me/${post.whatsapp}" target="_blank">📞 WhatsApp</a></p>
    `;
    const modal=document.getElementById('modal'); modal.style.display='flex'; modal.onclick=()=>modal.style.display='none';
  });
}

// Submit post
async function submitPost(){
  if(!currentUser){ alert('Login first'); return; }
  const title=document.getElementById('title').value.trim();
  const description=document.getElementById('description').value.trim();
  const price=parseFloat(document.getElementById('price').value);
  const location=document.getElementById('location').value.trim();
  const whatsapp=document.getElementById('whatsapp').value.trim();
  const files=document.getElementById('images').files;
  if(!title || !description || !price || !location || !whatsapp){ alert('Fill all fields'); return; }
  if(price<=0){ alert('Price must be positive'); return; }
  if(!/^\d{10,15}$/.test(whatsapp)){ alert('Enter valid WhatsApp number'); return; }
  if(files.length>5){ alert('Maximum 5 images'); return; }

  let urls=await Promise.all([...files].map(async file=>{
    let formData=new FormData(); formData.append("image",file);
    let res=await fetch(`https://api.imgbb.com/1/upload?key=${imgbbKey}`,{method:"POST",body:formData});
    let data=await res.json(); return data.data.url;
  }));

  const newPost={title,description,price,location,whatsapp,images:urls,poster:currentUser.email,approved:false};
  db.ref('posts').push(newPost);
  alert('Post submitted');
  document.getElementById('postForm').reset(); document.getElementById('images').value='';
}

// Pagination
function nextPage(){ if((currentPage+1)*postsPerPage<postsData.length){ currentPage++; renderPage(); } }
function prevPage(){ if(currentPage>0){ currentPage--; renderPage(); } }
</script>
</body>
</html>
