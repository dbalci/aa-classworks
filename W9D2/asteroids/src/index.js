console.log("Webpack is working!");

const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");


window.addEventListener('DOMContentLoaded', 
    function(){
        const canvasEl = document.getElementById('game-canvas');
        const ctx = canvasEl.getContext('2d');
        window.ctx = ctx;
        window.MovingObject = MovingObject;
        window.Asteroid = Asteroid;
        window.Game = Game;
        
    }
);

// canvasEl.height = window.innerHeight;
// canvasEl.width = window.innerWidth;qw

