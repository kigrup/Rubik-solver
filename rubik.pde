float x, y, z;
float rx, ry, rz;

float eyeX, eyeY, eyeZ;
float centerX, centerY, centerZ;
float upX, upY, upZ;

float rot;
float orbitRadius;

float faceWidth = 100;
float faceHalf = faceWidth/2;

char[] permutations = {'u', 'U', 'd', 'D', 'r', 'R', 'l', 'L', 'f', 'F', 'b', 'B'};
char[] rotations = {'N', 'E', 'S', 'W'};
char[] stages = {'Z', '0', '1', '2', '3', '4', '5', '6'};

Cube abstract_rubik;
Cube real_rubik;

ArrayList<Character> real_rubik_queue = new ArrayList<Character>();
int total_instructions = 1;
int frameModulo = 0;
Boolean autoplay = true;
Boolean draw_real = true;

Boolean solved = true;
int current_stage = 7;

int instructions_remaining_presolve;

void setup() {
  size(500, 500, P3D);
  frameRate(30);
  x = 0;
  y = 0;
  z = 0;

  orbitRadius = 700;

  eyeY = -300;

  centerX = 0;
  centerY = 0;
  centerZ = 0;

  upX = 0.0;
  upY = 1.0;
  upZ = 0.0;

  rot = -150;

  abstract_rubik = new Cube();
  abstract_rubik.isAbstract = true;
  real_rubik = new Cube();
  real_rubik.isAbstract = false;
}

void ExecuteQueue() {
  if (!real_rubik_queue.isEmpty()) {
    char c = real_rubik_queue.get(0);
    if (contains(c, permutations)) {
      real_rubik.Permute(c);
    } else if (contains(c, rotations)) {
      real_rubik.Rotate(c);
    } else {
      if (c == 'Z') {
        current_stage = -1;
      } else {
        int r = Integer.parseInt(String.valueOf(c));
        current_stage = r;
      }
    }

    solved = real_rubik.isSolved();
    real_rubik_queue.remove(0);

    if (solved) current_stage=-1;
  }
}

void draw() {
  rectMode(CENTER);
  textSize(40);
  background(200, 200, 200);
  strokeWeight(1);

  if (solved) {
    background(200, 250, 200);
  } else {
    background(250, 200, 200);
  }

  // REAL_RUBIK PERMUTATIONS
  if (frameModulo % 2 == 0) {
    ExecuteQueue();
    frameModulo = 1;
  }
  if (autoplay) {
    frameModulo++;
  }

  // CAMERA
  eyeX = cos(rot) * orbitRadius;
  eyeZ = sin(rot) * orbitRadius;

  camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);

  // CUBE

  // floor
  rotateX(PI/2);
  fill(white);

  // faces
  if (draw_real) {
    //println("drawing real");
    translate(-faceWidth, -faceWidth, +faceWidth +faceHalf);
    real_rubik.up.drawFace();
    
    rotateX(-PI/2);
    translate(-faceWidth*2, faceHalf, faceHalf); 
    real_rubik.front.drawFace();
    rotateY(PI/2);
    translate(faceHalf, -faceWidth*2, faceHalf);
    real_rubik.right.drawFace();
    rotateY(PI/2);
    translate(faceHalf, -faceWidth*2, faceHalf);
    real_rubik.back.drawFace();
    rotateY(PI/2);
    translate(faceHalf, -faceWidth*2, faceHalf);
    real_rubik.left.drawFace();
    translate(0, faceHalf, 0);
    rotateY(PI/2);
    rotateX(-PI/2);
    translate(faceHalf, 0, 0);
    real_rubik.down.drawFace();
  } else {
    //println("drawing abstract");
    translate(-faceWidth, -faceWidth, +faceWidth +faceHalf);
    abstract_rubik.up.drawFace();

    rotateX(-PI/2);
    translate(-faceWidth*2, faceHalf, faceHalf); 
    abstract_rubik.front.drawFace();
    rotateY(PI/2);
    translate(faceHalf, -faceWidth*2, faceHalf);
    abstract_rubik.right.drawFace();
    rotateY(PI/2);
    translate(faceHalf, -faceWidth*2, faceHalf);
    abstract_rubik.back.drawFace();
    rotateY(PI/2);
    translate(faceHalf, -faceWidth*2, faceHalf);
    abstract_rubik.left.drawFace();
    translate(0, faceHalf, 0);
    rotateY(PI/2);
    rotateX(-PI/2);
    translate(faceHalf, 0, 0);
    abstract_rubik.down.drawFace();
  }

  hint(DISABLE_DEPTH_TEST);
  camera();
  noLights();
  // 2D DRAWING (UI)
  hint(ENABLE_DEPTH_TEST);

  strokeWeight(2);
  stroke(0);
  textAlign(CENTER, CENTER);
  textSize(20);

  // Stages state
  for (int i = 0; i <= 6; i++) {
    fill(stageColor(i));
    rect(440, 30 + i*50, 100, 30);
    fill(0);
    String str = "Stage " + i;
    text(str, 440, 28 + i*50);
  }

  // Instructions
  textAlign(LEFT, CENTER);
  int remaining_instructions = real_rubik_queue.size();
  text("Instructions remaining: " + remaining_instructions, 5, 430);
  int percent = 100 - (100 * remaining_instructions/total_instructions);
  text("Done " + percent + "%", 5, 400);
  
  // Queue
  textAlign(CENTER, CENTER);
  textSize(20);
  int l = min(40, real_rubik_queue.size());
  for (int i = 0; i < l; i++) {
    text(real_rubik_queue.get(i), 10 + i*12, 460);
  }
}

String randomAlgorithm(int size){
  String r = "";
  for (int i = 0; i < size; i++){
    if (random(0, 4) < 1){
      r += rotations[(int)random(0,4)];
    }
    else{
      r += permutations[(int)random(0,12)];
    }
  }
  return r;
}

void executeAlgorithm(String algorithm) {
  int l = algorithm.length();
  for (int i = 0; i < l; i++) {
    char c = algorithm.charAt(i);
    if (contains(c, permutations)){
      abstract_rubik.Permute(c);
    }
    else{
      abstract_rubik.Rotate(c);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      eyeY -= 160;
    } else if (keyCode == DOWN) {
      eyeY += 160;
    } else if (keyCode == RIGHT) {
      rot+= 0.4;
    } else if (keyCode == LEFT) {
      rot-= 0.4;
    }
  } else if (key == ENTER) {
    Stage_6();
  } else if (key == 'm') {
    frameModulo = 0;
  } else if (key == 'v') {
    autoplay = !autoplay;
  } else if (key == 'c') {
    draw_real = !draw_real;
  } else if (key == BACKSPACE) {
    String alg;
    alg = randomAlgorithm(100);
    println("Shuffle: " + alg);
    executeAlgorithm(alg);
    total_instructions = alg.length();
    current_stage = 7;
  } else if (contains(key, permutations)) {
    abstract_rubik.Permute(key);
  } else if (contains(key, rotations)) {
    abstract_rubik.Rotate(key);
  }
}
