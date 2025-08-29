const fs = require('fs');
const path = require('path');

// urls.txt aur sitemap.xml ka path (public folder ke andar)
const urlsFile = path.join(__dirname, 'urls.txt');
const sitemapFile = path.join(__dirname, 'sitemap.xml');

// urls.txt पढ़ो
if (!fs.existsSync(urlsFile)) {
  console.error("Error: urls.txt file public folder me nahi mili!");
  process.exit(1);
}

const urls = fs.readFileSync(urlsFile, 'utf-8')
  .split('\n')
  .map(line => line.trim())
  .filter(line => line !== '');

// sitemap.xml content बनाओ
let sitemapContent = `<?xml version="1.0" encoding="UTF-8"?>\n`;
sitemapContent += `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n`;

urls.forEach(url => {
  sitemapContent += `  <url>\n    <loc>${url}</loc>\n  </url>\n`;
});

sitemapContent += `</urlset>`;

// sitemap.xml save करो
fs.writeFileSync(sitemapFile, sitemapContent);

console.log('✅ Sitemap generated successfully at public/sitemap.xml');
