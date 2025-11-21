// Modern navigation menu for Prima Canadensis static site
// Horizontal navigation bar with dropdown menus

// Function to get base path for menu links (handles subdirectories)
function getBasePath() {
  const path = window.location.pathname;
  // Check if we're in a subdirectory (like privat/)
  if (path.includes('/privat/')) {
    return '../';
  }
  return './';
}

function generateMenu(currentPage) {
  const activePage = currentPage || 'index';
  const basePath = getBasePath();
  
  // Build modern horizontal navigation
  let menuHTML = `
    <nav id="main-nav">
      <ul class="nav-list">
        <li class="nav-item ${activePage === 'index' ? 'active' : ''}">
          <a href="${basePath}" class="nav-link">Heim</a>
        </li>
        <li class="nav-item ${activePage === 'stammbaum' ? 'active' : ''}">
          <a href="${basePath}stammbaum" class="nav-link">Stammbaum</a>
        </li>
        <li class="nav-item dropdown ${activePage === 'uberuns' || activePage === 'geschichte' || activePage === 'unterschlupf' ? 'active' : ''}">
          <a href="${basePath}uberuns" class="nav-link">&Uuml;ber uns <span class="dropdown-arrow"></span></a>
          <ul class="dropdown-menu">
            <li class="dropdown-item ${activePage === 'uberuns' ? 'active' : ''}">
              <a href="${basePath}uberuns">&Uuml;ber uns</a>
            </li>
            <li class="dropdown-item ${activePage === 'geschichte' ? 'active' : ''}">
              <a href="${basePath}geschichte">Geschichte</a>
            </li>
            <li class="dropdown-item ${activePage === 'unterschlupf' ? 'active' : ''}">
              <a href="${basePath}unterschlupf">Unterschlupf</a>
            </li>
          </ul>
        </li>
        <li class="nav-item dropdown ${activePage === 'festschrift' || activePage === 'sffechsung' ? 'active' : ''}">
          <a href="${basePath}festschrift" class="nav-link">Stiftungsfest <span class="dropdown-arrow"></span></a>
          <ul class="dropdown-menu">
            <li class="dropdown-item ${activePage === 'festschrift' ? 'active' : ''}">
              <a href="${basePath}festschrift">Festschrift</a>
            </li>
            <li class="dropdown-item ${activePage === 'sffechsung' ? 'active' : ''}">
              <a href="${basePath}sffechsung">Fechsungen</a>
            </li>
          </ul>
        </li>
        <li class="nav-item ${activePage === 'sippungsfolge' ? 'active' : ''}">
          <a href="${basePath}sippungsfolge" class="nav-link">Sippungsfolge</a>
        </li>
        <li class="nav-item ${activePage === 'sassenschaft' ? 'active' : ''}">
          <a href="${basePath}privat/sassenschaft" class="nav-link">Sassenschaft</a>
        </li>
        <li class="nav-item ${activePage === 'krystallinen' ? 'active' : ''}">
          <a href="${basePath}krystallinen" class="nav-link">Krystallinen</a>
        </li>
        <li class="nav-item ${activePage === 'wappen' ? 'active' : ''}">
          <a href="${basePath}wappen" class="nav-link">Wappen</a>
        </li>
        <li class="nav-item ${activePage === 'fechsungen' ? 'active' : ''}">
          <a href="${basePath}fechsungen" class="nav-link">Fechsungen</a>
        </li>
        <li class="nav-item ${activePage === 'unserestadt' ? 'active' : ''}">
          <a href="${basePath}unserestadt" class="nav-link">Unsere Stadt</a>
        </li>
      </ul>
      <button class="mobile-menu-toggle" aria-label="Toggle menu">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </nav>
  `;
  
  return menuHTML;
}

// Function to detect current page from path
function getCurrentPage() {
  const path = window.location.pathname;
  const segments = path.split('/').filter(s => s);
  const page = segments[segments.length - 1] || 'index';
  
  // Handle root/index case
  if (path === '/' || path === '' || page === '') {
    return 'index';
  }
  
  // Remove .html if present (for backwards compatibility)
  const cleanPage = page.replace('.html', '');
  
  // Map page slugs to identifiers
  const pageMap = {
    'index': 'index',
    'stammbaum': 'stammbaum',
    'uberuns': 'uberuns',
    'geschichte': 'geschichte',
    'unterschlupf': 'unterschlupf',
    'festschrift': 'festschrift',
    'sffechsung': 'sffechsung',
    'sippungsfolge': 'sippungsfolge',
    'sassenschaft': 'sassenschaft',
    'krystallinen': 'krystallinen',
    'wappen': 'wappen',
    'fechsungen': 'fechsungen',
    'unserestadt': 'unserestadt'
  };
  
  // Handle /privat/sassenschaft path
  if (path.includes('/privat/sassenschaft')) {
    return 'sassenschaft';
  }
  
  return pageMap[cleanPage] || cleanPage;
}

// Function to replace menu
function replaceMenu() {
  const currentPage = getCurrentPage();
  
  // Check if modern nav already exists
  if (document.querySelector('#main-nav')) {
    // Update existing nav
    const existingNav = document.querySelector('#main-nav');
    existingNav.outerHTML = generateMenu(currentPage);
  } else {
    // Insert navigation after header
    const header = document.querySelector('#hd');
    if (header) {
      header.insertAdjacentHTML('afterend', generateMenu(currentPage));
    } else {
      // Fallback: replace sidenav if header not found
      const existingSidenav = document.querySelector('#sidenav');
      if (existingSidenav) {
        existingSidenav.outerHTML = generateMenu(currentPage);
      }
    }
  }
  
  // Hide old sidebar if it exists
  const oldSidenav = document.querySelector('#sidenav');
  if (oldSidenav && oldSidenav.parentElement) {
    const sidebar = oldSidenav.parentElement;
    if (sidebar.classList.contains('yui-b')) {
      sidebar.style.display = 'none';
    }
  }
  
  // Add dropdown functionality
  initDropdowns();
  initMobileMenu();
}

// Initialize dropdown menus
function initDropdowns() {
  const dropdowns = document.querySelectorAll('.dropdown');
  
  dropdowns.forEach(dropdown => {
    const link = dropdown.querySelector('.nav-link');
    const menu = dropdown.querySelector('.dropdown-menu');
    
    if (link && menu) {
      link.addEventListener('click', function(e) {
        // Close other dropdowns
        dropdowns.forEach(other => {
          if (other !== dropdown) {
            other.classList.remove('open');
          }
        });
        
        // Toggle this dropdown
        dropdown.classList.toggle('open');
        e.preventDefault();
      });
    }
  });
  
  // Close dropdowns when clicking outside
  document.addEventListener('click', function(e) {
    if (!e.target.closest('.dropdown')) {
      dropdowns.forEach(dropdown => dropdown.classList.remove('open'));
    }
  });
}

// Initialize mobile menu toggle
function initMobileMenu() {
  const toggle = document.querySelector('.mobile-menu-toggle');
  const nav = document.querySelector('#main-nav');
  
  if (toggle && nav) {
    toggle.addEventListener('click', function() {
      nav.classList.toggle('mobile-open');
    });
  }
}

// Auto-inject menu when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', replaceMenu);
} else {
  replaceMenu();
}
