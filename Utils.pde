boolean contains(char c, char[] array) {
    for (char x : array) {
        if (x == c) {
            return true;
        }
    }
    return false;
}

void swap(int ay, int by, color[][] arr) {
  color[] t = arr[ay];
  arr[ay] = arr[by];
  arr[by] = t;
}

void swap(int ay, int ax, int by, int bx, color[][] arr) {
  color t = arr[ay][ax];
  arr[ay][ax] = arr[by][bx];
  arr[by][bx] = t;
}

void swap(int ay, int ax, int by, int bx, color[][] arra, color[][] arrb) {
  color t = arra[ay][ax];
  arra[ay][ax] = arrb[by][bx];
  arrb[by][bx] = t;
}

void swapY(int ay, int by, color[][] arra, color[][] arrb) {
  color[] t = arra[ay];
  arra[ay] = arrb[by];
  arrb[by] = t;
}

void swapX(int ax, int bx, color[][] arra, color[][] arrb){
  swap(0, ax, 0, bx, arra, arrb);
  swap(1, ax, 1, bx, arra, arrb);
  swap(2, ax, 2, bx, arra, arrb);
}

void swapYtoX(int ay, int bx, color[][] arra, color[][] arrb){
  swap(ay, 0, 0, bx, arra, arrb);
  swap(ay, 1, 1, bx, arra, arrb);
  swap(ay, 2, 2, bx, arra, arrb);
}

void swapXtoY(int ax, int by, color[][] arra, color[][] arrb){
  swap(0, ax, by, 0, arra, arrb);
  swap(1, ax, by, 1, arra, arrb);
  swap(2, ax, by, 2, arra, arrb);
}

void reverseX(int x, color[][] arr){
  swap(0, x, 2, x, arr);
}

void reverseY(int y, color[][]arr){
  swap(y, 0, y, 2, arr);
}

void moveSquares(Face face, Boolean clockwise){
  color[][] s = face.squares;
  if (clockwise){
    color[][] n = { {s[2][0], s[1][0], s[0][0]},
                  {s[2][1], s[1][1], s[0][1]},
                  {s[2][2], s[1][2], s[0][2]} };
    face.squares = n;
  }
  else{
    color[][] n = { {s[0][2], s[1][2], s[2][2]},
                  {s[0][1], s[1][1], s[2][1]},
                  {s[0][0], s[1][0], s[2][0]} };
    face.squares = n;
  }
}

// UI

color stageColor(int i){
  if (i < current_stage){
    return red;
  }
  else if (i == current_stage){
    return yellow;
  }
  else{
    return green;
  }
}

Boolean equals(Cube a, Cube b){
  for (int i = 0; i < 6; i++){
    Face fa = a.getFace(i);
    Face fb = b.getFace(i);
    for (int y = 0; y < 3; y++){
      for (int x = 0; x < 3; x++){
        if (fa.squares[y][x] != fb.squares[y][x]){
          return false;
        }
      }
    }
  }
  return true;
}
