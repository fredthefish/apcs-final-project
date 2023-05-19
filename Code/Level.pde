class Level {
  String imagePath;
  public int[][] level;
  private int scale; // for each pixel in image, this many pixels should be drawn on screen
  
  public Level(String imagePath) {
    this.imagePath = imagePath;
    parseImage(imagePath);
    scale = width / level.length;
  }
  
  private void parseImage(String path) {
    PImage img = loadImage(path);
    level = new int[img.height][img.width];
    for (int y = 0; y < img.height; ++y) {
      for (int x = 0; x < img.width; ++x) {
        color pixel = img.get(x, y);
        int tileType = Helpers.getTile(pixel);
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
  
  public void drawLevel() {
    noStroke();
    for (int y = 0; y < level.length; ++y){
      for (int x = 0; x < level[0].length; ++x) {
       fill(Helpers.getColor(level[y][x]));
       rect(x * scale, y * scale, scale, scale);
      }
    }
  }
  
  public int[] findSpawn() {
    for (int y = 0; y < level.length; y++) {
      for (int x = 0; x < level[0].length; x++) {
        if (level[y][x] = #FFFF00) {
          int[] coords = new int[] {x, y};
          return coords;
        }
      }
    }
    return null;
  }
}
