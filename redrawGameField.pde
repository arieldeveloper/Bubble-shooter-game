void redrawGameField() {
  background(255);
  if (game) { 
    musicbool = true;
    img.resize(800, 600);  
    image(img, 0, 0);// background
    fill(0);
    textSize(25);
    text("Lives: " + lives, 650, 70);
    text("Score: " + score, 100, 70);
    text("Level " + levelNumber, 370, 70);

    if (bulletVisible == true) { 
      fill(0);
      stroke(0);
      line(bulletX, bulletY, bulletX, lineY);
      lineY -= 10;

      if (lineY == 0 && bulletVisible) { //touches the top 
        bulletVisible = false;
        lineY = 600;
      }
    } 

    image(images [currentFrame], marioX, marioY);
    marioH = mario.height;
  }
}