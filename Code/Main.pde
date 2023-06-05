public Player player;
Level level;
public int num = 1;

//Circular hitbox?
//If you hold jump, you go up higher

void setup() {
  size(960, 960);
  setLevel(num);
}

void draw() {
  level.drawLevel();
  player.drawPlayer();
}

public void setLevel(int levelNum) {
  try {
    num = levelNum;
    level = new Level("../Levels/"+levelNum+".png");
    level.drawLevel();
    player = new Player();
  } catch(Exception e) {
    setLevel(1); //Temp
  }
}
