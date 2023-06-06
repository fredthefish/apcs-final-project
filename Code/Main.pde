public Player player;
Level level;

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
  level = new Level("../Levels/1.png", sprites,  loadImage("../Sprites/bg.png"));
  level.drawLevel();
  player = new Player(level);
}

void draw() {
  level.drawLevel();
  player.drawPlayer();
}
