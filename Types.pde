color red = color(240, 0, 0);
color green = color(0, 240, 0);
color blue = color(0, 0, 240);
color white = color(255,255,255);
color yellow = color(247, 236, 29);
color orange = color(255, 157, 0);

class Face{
  color[][] squares = new color[3][3];
  public Face(color c){
    for (int j = 0; j < 3; j++){
      for (int i = 0; i < 3; i++){
        squares[j][i] = c;
      }
    }
    //squares[0][0] = color(255,0,255);
  }
  
  public void drawFace(){
    fill(squares[0][0]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(faceWidth, 0, 0);
    fill(squares[0][1]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(faceWidth, 0, 0);
    fill (squares[0][2]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(-faceWidth*2, faceWidth, 0);
    fill(squares[1][0]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(faceWidth, 0, 0);
    fill(squares[1][1]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(faceWidth, 0, 0);
    fill (squares[1][2]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(-faceWidth*2, faceWidth, 0);
    fill(squares[2][0]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(faceWidth, 0, 0);
    fill(squares[2][1]);
    rect(0, 0, faceWidth, faceWidth);
    
    translate(faceWidth, 0, 0);
    fill (squares[2][2]);
    rect(0, 0, faceWidth, faceWidth);
  }
}

class Cube{
  Face down, front, left, right, up, back;
  public Cube(){
    down = new Face(white);
    front = new Face(red);
    left = new Face(blue);
    right = new Face(green);
    up = new Face(yellow);
    back = new Face(orange);
  }
  
  // lowercase = clockwise
  // uppercase = anti-clockwise
  public void Permute(char c){
    // Upper clockwise
    if (c == 'u'){
      moveSquares(this.up, true);
      swapY(0, 0, front.squares, left.squares);
      swapY(0, 0, front.squares, back.squares);
      swapY(0, 0, front.squares, right.squares);
    }
    // Upper anti-clockwise
    else if (c == 'U'){
      moveSquares(this.up, false);
      swapY(0, 0, front.squares, right.squares);
      swapY(0, 0, front.squares, back.squares);
      swapY(0, 0, front.squares, left.squares);
    }
    // Down clockwise
    else if (c == 'd'){
      moveSquares(this.down, true);
      swapY(2, 2, front.squares, right.squares);
      swapY(2, 2, front.squares, back.squares);
      swapY(2, 2, front.squares, left.squares);
    }
    // Down anti-clockwise
    else if (c == 'D'){
      moveSquares(this.down, false);
      swapY(2, 2, front.squares, left.squares);
      swapY(2, 2, front.squares, back.squares);
      swapY(2, 2, front.squares, right.squares);
    }
    // Right clockwise
    else if (c == 'r'){
      moveSquares(this.right, true);
      swapX(2, 2, front.squares, up.squares);
      swapX(2, 0, front.squares, back.squares);
      reverseX(0, back.squares);
      swapX(2, 2, front.squares, down.squares);
      reverseX(2, down.squares);
    }
    // Right anti-clockwise
    else if (c == 'R'){
      moveSquares(this.right, false);
      swapX(2, 2, front.squares, down.squares);
      swapX(2, 0, front.squares, back.squares);
      reverseX(0, back.squares);
      swapX(2, 2, front.squares, up.squares);
      reverseX(2, up.squares);
    }
    // Left clockwise
    else if (c == 'l'){
      moveSquares(this.left, true);
      swapX(0, 0, front.squares, down.squares);
      swapX(0, 2, front.squares, back.squares);
      reverseX(2, back.squares);
      swapX(0, 0, front.squares, up.squares);
      reverseX(0, up.squares);
    }
    // Left anti-clockwise
    else if (c == 'L'){
      moveSquares(this.left, false);
      swapX(0, 0, front.squares, up.squares);
      swapX(0, 2, front.squares, back.squares);
      reverseX(2, back.squares);
      swapX(0, 0, front.squares, down.squares);
      reverseX(0, down.squares);
    }
    else if (c == 'f'){
      moveSquares(this.front, true);
      swapYtoX(2, 0, up.squares, right.squares);
      swapY(2, 0, up.squares, down.squares);
      reverseY(0, down.squares);
      swapYtoX(2, 2, up.squares, left.squares);
      reverseY(2, up.squares);
    }
  }
}
