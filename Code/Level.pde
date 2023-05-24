class Level {
  String imagePath;
  public int[][] level;
  public int scale; // for each pixel in image, this many pixels should be drawn on screen
  public ArrayList<int[]> playerCollisions;
  
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
    playerCollisions = new ArrayList<int[]>();
    noStroke();
    for (int y = 0; y < level.length; ++y){
      for (int x = 0; x < level[0].length; ++x) {
        color type = Helpers.getColor(level[y][x]);
        fill(type);
        //Hide yellow tiles (spawn area).
        if (type == #FFFF00) fill(#FFFFFF);
        rect(x * scale, y * scale, scale, scale);
        if (player != null)
        if (Helpers.collision(player, x*scale, y*scale, scale))
          playerCollisions.add(new int[] {x, y});
      }
    }
  }
  
  public ArrayList<int[]> getCollisions() {
    playerCollisions = new ArrayList<int[]>();
    for (int y = 0; y < level.length; ++y){
      for (int x = 0; x < level[0].length; ++x) {
        if (player != null)
        if (Helpers.collision(player, x*scale, y*scale, scale))
          playerCollisions.add(new int[] {x, y});
      }
    }
    return playerCollisions;
  }
  
  public int[] findSpawn() {
    for (int y = 0; y < level.length; y++) {
      for (int x = 0; x < level[0].length; x++) {
        if (Helpers.getColor(level[y][x]) == #FFFF00) {
          int[] coords = new int[] {x, y};
          return coords;
        }
      }
    }
    return null;
  }
}
