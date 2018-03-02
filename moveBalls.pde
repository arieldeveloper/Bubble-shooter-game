void moveBalls() {
  if (game) { 
    for (int i = number; i < ballX.length; i++) {
      if (ballVisible[i] == 1) {
        ballX[i] += xvelocity[i] ;
        ballY[i] += yvelocity[i];
        xvelocity[i] += xgravity;
        yvelocity[i] += ygravity;

        if ((ballX[i] > width) || (ballX[i] < 0)) {
          if (positive == true) { 
            positive = false;
          }
          if (positive == false) { 
            positive = true;
          }
          xvelocity[i] = xvelocity[i] * -1;
        }

        if (ballY[i] > height) {
          yvelocity[i] = yvelocity[i] * -0.95; 
          ballY[i] = height;
        }

        if (ballY[i] < 0) {
          yvelocity[i] = yvelocity[i] * -0.95; 
          ballY[i] = 0;
        }

        stroke(255);
        strokeWeight(2);
        fill(colour, 255, 255);
        ellipse(ballX[i], ballY[i], size[i], size[i]);
      }
    }
  }
}