class Level {
  String imagePath;
  public int[][] level;
  /*
  0 for nothing
  1 for solid
  2 for lava
  3 for goal
  */
  public Level(String imagePath) {
    this.imagePath = imagePath;
    parseImage(imagePath);
  }
  
  private void parseImage(String path) {
    PImage img = loadImage(path);
    level = new int[img.height][img.width];
    for (int y = 0; y < img.height; ++y) {
      for (int x = 0; x < img.width; ++x) {
        color pixel = img.get(x, y);
        int tileType = 0;
        switch(pixel) {
          case #FFFFFF:
            tileType = 0; break;
          case #000000:
            tileType = 1; break;
          case #FF0000:
            tileType = 2; break;
          case #00FF00: // green;
            tileType = 3; break;
        }
        level[y][x] = tileType;
      }
    } 
  }
  public String toString() {
    String x = "";
    for (int[] row : level) {
      for (int tile : row) {
        x += tile + " ";
      }
      x += "\n";
    }
    return x;
  }
}
