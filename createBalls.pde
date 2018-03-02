void createBalls(int x, int y, int colourChosen, int sizeofball, float velocityx, float velocityy, int starter) {
  colour = colourChosen;
  size = append(size, sizeofball);
  ballX = append(ballX, float(x));
  ballY = append(ballY, float(y));
  ballVisible = append(ballVisible, 1);
  xvelocity = append(xvelocity, velocityx); 
  yvelocity = append(yvelocity, velocityy);
  starterBubbles = append(starterBubbles, starter);
}