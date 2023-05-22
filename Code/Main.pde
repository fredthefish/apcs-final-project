public Player player;

void setup() {
  size(960, 960);
  Level level1 = new Level("../Levels/1.png");
  level1.drawLevel();
  player = new Player(level1);
}

void draw() {
  player.drawPlayer();
}
