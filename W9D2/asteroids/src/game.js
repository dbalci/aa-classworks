const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

const DIM_X = 700;
const DIM_Y = 1000;
const NUM_ASTERIOIDS = 7;

function Game() {
    this.asteroidArr = [];
    this.addAsteroids();

}

Game.prototype.draw = function(ctx){
    ctx.clearRect(0,0,700, 1000);

    for (let j = 0; j < this.asteroidArr.length; j++) {
        this.asteroidArr[j].draw(ctx);
    }
};

Game.prototype.addAsteroids = function() {

    for (let i = 0; i < NUM_ASTERIOIDS + 1; i++) {
        this.asteroidArr.push(new Asteroid(this.randomPosition()));
    }
 
};


Game.prototype.randomPosition = function() {
    return {pos : [Math.random() * 500, Math.random() * 500]};
};
module.exports = Game;