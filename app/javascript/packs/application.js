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
  setFavoriteButtonType();
  loadFavoritizor();
});

let myStorage = window.sessionStorage;

const setFavoritesArray = () => {
  let favoritesArray;
  if (myStorage.favorites && myStorage.favorites.includes(",")) {
    favoritesArray = myStorage.favorites.split(",");
    return favoritesArray;
  }
  else if (myStorage.favorites && !myStorage.favorites.includes(",")) {
    favoritesArray = new Array(myStorage.favorites);
    return favoritesArray;
  }
}

setFavoritesArray();

const addFavoriteStyle = (domObject) => {
  domObject.classList.add("fas");
  domObject.classList.remove("far");
  domObject.style.color = "#DB324D";
}

const removeFavoriteStyle = (domObject) => {
  domObject.classList.remove("fas");
  domObject.classList.add("far");
  domObject.style.color = "black"
}

const setFavoriteButtonType = () => {
  let buttonToggleFavorite = document.querySelectorAll('.button-toggle-favorite');
  if (myStorage.favorites) {
    let favoritesArray = setFavoritesArray();
    let elementPokemonId = document.querySelectorAll(".pokemon-id");
    // if we are on show page and there is only one id element:
    if (elementPokemonId.length === 1) {
      let pokemonId = elementPokemonId[0].dataset.pokemonId;
      if (favoritesArray.includes(pokemonId)) {
        addFavoriteStyle(buttonToggleFavorite[0]);
      }
    }
    else {
      elementPokemonId.forEach((heartIcon) => {
        if (favoritesArray.includes(heartIcon.dataset.pokemonId)) {
          addFavoriteStyle(heartIcon)
        }
      })
    }
  }
}

const toggleFavorite = (event) => {
  let favoritesArray = setFavoritesArray();
  let pokemonId = event.currentTarget.dataset.pokemonId;
  if (!myStorage.favorites) {
    myStorage.favorites = pokemonId;
    addFavoriteStyle(event.currentTarget);
    setFavoriteButtonType();
  }
  else if (myStorage.favorites && favoritesArray.includes(pokemonId)) {
    let favoriteToRemoveIndex = favoritesArray.indexOf(pokemonId);
    favoritesArray.splice(favoriteToRemoveIndex, 1);
    myStorage.favorites = favoritesArray.join(",");
    removeFavoriteStyle(event.currentTarget);
    setFavoriteButtonType();
  }
  else if (myStorage.favorites && !favoritesArray.includes(pokemonId)) {
    myStorage.favorites += `,${pokemonId}`;
    addFavoriteStyle(event.currentTarget);
    setFavoriteButtonType();
  } 
}

const loadFavoritizor = () => {
  let buttonToggleFavorite = document.querySelectorAll('.button-toggle-favorite');
  if (buttonToggleFavorite) {
    buttonToggleFavorite.forEach((button) => {
      button.addEventListener('click', toggleFavorite);
    })
  }
}
