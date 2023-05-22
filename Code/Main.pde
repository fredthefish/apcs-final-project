public Player player;
Level level;

void setup() {
  size(960, 960);
  level = new Level("../Levels/1.png");
  level.drawLevel();
  player = new Player(level);
}

void draw() {
  level.drawLevel();
  player.drawPlayer();
}
