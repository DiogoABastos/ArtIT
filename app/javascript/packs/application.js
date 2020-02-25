import "bootstrap";

const navbar = document.querySelector('.navbar');

if (navbar) {
  window.addEventListener('scroll', () => {
    if (window.scrollY >= window.innerHeight - navbar.clientHeight) {
      navbar.classList.add('white');
    } else {
      navbar.classList.remove('white')
    }
  });
}
