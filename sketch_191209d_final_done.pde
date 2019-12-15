//!!setting for audrino//
import processing.serial.*;

String myString = null;
Serial myPort;

int NUM_OF_VALUES = 10;
int[] sensorValues; 

int lastButtonPressed = 10; 
int newButtonPressed = 10; 
//!!setting for arduino end//

//counting Scenario//
int Scenario = 1;
boolean rPressed = false;

//recording responses//
int answer1;
int answer2;
int answer3;

//!!setting for Scenario1//
PImage cbn[];
PImage cover;
PImage ins1;
PImage ins2;
int page = 1;
boolean cPressed = false;
long time = 0;
//!!setting for Scenario1 end//

//!!setting for Scenario2//
int vPress = 0;
int page2 = 1;
int page21 = 1;
boolean aPress = false;
PImage ins3;
PImage ins4;
boolean Mondayplay = false;
boolean Tuesdayplay = false;
boolean Wednesdayplay = false;
boolean ButtonPressed2 = false;
long time1 = 0;

import processing.video.*;
Movie Monday;
Movie Tuesday;
Movie Wednesday;
//!!setting for Scenario2 end//

//setting for Scenario3//
PImage img[];
int nPics = 5;

PImage laterImg[];

PImage back;

boolean sPressed = false;
long time3 = 0;

boolean playing = false;

import processing.sound.*;
boolean isPlaying = false;
boolean isPlaying1 = false;
boolean isPlaying2 = false;
boolean isPlaying3 = false;
boolean isPlaying4 = false;

SoundFile sound;
SoundFile sound1;
SoundFile sound2;
SoundFile sound3;
SoundFile sound4;


SoundFile[] responses = new SoundFile[10]; 
String[] responsesFileNames = {"TASCAM_0187.wav", "TASCAM_0188.wav", "TASCAM_0189.wav", "TASCAM_0191.wav", "TASCAM_0193.wav", "TASCAM_0195.wav", "TASCAM_0198.wav", "TASCAM_0209.wav", "TASCAM_0206.wav", "TASCAM_0208.wav" };

float x[] = new float [nPics];
float y[] = new float [nPics];
float spdX[] = new float [nPics];

int mouse = 0;
int x1 = width/2 + 20;
int x2 = width/2 + 20;
int x3 = width/2 + 20;
int x4 = width/2 + 20;
int x5 = width/2 + 20;
//setting for Scenario3 end//

//setting for Scenario4//
PImage same;
PImage different;
long time4 = 0;
//setting for Scenario4 end//

void setup() {
  background(255);
  size(1400, 1000);

  setupSerial();

  setupScenario1();
  setupScenario2();
  setupScenario3();
  setupScenario4();
}

