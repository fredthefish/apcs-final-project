public Player player;
Level level;

void setup() {
  size(960, 960);
  PImage[] sprites = new PImage[]{
  loadImage("../Sprites/floating.png"), 
  loadImage("../Sprites/top_ground.png"),
  loadImage("../Sprites/top_left.png"),
 loadImage("../Sprites/top_right.png"),};
  level = new Level("../Levels/1.png", sprites,  loadImage("../Sprites/bg.png"));
  level.drawLevel();
  player = new Player(level);
}

void draw() {
  level.drawLevel();
  player.drawPlayer();
}
