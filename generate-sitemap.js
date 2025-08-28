const fs = require('fs');
const path = require('path');

// 1. सभी pages की list
const pages = [
  '/',
  '/hospital',
  '/ambulancebooking',
  '/realestate',
  '/all-serviceprovider'
];

// 2. Sitemap XML बनाना
const sitemap = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${pages.map(page => `
  <url>
    <loc>https://www.zarafix.online${page}</loc>
    <lastmod>${new Date().toISOString().split('T')[0]}</lastmod>
    <changefreq>weekly</changefreq>
    <priority>${page === '/' ? '1.0' : '0.8'}</priority>
  </url>`).join('')}
</urlset>
`;

// 3. Sitemap को public folder में write करना
fs.writeFileSync(path.join(__dirname, 'public', 'sitemap.xml'), sitemap);

console.log('✅ sitemap.xml generated successfully!');
