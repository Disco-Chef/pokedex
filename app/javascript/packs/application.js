// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});
let myStorage = window.sessionStorage;

console.log(myStorage);

const toggleFavorite = () => {
  let idElement = document.querySelector("#pokemon-id");
  let pokemonId = idElement.textContent.replace("#", "");
  if (!myStorage.favorites) {
    myStorage.favorites = pokemonId;
    console.log(myStorage.favorites);
  }
  else if (myStorage.favorites && myStorage.favorites.split(",").includes(pokemonId)) {
    let favoritesArray = myStorage.favorites.split(",");
    let favoriteToRemoveIndex = myStorage.favorites.split(",").indexOf(pokemonId);
    favoritesArray.splice(favoriteToRemoveIndex, 1);
    myStorage.favorites = favoritesArray.join(",");
    console.log(myStorage.favorites);
  }
  else if (myStorage.favorites && !myStorage.favorites.includes(pokemonId)) {
    myStorage.favorites += `,${pokemonId}`;
    console.log(myStorage.favorites);
  } 
}


const buttonFavorite = document.querySelector('#button-favorite');
if (buttonFavorite) {
  buttonFavorite.addEventListener('click', toggleFavorite);
}