void draw() {
  checkButton();
  updateSerial();
  //printArray(sensorValues);

  if (Scenario == 1) {
    rPressed = false;
    if (page == 1) {
      image(cover, 0, 0, 1400, 980);
      float d = dist(765, 390, mouseX, mouseY);
      if (mousePressed) {
        /*
      print(d);
         print(",");
         print(mouseX);
         print(",");
         print(mouseY);
         println();
         */
        if (d<=60) {
          page = 2;
        }
      }
    } else if (page == 2) {
      image(ins1, 0, 0, 1400, 890);
      if (cPressed == true) {
        background(255);
        page = 3;
      }
    } else if (page == 3) {
      if (newButtonPressed != lastButtonPressed) {
        time = millis();
        background(255);
        imageMode(CENTER);
        buttonLogic1(newButtonPressed);
        answer1 = newButtonPressed;

        lastButtonPressed = newButtonPressed;
      }
      if (newButtonPressed != 10 && millis() - time >= 3000) {
        page = 4;
      }
    } else if (page == 4) {
      imageMode(CORNER);
      image(ins2, 0, 0, 1400, 890);
      newButtonPressed = 10;
      lastButtonPressed = 10;
      if (vPress == 1) {
        Scenario = 2;
      }
    }
    // once Scenario 1 is done
    //if ("done") {
    //  Scenario = 2;
    //}
  } else if (Scenario == 2) {
    if (page2==1) {
      movieplay();
      if (vPress == 4) {
        Wednesday.stop();
        background(255);
        imageMode(CORNER);
        image(ins3, 0, 0, 1400, 890);
        if (aPress == true) {
          background(255);
          page21 = 2;
        } 
        if (page21 == 2) {
          if (newButtonPressed != lastButtonPressed) {
            ButtonPressed2 = true;
            time1 = millis();
            //buttonLogic2(newButtonPressed);
            lastButtonPressed = newButtonPressed;
            answer2 = newButtonPressed;
          }
          if (ButtonPressed2 == true) {
            //buttonLogic2(newButtonPressed);
            if (newButtonPressed <= 9) {
              imageMode(CENTER);

              image(cbn[newButtonPressed], width/2, height/2 - 70, 340, 340);
            }
          }
          if (time1!=0 && millis() - time1 >= 2000) {
            page2 = 2;
          }
        }
      }
    } else if (page2 == 2) {
      imageMode(CORNER);
      image(ins4, 0, 0, 1400, 900);
      newButtonPressed = 10;
      lastButtonPressed =10;
      page2 = 3;
    } else if (page2 == 3) {
      if (mouse == 1) {
        Scenario = 3;
      }
    }
  } else if (Scenario == 3) {
    if (sPressed == false) {
      background(255);
    }

    if (sPressed == false && mouse >= 7 ) {
      background(255);
      imageMode(CENTER);
      image(back, width/2, height/2, 4535/5.5, 1701/5.5 );
    }

    if (sPressed ==true && newButtonPressed == 10) {
      background(255);
    }

    movingimg();
    news();

    if (mouse >= 6) {
      sound.pause();
      sound1.pause();
      sound2.pause();
      sound3.pause();
      sound4.pause();

      if (sPressed == true && (newButtonPressed != lastButtonPressed)) {

        print ("user pressed a new button! and the button is" + str(newButtonPressed));

        imageMode(CENTER);

        buttonLogic(newButtonPressed, newButtonPressed);
        time3 = millis();
        answer3 = newButtonPressed;
        lastButtonPressed = newButtonPressed;
      }
      if (time3!=0 && millis() - time3 >= 12000) {
        Scenario = 4;
        time4 = millis();
      }
    }
    delay(20);
  } else if (Scenario ==4) {
    if (answer1 == answer2 && answer2 == answer3) {
      imageMode(CORNER);
      image(same, 0, 0, 1400, 800);
      if (mousePressed) {
        if (dist(1290, 700, mouseX, mouseY)<= 90) {
          reset();
        }
      }
    } else {
      imageMode(CORNER);
      image(different, 0, 0, 1400, 800);
      if (mousePressed) {
        if (dist(1290, 700, mouseX, mouseY)<= 90) {
          reset();
        }
      }
    } 
    //if (rPressed == true) {
    //  reset();
    //}
  }
}

void movieEvent(Movie m) {
  m.read();
}
void setupSerial() {
  /*printArray(Serial.list());*/
  myPort = new Serial(this, Serial.list()[5], 9600);

  myPort.clear();
  // Throw out the first reading,
  // in case we started reading in the middle of a string from the sender.
  myString = myPort.readStringUntil( 10 );  // 10 = '\n'  Linefeed in ASCII
  myString = null;

  sensorValues = new int[NUM_OF_VALUES];
}

void updateSerial() {
  while (myPort.available() > 0) {
    myString = myPort.readStringUntil( 10 ); // 10 = '\n'  Linefeed in ASCII
    if (myString != null) {
      String[] serialInArray = split(trim(myString), ",");
      if (serialInArray.length == NUM_OF_VALUES) {
        for (int i=0; i<serialInArray.length; i++) {
          sensorValues[i] = int(serialInArray[i]);
        }
      }
    }
  }
}

