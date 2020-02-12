function MovingObject(hash){
        this.pos = hash.pos;
        this.vel = hash.vel;
        this.radius = hash.radius;
        this.color = hash.color;
}

// const mo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"
// });

// console.log(mo);

MovingObject.prototype.draw = function(ctx) {
   ctx.fillStyle = this.color;
   ctx.beginPath();
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    ctx.fill();
};

MovingObject.prototype.move = function() {
    let newpos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
    this.pos = newpos;
};

// const mo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 30,
//     color: "#00FF00"
// });

module.exports = MovingObject;