//Ariel Chouminov

//Minim variables 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer music; //background music 
AudioSample pop; //sound when ball hits paddle
AudioPlayer gameoversound; //game over sound
AudioSample coinsound; //sound when ball hits paddle

//PImage variables
PImage img; 
PImage backgroundintro;

PImage background;

boolean positive = true;
int dist;

int goUp = 0;

//ball variables 
float[] ballX = {};
float[] ballY = {} ;
int[] size = {};
int number = 0;
float x = 100;
float y = 100;
float xgravity = 0; 
float ygravity = 0.2; 
int colour = 233;
float[] xvelocity = {};
float[] yvelocity = {};
int ballx; 
int bally; 
int[] ballVisible = {1, 1};


//bullet/line variables 
int[] line = new int[10];
int numFrames = 12;   // the number of frames
PImage [] images = new PImage [numFrames]; //make the array
int[] nextLeftPic = {1, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1};
int[] nextRightPic = {4, 4, 4, 4, 5, 6, 7, 5, 4, 4, 4, 4};
int bulletW = 4;                             
int lineY = 600;                             
int bulletSpeed = 2;
boolean bulletVisible = false;

//Mario
boolean triggerReleased = true;
int GROUND_LEVEL = 540; 
int RUN_SPEED = 500;
PImage mario;
int marioH;
int marioW;
int marioX;
int marioY = GROUND_LEVEL;
int bulletX = 400; 
int bulletY = 600;
int marioXvelocity = 0; 
int marioYvelocity = 0;
int currentFrame = 0;   // current view of mario
String marioDir = "left";  // direction in which mario is facing
Boolean[] keys = new Boolean[3]; //Representes each button input in its array
boolean[] level = new boolean[11]; //controls the levels 
int[] starterBubbles = {};
//intro, gameover and restart level screens 
boolean intro = true; 
boolean gameover = false;
boolean game = false;
boolean winner  = false;
boolean musicbool = false;
int lives = 4;
int levelNumber = 4;
int hitNumber = 0;
int score = 0;
int numbs = 0;
void setup() {
  size (800, 600);
  background(0);
  smooth();
  keys[0]=false; // all are false, since they are not key pressed yet (only in keyPressed)
  keys[1]=false;
  keys[2]=false;

  img = loadImage("mariobg.png");
  //mario
  mario = loadImage("pic1.bmp");
  backgroundintro = loadImage("imger.png");
  marioH = mario.height;
  marioW = mario.width;
  marioX = round(width/2);


  for (int i = 0; i < images.length; i++) {
    String imageName = "pic" + nf (i, 1) + ".bmp";
    images [i] = loadImage (imageName); // load each image
  }

  for (int i = 2; i < level.length; i++) {
    level[i] = false;
  }

  //load minim
  minim = new Minim(this);
  music = minim.loadFile("themesong.mp3");
  pop = minim.loadSample("poppy.mp3", 512);
  coinsound = minim.loadSample("coinsound.mp3", 512);
  gameoversound = minim.loadFile("gameoversound.mp3");
  colorMode(HSB);
  smooth();
}

// Main Program                                       
void draw() {

  redrawGameField();
  collision();
  moveBalls();
  controls();
  levels();

  marioX = constrain(marioX, 0, 760);

  if (intro) {
    introScreen();
  }
  if (gameover) {
    gameOverScreen();
    gameoversound.play();
  }
  if (musicbool == false) { 
    music.pause();
  }
  if (game) { 

    gameoversound.rewind();
    if (!music.isPlaying()) {
      music.rewind();
      music.play();
    }
  }

  if (winner) {
    winnerScreen();
  }
}


void introScreen() {
  textAlign(CENTER);
  fill(0);
  backgroundintro.resize(800, 600);  
  image(backgroundintro, 0, 0);// background
  textSize(40);
  text("Welcome to Troubled Bubble", width / 2, 140);
  textSize(20);
  text("Shoot the bubbles to destroy them and do not get hit!", width /2, 240);
  text("Use ARROW keys to move + SPACEBAR to Shoot", width /2, 290);
  textSize(17);
  text("Press G to start!", width / 2, 380);

  if (key == 'g' || key == 'G' && keyPressed && game == false  && intro == true) {
    intro = false;
    game = true;
    gameover = false;

    level[levelNumber] = true;
  }
}

void gameOverScreen() {
  game = false;
  musicbool = false;
  background(0);
  fill(255);
  textSize(40);
  text("Game Over!", width / 2, 190);
  text("Your score was: " + score, width / 2, 300);
  textSize(20);
  text("Press G to play again!", width / 2, 380);



  if (key == 'g' || key == 'G' && keyPressed && intro == false) {
    for (int x = 0; x < ballX.length; x++) {
      gameover = false;
      ballVisible[x] = 2;
    }
    levelNumber =  1;
    level[levelNumber] = true;
    marioX = width / 2;
    game = true;
    lives = 4;
    score = 0;
  }
}

void winnerScreen() {
  game = false;
  background(0);
  fill(255);
  textSize(30);
  text("Wow. You actually beat the game...", width /2, 190);
  text("Good job, you completed the impossible.", width /2, 240);
  text("By the way, your score was: " + score, width /2, 300);
  text("Thanks for playing!", width /2, 390);
  textSize(20);
} 


void keyPressed() {
  if (key==CODED && keyCode==RIGHT) keys[0]=true;
  if (key==CODED && keyCode==LEFT) keys[1]=true;
  if (key== ' ') keys[2]=true;
}

void keyReleased() {
  if (key==CODED && keyCode==RIGHT) keys[0]=false;
  if (key==CODED && keyCode==LEFT) keys[1]=false;
  if (key == ' ' ) keys[2]=false;
}

void remove(float array[], int item) {
  for (int i = item +1; i < array.length; i++) {
    array[i-1] = array[i];
  }
} 