public Player player;
Level level;
public int num = 1;

//Circular hitbox?
//If you hold jump, you go up higher

void setup() {
  size(960, 960);
  PImage[] sprites = new PImage[]{
  loadImage("../Sprites/floating.png"), 
  loadImage("../Sprites/top_ground.png"),
  loadImage("../Sprites/top_left.png"),
  loadImage("../Sprites/top_right.png"),
  loadImage("../Sprites/middle_left.png"),
  loadImage("../Sprites/middle_right.png"),
  loadImage("../Sprites/pillar_top.png"),
  loadImage("../Sprites/pillar_middle.png"),
  loadImage("../Sprites/pillar_bottom.png"),
  loadImage("../Sprites/platform_left.png"),
  loadImage("../Sprites/platform_middle.png"),
  loadImage("../Sprites/platform_right.png"),
  loadImage("../Sprites/solid.png"),
  loadImage("../Sprites/lava.jpg"),
  loadImage("../Sprites/chest.png")};
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
