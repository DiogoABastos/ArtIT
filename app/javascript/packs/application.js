import "bootstrap";
import "../plugins/flatpickr";

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

const navbar = document.querySelector('.navbar');
const btnNav = document.querySelectorAll('.btn-nav');

if (navbar && btnNav) {
  window.addEventListener('scroll', () => {
    if (window.scrollY >= window.innerHeight - navbar.clientHeight) {
      navbar.classList.add('black');
      btnNav.forEach(btn => btn.classList.add('back-btn'));
    } else {
      navbar.classList.remove('black')
      btnNav.forEach(btn => btn.classList.remove('back-btn'));
    }
  });
}

const findArt = document.querySelector('.find-art');

if (findArt) {
  findArt.addEventListener('click', () => {
    window.scrollTo({
      top: window.innerHeight,
      left: 0,
      behavior: 'smooth'
    })
  });
}

const dropdown = document.querySelector('.art-dropdown');
const avatar = document.querySelector('.avatar');

if (dropdown && avatar) {
  avatar.addEventListener('click', (e) => {
    e.preventDefault();
    dropdown.classList.toggle('art-flex');
  });
}
