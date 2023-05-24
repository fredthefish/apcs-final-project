
class Level {
  String imagePath;
  PImage[] SPRITES = new PImage[]{
  loadImage("../Sprites/top_ground.png"), loadImage("../Sprites/bg.png")};
  public int[][] level;
  public int scale; // for each pixel in image, this many pixels should be drawn on screen
  
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
    image(SPRITES[1], 0, 0)
    for (int y = 0; y < level.length; ++y){
      for (int x = 0; x < level[0].length; ++x) {
        
        //Hide yellow tiles (spawn area).
        //if (type == #FFFF00) fill(#FFFFFF);
        if (level[y][x] != 0) { 
                PImage sprite = returnSprite(level[y][x]);
        image(sprite, x * scale, y * scale);
          }

      }
    }
  }
  
  private PImage returnSprite(int tile) {
    switch(tile) {
      case 1:
        return SPRITES[0];
    }
    return SPRITES[0];
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
