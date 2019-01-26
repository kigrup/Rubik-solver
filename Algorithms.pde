// Half reorient upper left corner
final String ALGORITHM_HRULC = "RDrd";
// Full reorient upper left corner (HRULC x2)
final String ALGORITHM_RULC = "RDrdRDrd";
// Rotate upper corners excluding front upper-left
final String ALGORITHM_RCE = "urULuRUl";
// Swap front upper edge with left one
final String ALGORITHM_SLE = "ruRuruuRu";
// Iterate through yellow cross rotation
final String ALGORITHM_YCR = "fruRUF";
// Let piece fall to the left or right
final String ALGORITHM_FL = "ULulufUF";
final String ALGORITHM_FR = "urURUFuf";
// Rotate upper layer front edge
final String ALGORITHM_RUE = "fRDrff";

// Scramble from solved to last stage, S0 solves it
final String SCRAMBLE_S0A = "DRdrDRdrUDRdrDRdrDRdrDRdrUDRdrDRdrUDRdrDRdrDRdrDRdrU";
final String SCRAMBLE_S0B = "DRdrDRdruDRdrDRdrDRdrDRdruuu";

final String SCRAMBLE_S1A = "uDRdrDRdrDRdrDRdruDRdrDRdruDRdrDRdruDRdrDRdrDRdrDRdrLurUluRULurUluRU";
final String SCRAMBLE_S1B = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRU";

final String SCRAMBLE_S2A = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrUR";
final String SCRAMBLE_S2B = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrURWruRuruuRu";

final String SCRAMBLE_S3A = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrURWruRuruuRu";
final String SCRAMBLE_S3B = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrURWruRuruuRufruRUFfruRUFEfruRUF";

final String SCRAMBLE_S4A = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrURWruRuruuRufruRUFfruRUFEfruRUFULulufUFWWULulufUFEurURUFuf";

final String SCRAMBLE_S5A = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrURWruRuruuRufruRUFfruRUFEfruRUFULulufUFWWULulufUFEurURUFufNNRDrdRDrdERDrdERDrdRDrdE";
final String SCRAMBLE_S5B = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrURWruRuruuRufruRUFfruRUFEfruRUFULulufUFWWULulufUFEurURUFufNNRDrdRDrdERDrdERDrdRDrdERDrdWDRDrd";

final String SCRAMBLE_S6A = "uuDRdrDRdruuDRdrDRdrDRdrDRdrLurUluRUWLurUluRUUrUURUrURWWUrUURUrURWruRuruuRufruRUFfruRUFEfruRUFULulufUFWWULulufUFEurURUFufNNRDrdRDrdERDrdERDrdRDrdERDrdWDRDrdfRDrff";

final String SCRAMBLE_E0 = "uRbUFlWEULubDufLbFUdUrUuBlDRLbFBbbdURuEDEDDlLuuDrURWfbUDDuDBDBNWDLllNRULrSNNDBLESlrubLNrWlLrDuEBlDDS";
final String SCRAMBLE_E1 = "FfWErluFbuWFWDUBFbNuEbuEfBFWRbdflFdrlrbSErWbURULRuWSlDbEDENbLUlEblSEbNFLrLdrllbUdRdBSDuUuRFubbWWDLSN";
final String SCRAMBLE_E2 = "duErFrWRldNLLFULENLWFFblNBNfRrRuDElLuUWEbUBELbRbrUESDLLrubDfbuSfudFFrEEuLWErFWDUFRNRbuLBdrEREduRFuuf";
final String SCRAMBLE_E3 = "bLNFDdlBRWDbFBFDRBdWUrdSSuWBRFlWUfLWSFFSNDlDEELUrUuFUuDLfdFFbSuSBDWUDbWNdSuuLBfLlFUNlbRUFfdRUELRBbLl";

// CHECKS AND OTHER FUNCTIONS
Boolean CheckColor(Face face, int y, int x, color match) {
  if (face.squares[y][x] == match) return true;
  else return false;
}

Boolean CheckLeftEdgePosition() {
  color FM, FL, LM, LR;
  Cube r = abstract_rubik;
  FM = r.front.squares[1][1];
  FL = r.front.squares[1][0];
  LM = r.left.squares[1][1];
  LR = r.left.squares[1][2];

  if (FL != FM && FL != LM) {
    return false;
  } else if (LR != FM && LR != LM) {
    return false;
  } else {
    return true;
  }
}

