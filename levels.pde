void levels() { 

  if (game) {
    if (level[1]) {
      println("level 1");
      createBalls(10, 10, 89, 20, -1.5, 2.1, 1);
      level[1] = false;
    }

    if (level[2]) {
      println("level 2");

      createBalls(10, 10, 28, 100, 1.5, 2.1, 1); 
      level[2] = false;
    }


    if (level[3]) {
      println("level 3");
      createBalls(100, 100, 99, 80, 1.5, 1.5, 1);
      createBalls(10, 10, 32, 100, 1.5, 2.1, 1); 
      level[3] = false;
    } 


    if (level[4]) {
      println("level 4");

      createBalls(100, 300, 40, 50, -1.8, 2.1, 1);
      createBalls(700, 300, 40, 50, 1.3, 1.2, 1); 
      createBalls(300, 300, 40, 50, -1.5, -1.5, 1);
      level[4] = false;
    }

    if (level[5]) {
      println("level 5");
      createBalls(600, 100, 40, 130, -1.8, 2.1, 1);
      level[5] = false;
    }
  }


  if (levelNumber == 1 && hitNumber == 3) { 
    level[2] = true;
    marioX = width / 2;
    coinsound.trigger();
    levelNumber = 2;
    score += 500;
    hitNumber = 0;
  }

  if (levelNumber == 2 && hitNumber == 15) { 
    level[3] = true;
    marioX = width / 2;
    coinsound.trigger();
    score += 500;
    levelNumber = 3;
    hitNumber = 0;
  }

  if (levelNumber == 3 && hitNumber == 30) { 
    level[4] = true;
    marioX = width / 2;
    coinsound.trigger();
    score += 500;
    levelNumber = 4;
    hitNumber = 0;
  } 

  if (levelNumber == 4 && hitNumber == 21) { 
    level[5] = true;
    marioX = width / 2;
    coinsound.trigger();
    score += 500;
    levelNumber = 5;
    hitNumber = 0;
  }

  if (levelNumber == 5 && hitNumber == 31) { 
    score += 500;
    coinsound.trigger();
    winner = true;
  }
}