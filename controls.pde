void controls() {
  if (game) { 
    if (keys[1]) {
      if (bulletVisible == false) { 
        bulletX = marioX + (marioW / 2);
      }
      marioDir = "left";

      marioXvelocity = -RUN_SPEED;
      if (marioY == GROUND_LEVEL)  currentFrame = nextLeftPic [currentFrame];    
      marioX -= 5;
      //if (keys[2] && triggerReleased) {
      //  bulletVisible = true;
      //} else if (keys[2]==false) {
      //  triggerReleased = true;
      //}
    } else if (keys[0]) {
      if (bulletVisible == false) { 
        bulletX = marioX+ (marioW / 2);
      }
      marioDir = "right";
      marioXvelocity = RUN_SPEED;
      if (marioY == GROUND_LEVEL)   currentFrame = nextRightPic [currentFrame];
      marioX += 5;
      //if (keys[2] && triggerReleased) {
      //  println("mistake1");
      //  bulletVisible = true;
      //} else if (keys[2]==false) {
      //  triggerReleased = true;
      //}
    } else {
      if (bulletVisible == false) { 
        bulletX = marioX + (marioW / 2);
      }
      //if (keys[2] && triggerReleased) {
      //  println("mistake2");
      //  bulletVisible = true;
      //} else if (keys[2]==false) {
      //  triggerReleased = true;
      //}

      marioXvelocity = 0;
      if (marioDir == "left") currentFrame = 0;          // when standing,the animation view is either 1 or 5,
      else if (marioDir == "right") currentFrame = 4 ;   // depending on the direction in which
    }
    if (keys[2] && triggerReleased) {
      bulletVisible = true;
    } else if (keys[2]==false) {
      triggerReleased = true;
    }
  }
}





//  else if (marioDir == "right")  currentFrame = 9;   // depending on the direction in which mario is facing
//} else if (keys[3] && marioY == GROUND_LEVEL) {
//  marioXvelocity = 0;
//  if (marioDir == "left") currentFrame = 10;    // when squatting the animation view is either 11 or 12,
//  else if (marioDir == "right")  currentFrame = 11;  // depending on the direction in which mario is facing
//}


void movePlayer() {
  marioX = marioX + marioXvelocity;
}