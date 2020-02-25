/**
 * Initializes the Piece with its color.
 */
function Piece (color) {
  if (color === 'black') {
    this.color = 'black';
  }
  else {
    this.color = 'white';  
  }
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
  if (this.color === 'black') {
    this.color = 'white';
  }
  else {
    this.color = 'black';
  }
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
  if(this.color === "white"){
    return "W";
  }
  else{
    return "B";
  }
};

module.exports = Piece;