Boolean CheckLeftEdgeRotation() {
  color FM, FL, LM, LR;
  Cube r = abstract_rubik;
  FM = r.front.squares[1][1];
  FL = r.front.squares[1][0];
  LM = r.left.squares[1][1];
  LR = r.left.squares[1][2];

  if (FM != FL || LM != LR) {
    return false;
  } else {
    return true;
  }
}

Boolean CheckUpEdgePosition(){
  color FM, FU, UD, UM;
  Cube r = abstract_rubik;
  FM = r.front.squares[1][1];
  FU = r.front.squares[0][1];
  UD = r.up.squares[2][1];
  UM = r.up.squares[1][1];
  
  if (FM == FU || FM == UD){
    if (UM == FU || UM == UD){
      return true;
    }
  }
  return false;
}

Boolean CheckUpEdgeRotation(){
  color FM, FU, UD, UM;
  Cube r = abstract_rubik;
  FM = r.front.squares[1][1];
  FU = r.front.squares[0][1];
  UD = r.up.squares[2][1];
  UM = r.up.squares[1][1];
  
  if (FM == FU && UM == UD){
    return true;
  }
  return false;
}

// Checks if edge ready to fall to the left
Boolean CheckUpEdgePositionFall() {
  color FM, LM, FU, UD;
  Cube r = abstract_rubik;
  FM = r.front.squares[1][1];
  LM = r.left.squares[1][1];
  FU = r.front.squares[0][1];
  UD = r.up.squares[2][1];
  if (FM == FU || FM == UD) {
    if (LM == FU || LM == UD) {
      return true;
    }
  }
  return false;
}

Boolean CheckUpRightCornerPosition() {
  Cube rubik = abstract_rubik;
  color[] cs = {rubik.front.squares[1][1], 
    rubik.right.squares[1][1], 
    rubik.up.squares[1][1]};

  for (int i = 0; i < 3; i++) {
    if (cs[i] != rubik.front.squares[0][2]) {
      if (cs[i] != rubik.up.squares[2][2]) {
        if (cs[i] != rubik.right.squares[0][0]) {
          return false;
        }
      }
    }
  }

  return true;
}

Boolean CheckUpRightCornerRotation() {
  Cube rubik = abstract_rubik;
  color[] cs = {rubik.front.squares[1][1], 
    rubik.right.squares[1][1], 
    rubik.up.squares[1][1]};

  if (cs[0] == rubik.front.squares[0][2]) {
    if (cs[1] == rubik.right.squares[0][0]) {
      if (cs[2] == rubik.up.squares[2][2]) {
        return true;
      }
    }
  }

  return false;
}

Boolean CheckUpLeftCornerPosition() {
  Cube rubik = abstract_rubik;
  rubik.Rotate('W');
  Boolean r = CheckUpRightCornerPosition();
  rubik.Rotate('E');
  return r;
}

// Checks if corner ready to place up, DOES NOT check for correct position
Boolean CheckDownRightCornerPosition() {
  Cube rubik = abstract_rubik;
  color[] cs = {rubik.front.squares[1][1], 
    rubik.right.squares[1][1], 
    white};

  for (int i = 0; i < 3; i++) {
    if (cs[i] != rubik.front.squares[2][2]) {
      if (cs[i] != rubik.down.squares[0][2]) {
        if (cs[i] != rubik.right.squares[2][0]) {
          return false;
        }
      }
    }
  }

  return true;
}

// SOLVE BY BEGINNERS METHOD STAGES

// Reorient corners
void Stage_0() {
  real_rubik_queue.add('0');
  for (int i = 0; i < 4; i++) {
    if (abstract_rubik.up.squares[2][2] == yellow) {
      abstract_rubik.Permute('U');
    } else {
      executeAlgorithm(ALGORITHM_RULC);
      if (abstract_rubik.up.squares[2][2] != yellow) {
        executeAlgorithm(ALGORITHM_RULC);
        abstract_rubik.Permute('U');
      } else {
        abstract_rubik.Permute('U');
      }
    }
  }
  real_rubik_queue.add('Z');
}

void PositionUpperCorners() {
  for (int i = 0; i < 4; i++) {
    if (CheckUpRightCornerPosition()) {
      if (!CheckUpLeftCornerPosition()) {
        executeAlgorithm(ALGORITHM_RCE);
        if (!CheckUpLeftCornerPosition()) {
          executeAlgorithm(ALGORITHM_RCE);
        } else {
          return;
        }
      } else {
        return;
      }
    } else {
      abstract_rubik.Rotate('E');
      if (i == 3) {
        executeAlgorithm(ALGORITHM_RCE);
        PositionUpperCorners();
      }
    }
  }
}

