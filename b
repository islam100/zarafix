<!DOCTYPE html>
<html lang="hi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Zara Property Listing</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin:0;
        padding:0;
        background:#f5f5f5;
    }
    header {
        background:#0b3d91;
        color:white;
        padding:15px;
        text-align:center;
        font-size:24px;
        font-weight:bold;
        text-shadow: 2px 2px 5px #000;
    }
    .container {
        display:flex;
        flex-wrap:wrap;
        justify-content:center;
        margin:20px;
        gap:20px;
    }
    .property-card {
        background:white;
        width:300px;
        border-radius:10px;
        overflow:hidden;
        box-shadow:0 5px 15px rgba(0,0,0,0.3);
        display:flex;
        flex-direction:column;
        transition: transform 0.2s;
    }
    .property-card:hover {
        transform: scale(1.03);
    }
    .property-card img {
        width:100%;
        height:200px;
        object-fit:cover;
    }
    .property-content {
        padding:15px;
        flex-grow:1;
        display:flex;
        flex-direction:column;
        justify-content:space-between;
    }
    .property-title {
        font-size:18px;
        font-weight:bold;
        margin-bottom:5px;
    }
    .property-price {
        color:green;
        font-weight:bold;
        margin-bottom:5px;
    }
    .property-city, .property-type {
        font-size:14px;
        color:#555;
        margin-bottom:5px;
    }
    .property-desc {
        font-size:14px;
        color:#333;
        margin-bottom:10px;
        flex-grow:1;
    }
    .whatsapp-btn {
        background:#25D366;
        color:white;
        text-decoration:none;
        padding:10px;
        border-radius:5px;
        text-align:center;
        display:block;
        font-weight:bold;
    }
</style>
</head>
<body>

<header>Zara Property Listing</header>

<div class="container" id="propertyContainer">
    <!-- Properties will load here -->
</div>

<!-- Firebase SDK -->
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-database.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.10.1/firebase-auth.js"></script>

<script>
  // Firebase config
  const firebaseConfig = {
    apiKey: "AIzaSyDTj2n1yhr1sFmuyBZ-jUwOmx1YqAN5QjA",
    authDomain: "property-20d6d.firebaseapp.com",
    databaseURL: "https://property-20d6d-default-rtdb.firebaseio.com",
    projectId: "property-20d6d",
    storageBucket: "property-20d6d.appspot.com",
    messagingSenderId: "916859697394",
    appId: "1:916859697394:web:2a8f9ad2d62f8306dcb86b"
  };
  firebase.initializeApp(firebaseConfig);

  const dbRef = firebase.database().ref('properties');
  const container = document.getElementById('propertyContainer');

  // Fetch properties from Firebase
  dbRef.on('value', (snapshot) => {
    container.innerHTML = ''; // Clear container
    const properties = snapshot.val();
    if(properties){
      Object.keys(properties).forEach(key => {
        const prop = properties[key];
        if(prop.approved){
          const card = document.createElement('div');
          card.className = 'property-card';
          card.innerHTML = `
            <img src="${prop.imageUrl}" alt="${prop.title}">
            <div class="property-content">
              <div class="property-title">${prop.title}</div>
              <div class="property-price">₹ ${prop.price.toLocaleString()}</div>
              <div class="property-city">City: ${prop.city}</div>
              <div class="property-type">Type: ${prop.type}</div>
              <div class="property-desc">${prop.description}</div>
              <a class="whatsapp-btn" href="https://wa.me/${prop.whatsapp}" target="_blank">WhatsApp Poster</a>
            </div>
          `;
          container.appendChild(card);
        }
      });
    } else {
      container.innerHTML = "<p>No properties listed yet.</p>";
    }
  });
</script>

</body>
</html>
