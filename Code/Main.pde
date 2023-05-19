public Player player;

void setup() {
  size(960, 960);
  Level level1 = new Level("../Levels/1.png");
  level1.drawLevel();
  player = new Player(level1);
  //TODO: YELLOW TILES AREN'T SHOWN IN THE LEVEL
}

void draw() {
  player.drawPlayer();
}