void Stage_1() {
  real_rubik_queue.add('1');

  PositionUpperCorners();

  Stage_0();

  total_instructions = real_rubik_queue.size();
  println("Attempting solve with " + (total_instructions - instructions_remaining_presolve) + " instructions");
  if (abstract_rubik.isSolved()){
    println("Solved succesfully");
  }
  else{
    println("Failed to solve!");
  }
  println();
}

// Loops until front and left are correct, run twice to have the 4 edges correct
void PositionUpEdges() {
  color FU, FM, LU, LM, BU;
  Cube r = abstract_rubik;
  FU = r.front.squares[0][1];
  FM = r.front.squares[1][1];
  LU = r.left.squares[0][1];
  LM = r.left.squares[1][1];
  BU = r.back.squares[0][1];

  if (FM == FU) {
    if (LM == LU) {
      executeAlgorithm("WW");
    } else {
      if (LM == BU) {
        executeAlgorithm("E");
        PositionUpEdges();
      }
    }
  } else {
    if (FM == LU && FU == LM) {
      executeAlgorithm(ALGORITHM_SLE);
      executeAlgorithm("WW");
    } else {
      executeAlgorithm("U");
      PositionUpEdges();
    }
  }
}

void Stage_2() {
  real_rubik_queue.add('2');

  PositionUpEdges();
  PositionUpEdges();

  Stage_1();
}

// cube.top.squares[1][1] has to be YELLOW
int YellowCrossAmount() {
  color[][] f = abstract_rubik.up.squares;
  color col = yellow;
  int c = 0;
  if (f[0][1] == col) c++;
  if (f[1][0] == col) c++;
  if (f[1][1] == col) c++;
  if (f[1][2] == col) c++;
  if (f[2][1] == col) c++;

  return c;
}

void YellowCross() {
  int YCA = YellowCrossAmount();
  if (YCA != 5) {
    Face f = abstract_rubik.up;
    if (YCA == 1) {
      executeAlgorithm(ALGORITHM_YCR);
      YellowCross();
    } else {
      if (CheckColor(f, 1, 0, yellow) && CheckColor(f, 0, 1, yellow)) {
        executeAlgorithm(ALGORITHM_YCR);
        YellowCross();
      } else {
        if (CheckColor(f, 1, 0, yellow) && CheckColor(f, 1, 2, yellow)) {
          executeAlgorithm(ALGORITHM_YCR);
          YellowCross();
        } else {
          executeAlgorithm("u");
          YellowCross();
        }
      }
    }
  }
}

void Stage_3() {
  real_rubik_queue.add('3');

  YellowCross();

  Stage_2();
}

// Searches for the edge that belongs between front and left faces
void PrepareFallingEdge() {
  Cube r = abstract_rubik; //<>//
  color F, L;
  F = r.front.squares[1][1];
  L = r.left.squares[1][1];

  // search for it on the upper layer
  for (int i = 0; i < 4; i++) {
    if (CheckUpEdgePositionFall()) {
      return;
    }
    executeAlgorithm("u");
  }

  // look if its buried in the wrong edge and put it in the upper layer
  for (int i = 0; i < 4; i++) {
    if (r.front.squares[1][2] == F || r.front.squares[1][2] == L) {
      if (r.right.squares[1][0] == L || r.right.squares[1][0] == F) {
        executeAlgorithm(ALGORITHM_FR);
      }
    }
    executeAlgorithm("E");
  } //<>//
  
  PrepareFallingEdge();
}

void FallEdge() {
  Cube r = abstract_rubik;
  if (r.front.squares[1][1] == r.front.squares[0][1]) {
    executeAlgorithm(ALGORITHM_FL);
  } else {
    executeAlgorithm("Wu");
    executeAlgorithm(ALGORITHM_FR);
    executeAlgorithm("E");
  }
}

void Stage_4() {
  real_rubik_queue.add('4');

  for (int i = 0; i < 4; i++) {
    if (CheckLeftEdgePosition()) {
      if (!CheckLeftEdgeRotation()) {
        executeAlgorithm(ALGORITHM_FL);
        executeAlgorithm("UU");
        executeAlgorithm(ALGORITHM_FL);
      }
    } else {
      PrepareFallingEdge();
      FallEdge();
      if (!CheckLeftEdgeRotation()) {
        executeAlgorithm(ALGORITHM_FL);
        executeAlgorithm("UU");
        executeAlgorithm(ALGORITHM_FL);
      }
    }

    executeAlgorithm("E");
  }

  Stage_3();
}

