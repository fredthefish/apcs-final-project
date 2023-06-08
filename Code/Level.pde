class Level {
  String imagePath;
  PImage bg;
  PImage[] SPRITES;
  PImage nullsprite = loadImage("../Sprites/nullsprite.png");
  public int[][] level;
  public int scale; // for each pixel in image, this many pixels should be drawn on screen
  public ArrayList<int[]> playerCollisions;
  
  public Level(String imagePath, PImage[] sprites, PImage bg) {
    this.SPRITES = sprites;
    this.bg = bg;
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
    image(bg, 0, 0);
    for (int y = 0; y < level.length; ++y){
      for (int x = 0; x < level[0].length; ++x) {
        //Hide yellow tiles (spawn area).
        //if (type == #FFFF00) fill(#FFFFFF);
        if (level[y][x] != 0 && level[y][x] != 4 /*&& returnSprite(x, y) != -1*/) { 
          PImage sprite = SPRITES[level[y][x] - 1];
          sprite.resize(60,60);
          image(sprite, x * scale, y * scale);
        }
        if (player != null)
          if (Helpers.collision(player, x*scale, y*scale, scale))
            playerCollisions.add(new int[] {x, y});
      }
    }
  }
  //returns sprites based on tiles around it
  //private PImage returnSprite(int x, int y) {
  //  if (level[y][x] == 1)
  //    return SPRITES[0];
  //  if (level[y][x] == 2)
  //    return SPRITES[1];
  //  if (level[y][x] == 3)
  //    return SPRITES[2];   
  //}
  
  private int isNotGround(int x, int y) {
    if (level[y][x] != 1)
      return 0;
    else return 1;
  } // returns air if the thing is anything but a ground
  
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
