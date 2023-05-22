final float AIR_RESISTANCE = 0.9;
final float GRAVITY = 1;
final float ACCELERATION = 1;
final float JUMP = 8;

public boolean left;
public boolean right;
public boolean up;

class Player {
  float x;
  float y;
  float dx;
  float dy;
  float extent;
  
  public Player(Level level) {
    int[] coords = level.findSpawn();
    x = level.scale * (coords[0] + 0.5);
    y = level.scale * (coords[1] + 0.5);
    extent = level.scale * 0.75;
  }
  
  public void drawPlayer() {
    fill(#0000FF);
    circle(x, y, extent);
    y += dy;
    x += dx;
    dy += GRAVITY;
    dx *= AIR_RESISTANCE;
    dy *= AIR_RESISTANCE;
    
    if (keyPressed) {
      if (left) dx += -ACCELERATION;
      if (right) dx += ACCELERATION;
      if (up) dy = -JUMP;
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT) left = true;
  else if (keyCode == RIGHT) right = true;
  else if (keyCode == UP) up = true;
}

void keyReleased() {
  if (keyCode == LEFT) left = false;
  else if (keyCode == RIGHT) right = false;
  else if (keyCode == UP) up = false;
}