void PrepareCornerSwap() {
  Cube r = abstract_rubik;
  color F, R, U; //<>//
  F = r.front.squares[1][1];
  R = r.right.squares[1][1];
  U = white;

  // search for it on the bottom layer
  for (int i = 0; i < 4; i++) {
    if (CheckDownRightCornerPosition()) {
      return;
    }
    executeAlgorithm("d");
  }

  // look if its buried in the wrong edge and put it in the down layer
  for (int i = 0; i < 4; i++) {
    executeAlgorithm("E");

    if (r.front.squares[0][2] == F || r.up.squares[2][2] == F || r.right.squares[0][0] == F) {
      if (r.front.squares[0][2] == R || r.up.squares[2][2] == R || r.right.squares[0][0] == R) {
        if (r.front.squares[0][2] == U || r.up.squares[2][2] == U || r.right.squares[0][0] == U) {
          executeAlgorithm(ALGORITHM_HRULC);
        }
      }
    }
  }
   //<>//
  PrepareCornerSwap();
}

void Stage_5() {
  real_rubik_queue.add('5');

  for (int i = 0; i < 4; i++) {
    if (CheckUpRightCornerPosition()) {
      if (!CheckUpRightCornerRotation()) {
        executeAlgorithm(ALGORITHM_RULC);
        if (!CheckUpRightCornerRotation()) {
          executeAlgorithm(ALGORITHM_RULC);
        }
      }
    } else {
      PrepareCornerSwap();
      executeAlgorithm(ALGORITHM_HRULC);
      if (!CheckUpRightCornerRotation()) {
        executeAlgorithm(ALGORITHM_RULC);
        if (!CheckUpRightCornerRotation()) {
          executeAlgorithm(ALGORITHM_RULC);
        }
      }
    }

    executeAlgorithm("E");
  }

  executeAlgorithm("NN");

  Stage_4();
}

void PutWhiteUp(){
  Cube r = abstract_rubik;
  for (int i = 0; i < 6; i++){
    if (r.front.squares[1][1] == white){
      executeAlgorithm("S");
      return;
    }
    else if (r.up.squares[1][1] == white){
      return;
    }
    executeAlgorithm("N");
    if (r.front.squares[1][1] == white){
      executeAlgorithm("S");
      return;
    }
    else if (r.up.squares[1][1] == white){
      return;
    }
    executeAlgorithm("W");
  }
}

void PositionWhiteEdge(){
  Cube r = abstract_rubik;
  color F = r.front.squares[1][1];
  color U = white;
  
  // search among the front edges
  for (int i = 0; i < 4; i++){
    if (CheckUpEdgePosition()){
      return;
    }
    executeAlgorithm("f");
  }
  
  // search among the down edges
  for (int i = 0; i < 4; i++){
    if (CheckUpEdgePosition()){
      return;
    }
    executeAlgorithm("dff");
  }
  
  // search among the remaining edges (buried)
  Boolean found = false;
  for (int i = 3; i >= 0; i--){
    executeAlgorithm("E");
    if (!found){
      for (int j = 0; j < 4; j++){
        // check for the edge we're looking for
        if (!found)
        if (r.front.squares[2][1] == F || r.front.squares[2][1] == U){
          if (r.down.squares[0][1] == F || r.down.squares[0][1] == U){
            found = true;
            // when found, send to original front
            for (int b = 0; b < i; b++){
              executeAlgorithm("d");
            }
          }
        }
        executeAlgorithm("f");
      }
    }
  }
  PositionWhiteEdge();
}

void Stage_6() {
  instructions_remaining_presolve = real_rubik_queue.size();
  
  real_rubik_queue.add('6');
  
  PutWhiteUp();
  
  for (int i = 0; i < 4; i++){
    if (CheckUpEdgePosition()){
      if (!CheckUpEdgeRotation()){
        executeAlgorithm(ALGORITHM_RUE);
      }
    }
    else{
      PositionWhiteEdge();
      if (!CheckUpEdgeRotation()){
        executeAlgorithm(ALGORITHM_RUE);
      }
    }
    
    executeAlgorithm("E");
  }
  
  Stage_5();
}
