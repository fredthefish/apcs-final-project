final float AIR_RESISTANCE = 0.95;
final float FRICTION = 0.65;
final float GRAVITY = 1;
final float MOVEMENT = 4;
final int JUMP_POWER = 20;
final int JUMP_LENGTH = 8;
final int MAX_SLOPE = 8;

public boolean left;
public boolean right;
public boolean up;

class Player {
  public float x;
  public float y;
  float dx;
  float dy;
  public float extent;
  boolean canJump;
  int jumpExtension;
  
  public Player() {
    Die();
    extent = level.scale * 0.75;
  }
  
  public void drawPlayer() {
    playerEngine();
    fill(#0000FF);
    circle(x, y, extent);
  }
  
  void playerEngine() {
    dy += GRAVITY;
      if (left) dx += -MOVEMENT;
      if (right) dx += MOVEMENT;
      if (up && jumpExtension > 0) {
        canJump = false;
        dy = -JUMP_POWER;
        jumpExtension--;
      }
      else jumpExtension = 0;
    dx *= FRICTION;
    dy *= AIR_RESISTANCE;
    x += dx;
    y += dy;
    int i;
    canJump = false;
    //Move out of ground
    for (i = 0; i < MAX_SLOPE; i++) {
      if (getCollisions().contains(1)) {
        y -= 1;
        canJump = true;
      }
      else break;
    }
    y += 1;
    //Wall Detection
    if (i == MAX_SLOPE) {
      y += MAX_SLOPE;
      x -= dx;
      dx = 0;
      y -= 1;
    }
    if (getCollisions().contains(1)) {
      y -= dy;
      //Ceiling detection
      if (dy < 0) {
        canJump = false;
        for (i = 0; i < -dy; i++)
          if (!getCollisions().contains(1))
            y -= 1;
        y += 1;
      }
      dy = 0;
      //Jumping
      if (up && canJump) {
        dy = -JUMP_POWER;
        jumpExtension = JUMP_LENGTH;
      }
    }
    if (getCollisions().contains(2)) Die();
    if (y > height) Die();
    if (y < extent / 2) y = extent / 2;
    if (x < extent / 2) x = extent / 2;
    if (x > width - extent / 2) x = width - extent / 2;
    if (getCollisions().contains(3)) setLevel(num+1);
  }
  
  void Die() {
    int[] coords = level.findSpawn();
    x = level.scale * (coords[0] + 0.5);
    y = level.scale * (coords[1] + 0.5);
    dx = 0;
    dy = 0;
  }
  
  ArrayList<Integer> getCollisions() {
    ArrayList<Integer> touches = new ArrayList<Integer>();
    for (int[] tile : level.getCollisions()) 
      touches.add(level.level[tile[1]][tile[0]]);
    return touches;
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
