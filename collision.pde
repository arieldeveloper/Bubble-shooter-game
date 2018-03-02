void collision() {

  //checks if bullet hits ball
  for (int i = 0; i < ballX.length; i++) { 
    if (bulletVisible == true && ballVisible[i] == 1 && game) { 
      if (bulletX >= ballX[i] - size[i] / 2 && bulletX <= ballX[i] + size[i] / 2 && lineY < ballY[i] ) {
        pop.trigger(); 

        hitNumber += 1;
        score += 100;
        ballx = int(ballX[i]);
        bally = int(ballY[i]);
        lineY = 600;
        bulletVisible = false;

        ballVisible[i] = 2;


        if (size[i] > 15) {
          createBalls(ballx, bally, 12, size[i] / 2, 1.5, 2.5, 2);
          createBalls(ballx, bally, 12, size[i] / 2, -2.5, 2.5, 2);
        }
        colour = int(random(255));
        //checks if ball hits the bullet while bullet is in the air
      } else if (lineY <= ballY[i] + size[i] / 2 && lineY >= ballY[i] - size[i] / 2  && bulletX >= ballX[i] - size[i] / 2 && bulletX <= ballX[i] + size[i] / 2) {
        println("second");

        pop.trigger(); 

        score += 100;
        hitNumber += 1; 

        ballx = int(ballX[i]);
        bally = int(ballY[i]);

        lineY = 600;
        bulletVisible = false;
        ballVisible[i] = 2;
        if (size[i] > 15) {
          createBalls(ballx, bally, 12, size[i] / 2, 1.5, 2.5, 2);
          createBalls(ballx, bally, 12, size[i] / 2, -2.5, 2.5, 2);
        }
        colour = int(random(255));
      }
    }
  }

  for (int i = 0; i < ballX.length; i++) { //Checks if ball hits mario
    if (ballVisible[i] == 1 && game) { 
      if (ballX[i] >= marioX && ballX[i] <= marioX + marioW && ballY[i] + size[i] / 2 >= marioY) {
        hitNumber = 0;
        music.rewind();
        lives -= 1;

        if (lives == 0) {
          gameover = true;
        } else { 
          for (int x = 0; x < ballX.length; x++) {
            ballX[x] = width  / 3;
            ballY[x] = height / 2 + 100;
            marioX = width / 2;
            background(255);
            ballVisible[x] = 2;
            level[levelNumber] = true;
          }
        }
      }
    }
  }
}