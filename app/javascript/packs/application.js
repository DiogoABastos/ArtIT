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

const findArt = document.querySelector('.button');

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

const search = document.querySelector('.search-form');
let clicked = localStorage.getItem('clicked') === 'true' || false;

if (search) {
  search.addEventListener('click', () => {
    clicked = true;
    localStorage.setItem('clicked', clicked);
  });
}

window.onload = (e) => {
  if (clicked) {
    window.scrollTo({
      top: window.innerHeight,
      left: 0,
      behavior: 'smooth'
    });
  }

  clicked = false;
  localStorage.setItem('clicked', clicked);
}

function scrollBottom() {
  const forum = document.querySelector('.message-container');

  if (forum) {
      forum.scrollTop = forum.scrollHeight;
      console.log('hello');
  }
}

window.onload = scrollBottom;
