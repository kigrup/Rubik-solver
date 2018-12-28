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

Cube rubik;

void setup(){
  size(500, 500, P3D);
  x = 0;
  y = 0;
  z = 0;
  
  orbitRadius = 700;
  
  eyeY = -50;
  
  centerX = 0;
  centerY = 0;
  centerZ = 0;
  
  upX = 0.0;
  upY = 1.0;
  upZ = 0.0;
  
  rot = 0;
  
  rubik = new Cube();
}

void draw(){
  rectMode(CENTER);
  textSize(40);
  background(200, 200, 200);
  
  // CAMERA
  eyeX = cos(rot) * orbitRadius;
  eyeZ = sin(rot) * orbitRadius;
 
  camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
  
  // CUBE
  
  // floor
  rotateX(PI/2);
  fill(white);
  //rect(0, 0, 500, 500);
  
  // faces
  translate(-faceWidth, -faceWidth, +faceWidth +faceHalf);
  rubik.up.drawFace();
  
  rotateX(-PI/2);
  translate(-faceWidth*2, faceHalf, faceHalf); 
  rubik.front.drawFace();
  rotateY(PI/2);
  translate(faceHalf, -faceWidth*2, faceHalf);
  rubik.right.drawFace();
  rotateY(PI/2);
  translate(faceHalf, -faceWidth*2, faceHalf);
  rubik.back.drawFace();
  rotateY(PI/2);
  translate(faceHalf, -faceWidth*2, faceHalf);
  rubik.left.drawFace();
  translate(0, faceHalf, 0);
  rotateY(PI/2);
  rotateX(-PI/2);
  translate(faceHalf, 0, 0);
  rubik.down.drawFace();
}

void executeAlgorithm(String algorithm){
  int l = algorithm.length();
  for (int i = 0; i < l; i++){
    rubik.Permute(algorithm.charAt(i));
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      eyeY -= 160;
    }
    else if (keyCode == DOWN){
      eyeY += 160;
    }
    else if (keyCode == RIGHT){
      rot+= 0.4;
    }
    else if (keyCode == LEFT){
      rot-= 0.4;
    }
  }
  else if (key == ENTER){
      executeAlgorithm("urUllurruRllULuDrL");
    }
  
  else if (contains(key, permutations)){
    rubik.Permute(key);
    print(key);
    if (Character.isUpperCase(key)){
      print("'");
    }
    print(" ");
  }
}
