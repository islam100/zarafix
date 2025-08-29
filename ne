<!DOCTYPE html>
<html lang="en">
<head>

<meta name="google-site-verification" content="747ecEujhHluFPpMSv_v2bkpZ7IT6pbVqDW1XrpEQBo" />

  
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Post Your Vehicle</title>
</head>
<body>
  <h2>🚗 Post Your Vehicle for Sale</h2>

  <!-- Google Login Section -->
  <div id="authSection">
    <button id="loginBtn">Login with Google</button>
    <button id="logoutBtn" style="display:none;">Logout</button>
    <p id="userInfo"></p>
  </div>
  <hr>

  <!-- Vehicle Form -->
  <form id="vehicleForm" style="display:none;">
    <input type="text" id="brand" placeholder="Brand" required><br>
    <input type="text" id="model" placeholder="Model" required><br>
    <input type="number" id="year" placeholder="Year of Purchase" required><br>
    <input type="text" id="condition" placeholder="Condition" required><br>
    <select id="fuelType" required>
      <option value="">-- Select Fuel Type --</option>
      <option value="Petrol">Petrol</option>
      <option value="Diesel">Diesel</option>
      <option value="CNG">CNG</option>
      <option value="Electric">Electric</option>
    </select><br>
    <input type="number" id="price" placeholder="Price (₹)" required><br>
    <input type="text" id="city" placeholder="City" required><br>
    <input type="tel" id="contact" placeholder="Contact Number" required><br>
    <input type="file" id="images" multiple accept="image/*"><br>
    <button type="submit">Submit</button>
  </form>

  <!-- Firebase SDK -->
  <script type="module">
    import { initializeApp } from "https://www.gstatic.com/firebasejs/9.23.0/firebase-app.js";
    import { getAuth, GoogleAuthProvider, signInWithPopup, signOut, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/9.23.0/firebase-auth.js";
    import { getDatabase, ref, push, set } from "https://www.gstatic.com/firebasejs/9.23.0/firebase-database.js";

    // 🔥 Firebase Config
    const firebaseConfig = {
      apiKey: "AIzaSyAAOYtvC0kiu_vZTYuQ8phPyMqTEFJj9O0",
      authDomain: "new-bike-59133.firebaseapp.com",
      databaseURL: "https://new-bike-59133-default-rtdb.firebaseio.com",
      projectId: "new-bike-59133",
      storageBucket: "new-bike-59133.appspot.com",
      messagingSenderId: "966945954091",
      appId: "1:966945954091:web:c1387e3a27af68aef3cd6e"
    };

    const app = initializeApp(firebaseConfig);
    const auth = getAuth(app);
    const db = getDatabase(app);

    const provider = new GoogleAuthProvider();

    const loginBtn = document.getElementById("loginBtn");
    const logoutBtn = document.getElementById("logoutBtn");
    const userInfo = document.getElementById("userInfo");
    const form = document.getElementById("vehicleForm");

    // Login
    loginBtn.addEventListener("click", () => {
      signInWithPopup(auth, provider).catch(err => alert(err.message));
    });

    // Logout
    logoutBtn.addEventListener("click", () => {
      signOut(auth);
    });

    // Auth State Change
    onAuthStateChanged(auth, (user) => {
      if (user) {
        userInfo.innerText = "👤 " + user.displayName + " (" + user.email + ")";
        loginBtn.style.display = "none";
        logoutBtn.style.display = "inline-block";
        form.style.display = "block";
      } else {
        userInfo.innerText = "";
        loginBtn.style.display = "inline-block";
        logoutBtn.style.display = "none";
        form.style.display = "none";
      }
    });

    // Form Submit
    form.addEventListener("submit", async (e) => {
      e.preventDefault();

      const brand = document.getElementById("brand").value;
      const model = document.getElementById("model").value;
      const year = document.getElementById("year").value;
      const condition = document.getElementById("condition").value;
      const fuelType = document.getElementById("fuelType").value;
      const price = document.getElementById("price").value;
      const city = document.getElementById("city").value;
      const contact = document.getElementById("contact").value;
      const images = document.getElementById("images").files;

      let imageUrls = [];

      // ImgBB upload
      for (let i = 0; i < images.length; i++) {
        let formData = new FormData();
        formData.append("image", images[i]);

        try {
          let res = await fetch("https://api.imgbb.com/1/upload?key=ff05d1b5c3b3e139253856f0ad1123df", {
            method: "POST",
            body: formData
          });
          let data = await res.json();
          if (data.success) {
            imageUrls.push(data.data.url);
          }
        } catch (err) {
          console.error("Image upload failed:", err);
        }
      }

      // Firebase Database Save
      const newPostRef = push(ref(db, "vehicles"));
      await set(newPostRef, {
        brand, model, year, condition, fuelType, price, city, contact,
        images: imageUrls,
        user: auth.currentUser ? auth.currentUser.email : "guest",
        status: "pending",
        timestamp: Date.now()
      });

      alert("✅ Vehicle Posted Successfully!");
      form.reset();
    });
  </script>
</body>
</html>
