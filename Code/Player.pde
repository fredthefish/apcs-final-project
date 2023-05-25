final float AIR_RESISTANCE = 0.95;
final float FRICTION = 0.5;
final float GRAVITY = 1;
final float MOVEMENT = 4;
final float JUMP = 20;
final float MAX_SLOPE = 18;

public boolean left;
public boolean right;
public boolean up;

class Player {
  public float x;
  public float y;
  float dx;
  float dy;
  public float extent;
  boolean touchingGround;
  
  public Player() {
    Die();
    extent = level.scale * 0.75;
  }
  
  public void drawPlayer() {
    fill(#0000FF);
    circle(x, y, extent);
    ArrayList<Integer> touches = new ArrayList<Integer>();
    for (int[] tile : level.playerCollisions) 
      touches.add(level.level[tile[1]][tile[0]]);
    if (touches.contains(2)) Die();
    touchingGround = touches.contains(1);
    if (touches.contains(1)) exitGround();
    
    if (keyPressed) {
      if (left) dx += -MOVEMENT;
      if (right) dx += MOVEMENT;
      if (up && touchingGround) dy = -JUMP;
    }
    x += dx;
    y += dy;
    dy += GRAVITY;
    dx *= FRICTION;
    dy *= AIR_RESISTANCE;
    if (y > height) Die();
    if (x < extent / 2) x = extent / 2;
    if (x > width - extent / 2) x = width - extent / 2;
  }
  
  void Die() {
    int[] coords = level.findSpawn();
    x = level.scale * (coords[0] + 0.5);
    y = level.scale * (coords[1] + 0.5);
    dx = 0;
    dy = 0;
  }
  
  void exitGround() {
    boolean floor = dy >= 0;
    if (!floor) y -= dy;
    dy = 0;
    boolean collision = true;
    int slope = 0;
    while (collision && (slope < MAX_SLOPE)) {
      if (floor) y -= 1;
      else y += 1;
      slope++;
      ArrayList<Integer> touches = new ArrayList<Integer>();
      for (int[] tile : level.getCollisions()) 
        touches.add(level.level[tile[1]][tile[0]]);
      collision = touches.contains(1);
    }
    if (slope == MAX_SLOPE) {
      if (floor) y += MAX_SLOPE;
      else y -= MAX_SLOPE;
      x -= dx * 2;
      //y -= dy;
    }
    else y += 1;
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