void setupScenario1() {

  cbn = new PImage[10];

  cbn[0] = loadImage("cbn1.jpg");
  cbn[1] = loadImage("cbn2.jpg");
  cbn[2] = loadImage("cbn3.jpg");
  cbn[3] = loadImage("cbn4.jpg");
  cbn[4] = loadImage("cbd5.jpg");
  cbn[5] = loadImage("cbn6.jpg");
  cbn[6] = loadImage("cbn7.jpg");
  cbn[7] = loadImage("cbn8.jpg");
  cbn[8] = loadImage("cbn9.jpg");
  cbn[9] = loadImage("cbn10.jpg");
  // cbn[10]

  cover = loadImage("cover.png");
  ins1 = loadImage("ins1.png");
  ins2 = loadImage("ins2 2.png");
}

void setupScenario2() {
  ins3 = loadImage("ins3.png");
  ins4 = loadImage("ins4 2.png");
  Monday = new Movie(this, "Monday 2.mp4");
  Tuesday = new Movie(this, "Tuesday 2.mp4");
  //Tuesday.play();
  Wednesday = new Movie(this, "Wednesday 2.mp4");
  //Wednesday.play();
}

void setupScenario3() {
  img = new PImage[nPics];
  laterImg = new PImage[10]; 


  img[0]=loadImage("juice.jpg");
  img[1]=loadImage("malatang.jpg");
  img[2]=loadImage("smoothie.jpg");
  img[3]=loadImage("sushi.jpg");
  img[4]=loadImage("redwine.jpg");

  laterImg[0] = loadImage("note1.jpeg");
  laterImg[1] = loadImage("girl1.jpeg");
  laterImg[2] = loadImage("note3.jpeg");
  laterImg[3] = loadImage("note4.jpeg");
  laterImg[4] = loadImage("girl2.jpg");
  laterImg[5] = loadImage("note6.jpeg");
  laterImg[6] = loadImage("note7.jpeg");
  laterImg[7] = loadImage("girl1.jpeg");
  laterImg[8] = loadImage("girl2.jpg");
  laterImg[9] = loadImage("girl2.jpg");

  back = loadImage("instyruction.png");

  sound = new SoundFile (this, "TASCAM_0213.wav");
  sound1 = new SoundFile (this, "TASCAM_0224.wav");
  sound2 = new SoundFile (this, "TASCAM_0216.wav");
  sound3 = new SoundFile (this, "TASCAM_0220.wav");
  sound4 = new SoundFile (this, "TASCAM_0218.wav");


  for (int i=0; i<responses.length; i++) {
    responses[i] = new SoundFile(this, responsesFileNames[i]);
  }

  for (int i = 0; i < img.length; i++) { 

    imageMode(CORNER);
    x[i] = random(200);
    y[i] = random(691); 
    float r = random (-1, 1);
    if (r < 0) {
      r = random(-15, -5);
    }
    if (r >= 0) {
      r = random(5, 15);
    }
    spdX[i] = r; 

    //image(img[i], x[i], y[i], 4535/5.5, 1701/5.5);
  }
}

void setupScenario4() {
  same = loadImage("same 3.png");
  different = loadImage("different 3.png");
}

void checkButton() {
  if (sensorValues[0] == 1) {
    newButtonPressed = 0;
    print("0 pressed");
  }
  if (sensorValues[1] == 1) {
    newButtonPressed = 1;
    print("1 pressed");
  }
  if (sensorValues[2] == 1) {
    newButtonPressed = 2;
    print("2 pressed");
  }
  if (sensorValues[3] == 1) {
    newButtonPressed = 3;
    print("3 pressed");
  }
  if (sensorValues[4] == 1) {
    newButtonPressed = 4;
    print("4 pressed");
  }
  if (sensorValues[5] == 1) {
    newButtonPressed = 5;
    print("5 pressed");
  }
  if (sensorValues[6] == 1) {
    newButtonPressed = 6;
    print("6 pressed");
  }
  if (sensorValues[7] == 1) {
    newButtonPressed = 7;
    print("7 pressed");
  }
  if (sensorValues[8] == 1) {
    newButtonPressed = 8;
    print("8 pressed");
  }
  if (sensorValues[9] == 1) {
    newButtonPressed = 9;
    print("9 pressed");
  }
}

