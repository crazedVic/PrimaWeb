import './bootstrap';

// Stammbaum page hover effects - inline handlers are added by PageSeeder,
// but this serves as a fallback for dynamically loaded content
function initStammbaumHover() {
    const stammbaumImg = document.querySelector('#stcontent img[usemap]') || 
                         document.querySelector('.stcontent img[usemap]') ||
                         document.querySelector('img[usemap="#Map"]');
    
    if (!stammbaumImg) return false;
    
    const mapName = stammbaumImg.getAttribute('usemap');
    if (!mapName) return false;
    
    const map = document.querySelector(mapName);
    if (!map) return false;
    
    const areas = map.querySelectorAll('area');
    
    areas.forEach(area => {
        const href = area.getAttribute('href');
        // Only apply hover effect to areas with valid links (not # or empty)
        if (href && href !== '#' && href.trim() !== '' && !area.hasAttribute('onmouseover')) {
            // Only add if inline handlers weren't already added by seeder
            area.addEventListener('mouseover', () => stammbaumImg.classList.add('hover-effect'));
            area.addEventListener('mouseout', () => stammbaumImg.classList.remove('hover-effect'));
            area.addEventListener('focus', () => stammbaumImg.classList.add('hover-effect'));
            area.addEventListener('blur', () => stammbaumImg.classList.remove('hover-effect'));
        }
    });
    
    return true;
}

// Initialize on load (fallback for inline handlers)
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => setTimeout(initStammbaumHover, 50));
} else {
    setTimeout(initStammbaumHover, 50);
}
