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
    dy += 1; //Gravity
  }
}
