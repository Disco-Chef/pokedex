Hosted at http://disco-pokedex.herokuapp.com/

# Study Advisor - test
## Setup
- If you wanna clone this project over and have fun with it locally, follow these:
  - Clone this repository and enter the local repo folder:
    - `$ git clone git@github.com:Disco-Chef/pokedex.git; cd pokedex`
  - Install all the rails pre-requisites, if you do not have them:
    - [Yarn](http://github.com) :
      - OsX: 
        `brew install yarn`
      - Ubuntu: 
        ```
          curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
          echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
          sudo apt-get update && sudo apt-get install yarn
        ```
    - [Bundler](https://bundler.io/) :
      - `gem install bundler`
  - Still from within `pokedex` folder, run:
    - `bundle;yarn;rails db:create db:migrate db:seed`
  - Go on [localhost:3000](http://localhost:3000) and browse through pokemon to your heart's content!
## Main functionality

   - [X] A user can browse individual pokemons
   - [X] A user can add pokemons to their favorites (no need to save to db, but should be mantained in session) 
  
## Bonus
  Some nice to haves, when there is time to spare.

   - [X] A user can browse pokemons based on their type
   - [ ] A user can compare base stats of two pokemons

## Complicated Bonus
  Do this *only* if you have a lot of time to spare / the challenge was way to easy, it is not only not required or expected, it is a tough one. 
  
   - [X] A user can see the evolution chain of a pokemon


Some possible inspirations for the design of your apps: 

https://repository-images.githubusercontent.com/268501098/50008280-a449-11ea-8f5d-68347e775dbb

https://static.wikia.nocookie.net/essentialsdocs/images/e/e2/PokedexList.png/revision/latest/scale-to-width-down/340?cb=20190511165233

https://cdn.dribbble.com/users/1171520/screenshots/6540871/pokedex2.png

https://cdn.dribbble.com/users/2759306/screenshots/13794991/media/2eac369c9b176c60c64a43868ee6f6f6.png
