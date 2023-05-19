void setup() {
  size(960, 960);
  Level level1 = new Level("../Levels/1.png");
  level1.drawLevel();
  Player player = new Player(
}

void draw() {
  player.drawPlayer();
}
