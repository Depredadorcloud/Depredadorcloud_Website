// Initialize Lucide Icons
lucide.createIcons();

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Navigation background change on scroll
const navbar = document.getElementById('navbar');

window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
        navbar.style.background = 'rgba(15, 23, 42, 0.9)';
        navbar.style.borderBottom = '1px solid rgba(255, 255, 255, 0.2)';
        navbar.style.padding = '0.8rem 2rem';
    } else {
        navbar.style.background = 'rgba(15, 23, 42, 0.65)';
        navbar.style.borderBottom = '1px solid rgba(255, 255, 255, 0.1)';
        navbar.style.padding = '1.2rem 2rem';
    }
});
