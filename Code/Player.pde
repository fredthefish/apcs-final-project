class Player {
  float x;
  float y;
  float dx;
  float dy;
  float extent;
  
  public Player(Level level) {
    int[] coords = level.findSpawn();
    //ADD REST OF CODE
  }
  
  public void drawPlayer() {
    circle(x, y, extent);
  }
}
