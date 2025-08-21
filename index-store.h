<!DOCTYPE html>
<html lang="hi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Zara Header</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<header class="bg-white shadow p-2">
  <div class="container mx-auto flex flex-wrap justify-between items-center">

    <!-- Logo -->
    <div class="text-xl font-bold">Zara</div>

    <!-- Hamburger Button (Mobile) -->
    <button id="hamburger" class="sm:hidden px-3 py-2 border rounded">
      ☰
    </button>

    <!-- Menu + Logout -->
    <div id="mobileMenu" class="hidden w-full sm:flex sm:items-center sm:space-x-4 flex-col sm:flex-row mt-2 sm:mt-0">
      <nav class="flex flex-col sm:flex-row sm:space-x-4 w-full sm:w-auto">
        <a href="#" class="px-2 py-1 hover:bg-gray-200 rounded text-center sm:text-left">Home</a>
        <a href="#" class="px-2 py-1 hover:bg-gray-200 rounded text-center sm:text-left">About</a>
        <a href="#" class="px-2 py-1 hover:bg-gray-200 rounded text-center sm:text-left">Contact</a>
      </nav>
      <button class="px-4 py-2 bg-blue-500 text-white rounded w-full sm:w-auto mt-2 sm:mt-0">Logout</button>
    </div>

  </div>
</header>

<script>
  const hamburger = document.getElementById("hamburger");
  const mobileMenu = document.getElementById("mobileMenu");

  hamburger.addEventListener("click", () => {
    mobileMenu.classList.toggle("hidden");
  });
</script>

</body>
</html>
