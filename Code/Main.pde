public Player player;
Level level;
public int num = 1;
PImage[] sprites;

//Circular hitbox?
//If you hold jump, you go up higher

void setup() {
  size(960, 960);
  sprites = new PImage[]{
  loadImage("../Sprites/solid.png"),
  loadImage("../Sprites/lava.png"),
  loadImage("../Sprites/endpoint.png"),
  };
  setLevel(num);
}

void draw() {
  level.drawLevel();
  player.drawPlayer();
}

public void setLevel(int levelNum) {
  try {
    num = levelNum;
    level = new Level("../Levels/"+levelNum+".png", sprites, loadImage("../Sprites/bg.png"));
    level.drawLevel();
    player = new Player();
  } catch(Exception e) {
    setLevel(1); //Temp
  }
}
