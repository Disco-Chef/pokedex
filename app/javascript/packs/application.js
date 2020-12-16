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
  triggerFavoritesButton();
});

let myStorage = window.sessionStorage;
console.log(myStorage);

const sendFavoritesInternalFetch = (event) => {
  console.log(" Coming Soon™... ")
  // fetch("http://localhost:3000/pokemons/favorites", {
  //   method: "POST",
  //   body: JSON.stringify({"favorites": setFavoritesArray()})
  // })
}

const triggerFavoritesButton = () => {
  const linksToFavorites = document.querySelectorAll(".fav-button");
  linksToFavorites.forEach((button) => {
    button.addEventListener('click', sendFavoritesInternalFetch);
  })
}


const setFavoritesArray = () => {
  let favoritesArray;
  if (myStorage.favorites && myStorage.favorites.includes(",")) {
    favoritesArray = myStorage.favorites.split(",");
    return favoritesArray;
  }
  else if (myStorage.favorites && !myStorage.favorites.includes(",")) {
    favoritesArray = new Array(myStorage.favorite);
    return favoritesArray;
  }
}
setFavoritesArray();

const setFavoriteButtonType = () => {
  let buttonToggleFavorite = document.querySelectorAll('.button-toggle-favorite');
  if (myStorage.favorites) {
    let favoritesArray = setFavoritesArray();
    let elementPokemonId = document.querySelectorAll(".pokemon-id");
    // if we are on show page and there is only one id element:
    if (elementPokemonId.length === 1) {
      let pokemonId = elementPokemonId[0].dataset.pokemonId;
      let favoritesArray = setFavoritesArray();
      if (favoritesArray.includes(pokemonId)) {
        buttonToggleFavorite[0].classList.remove("far");
        buttonToggleFavorite[0].classList.add("fas");
        buttonToggleFavorite[0].style.color = "red";
      }
    }
    // if we are on index: trickier, need to sibling-child/parent-sibling-hop
    else {
      favoritesArray.forEach((favoriteId) => {
        let buttonHeart = document.getElementById(favoriteId);
        buttonHeart.classList.remove("far");
        buttonHeart.classList.add("fas");
        buttonHeart.style.color = "red";
      })
    }
  }
}

const toggleFavorite = (event) => {
  console.log("Event Triggered! 😉")
  // set favoritesArray. can't split if only one element
  let favoritesArray = setFavoritesArray();
  let pokemonId = event.currentTarget.dataset.pokemonId;
  if (!myStorage.favorites) {
    myStorage.favorites = pokemonId;
    event.currentTarget.classList.add("fas");
    event.currentTarget.classList.remove("far");
    event.currentTarget.style.color = "red";
    console.log(myStorage.favorites);
  }
  else if (myStorage.favorites && favoritesArray.includes(pokemonId)) {
    let favoriteToRemoveIndex = favoritesArray.indexOf(pokemonId);
    favoritesArray.splice(favoriteToRemoveIndex, 1);
    myStorage.favorites = favoritesArray.join(",");
    event.currentTarget.classList.remove("fas");
    event.currentTarget.classList.add("far");
    event.currentTarget.style.color = "#0E0000";
    console.log(myStorage.favorites);
  }
  else if (myStorage.favorites && !favoritesArray.includes(pokemonId)) {
    myStorage.favorites += `,${pokemonId}`;
    event.currentTarget.classList.add("fas");
    event.currentTarget.classList.remove("far");
    event.currentTarget.style.color = "red";
    console.log(myStorage.favorites);
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
