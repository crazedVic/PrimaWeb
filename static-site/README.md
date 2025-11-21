# Static Site Migration - Prima Canadensis

This directory contains the migrated static HTML version of the Prima Canadensis website.

## Structure

```
static-site/
├── index.html              # Homepage
├── stammbaum.html
├── uberuns.html
├── geschichte.html
├── unterschlupf.html
├── festschrift.html
├── sffechsung.html
├── sippungsfolge.html
├── wappen.html
├── fechsungen.html
├── krystallinen.html
├── unserestadt.html
├── privat/
│   └── sassenschaft.html   # Password-protected page (credentials: praga/lulu)
├── css/                    # Stylesheets
│   ├── reset-fonts-grids.css
│   ├── prima.css
│   └── container.css
├── js/                     # JavaScript files
│   ├── container-min.js
│   ├── galerie.js
│   ├── wappen.js
│   └── yahoo-dom-event.js
└── images/                 # Images and graphics
    ├── edm/                # Edmonton city images
    ├── fechsung/           # Fechsung images
    ├── shields_thumb/      # Shield thumbnails
    └── [various image files]
```

## Migration Details

- **Source**: https://primacanadensis.org/
- **Migration Date**: November 2024
- **Total Pages**: 13 HTML pages (12 public + 1 password-protected)
- **Assets**: All CSS, JavaScript, and images have been downloaded and paths updated to relative references

## Deployment

1. Upload all files to your web server via FTP
2. Ensure directory structure is preserved
3. Set proper file permissions (644 for files, 755 for directories)
4. Test all pages to ensure links and assets load correctly

## Notes

- All internal links use relative paths
- External links (e.g., schlaraffia.org, arrai.com) remain as absolute URLs
- The password-protected page (`privat/sassenschaft.html`) is included but may require server-side authentication configuration
- Some navigation links in the sidebar reference pages that weren't in the migration list (e.g., montagsmaler.html, galerie.html) - these will need to be added or removed from navigation

## Next Steps

1. Review and test all pages locally before deploying
2. Update or remove broken navigation links
3. Consider adding a `.htaccess` file for the password-protected directory if needed
4. Test on the production server after FTP upload