void movieplay() {
  if (vPress == 1) {
    Monday.play();
    image(Monday, 0, 0, 1400, 800);
  }
  if (vPress == 2) {
    Tuesday.play();
    Monday.stop();
    image(Tuesday, 0, 0, 1400, 800);
  }
  if (vPress == 3) {
    Wednesday.play();
    Tuesday.stop();
    image(Wednesday, 0, 0, 1400, 800);
  }
}

void movingimg() {
  for (int i = 0; i < img.length; i++) { 
    imageMode(CORNER);
    image(img[i], x[i], y[i], 4535/5.5, 1701/5.5);
    x[i] += spdX[i];
  }
}

void news() {
  if (mouse == 2) {
    if (isPlaying == false) {
      sound.play();
      isPlaying = true;
    }
    background(0);
    imageMode(CORNER);
    image(img[0], x1, height/3, 4535/5.5, 1701/5.5);
    x1 = x1 + 1;
  }
  if (mouse == 3) {
    if (isPlaying1 == false) {
      sound.stop();
      sound1.play();
      isPlaying1 = true;
    }
    background(0);
    imageMode(CORNER);
    image(img[1], x2, height/3, 4535/5.5, 1701/5.5);
    x2 = x2 + 1;
  }
  if (mouse == 4) {
    if (isPlaying2 == false) {
      sound.stop();
      sound1.stop();
      sound2.play();
      isPlaying2 = true;
    }
    background(0);
    imageMode(CORNER);
    image(img[2], x3, height/3, 4535/5.5, 1701/5.5);
    x3 = x3 + 1;
  }
  if (mouse == 5) {
    if (isPlaying3 == false) {
      sound.stop();
      sound1.stop();
      sound2.stop();
      sound3.play();
      isPlaying3 = true;
    }
    background(0);
    imageMode(CORNER);
    image(img[3], x4, height/3, 4535/5.5, 1701/5.5); 
    x4 = x4 + 1;
  }
  if (mouse == 6) {
    if (isPlaying4 == false) {
      sound.stop();
      sound1.stop();
      sound2.stop();
      sound3.stop();
      sound4.play();
      isPlaying4 = true;
    }
    background(0);
    imageMode(CORNER);
    image(img[4], x5, height/3, 4535/5.5, 1701/5.5);
    x5 = x5 + 1;
  }
}



void buttonLogic1(int cbn_num) {
  background(255);
  println(cbn_num);
  if (cbn_num <= 9) {
    //image()
    image(cbn[cbn_num], width/2, height/2 - 70, 340, 340);
  }
}

void buttonLogic2(int cbn_num) {
  //background(255);
  //println(cbn_num);
  //if (cbn_num <= 9) {
  //  image(cbn[cbn_num], width/2, height/2 - 70, 340, 340);
  //}
}


void buttonLogic(int resp_num, int img_num) {

  background(255);
  for (int i=0; i<responses.length; i++) {
    responses[i].stop();
  }
  if (resp_num <= 9) {
    responses[resp_num].play();
  }

  image(laterImg[img_num], width/2, height/2 - 70, 1728/3, 2010/3);
}

void reset() {
  lastButtonPressed = newButtonPressed = 10;
  Scenario =1;
  page = 1;
  cPressed = false;
  time = 0;
  vPress = 0;
  page2 = 1;
  page21 = 1;
  aPress = false;
  Mondayplay = false;
  Tuesdayplay = false;
  Wednesdayplay = false;
  ButtonPressed2 = false;
  time1 = 0;
  sPressed = false;
  time3 = 0;
  playing = false;
  isPlaying = false;
  isPlaying1 = false;
  isPlaying2 = false;
  isPlaying3 = false;
  isPlaying4 = false;
  mouse = 0;
}


void keyPressed() {
  if (key == ENTER ) {
    mouse = mouse + 1;
  }
  if (key == 's' ) {
    sPressed = true;
  }
  if (key == 'a' ) {
    aPress = true;
  }
  if (key == 'v' ) {
    vPress = vPress +1;
  }
  if (key == 'c' ) {
    cPressed = true;
  }
  if (key == 'r' ) {
    rPressed = true;
  }
}
