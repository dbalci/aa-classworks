const MovingObject = require("./moving_object.js");
const utils = require("./utils.js");

const COLOR = "#e9a2ff";
const RADIUS = 20;

function Asteroid(pos){
    this.pos = pos.pos;
    this.vel = utils.randomVec(Math.random() * 100);
    this.radius = RADIUS;
    this.color = COLOR;
}

utils.inherits(Asteroid, MovingObject);

module.exports = Asteroid;

// new Asteroid({ pos: [30, 30] })