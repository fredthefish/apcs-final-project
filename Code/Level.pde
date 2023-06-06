class Level {
  String imagePath;
  PImage bg;
  PImage[] SPRITES;
  PImage nullsprite = loadImage("../Sprites/nullsprite.png");
  public int[][] level;
  public int scale; // for each pixel in image, this many pixels should be drawn on screen
  
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
    noStroke();
    image(bg, 0, 0);
    for (int y = 0; y < level.length; ++y){
      for (int x = 0; x < level[0].length; ++x) {
        
        //Hide yellow tiles (spawn area).
        //if (type == #FFFF00) fill(#FFFFFF);
        if (level[y][x] != 0 && level[y][x] != 4 /*&& returnSprite(x, y) != -1*/) { 
                PImage sprite = returnSprite(x, y);
                image(sprite, x * scale, y * scale);
          }
      }
    }
  }
  //returns sprites based on tiles around it
  private PImage returnSprite(int x, int y) {
    
    if (level[y][x] == 2)
      return SPRITES[13];
    if (level[y][x] == 3)
      return SPRITES[14];
    
    int yMinus1 = y - 1 < 0 ? 1 : isNotGround(x, y - 1);
    int yPlus1 = y + 1 >= level.length ? 1 : isNotGround(x, y + 1);
    int xMinus1 = x - 1 < 0 ? 1 : isNotGround(x - 1, y);
    int xPlus1 = x + 1 >= level[0].length ? 1 :isNotGround(x + 1, y);;

    

    if (yMinus1 == 0 && yPlus1 == 0 && xMinus1 == 0 && xPlus1 == 0) {     // check if floating
      return SPRITES[0];
    }
    if (yMinus1 == 0 && yPlus1 == 1 && xPlus1 == 1 && xMinus1 == 1) { // check if top ground
      return SPRITES[1];
    } 
    if (yMinus1 == 0 && yPlus1 == 1 && xMinus1 == 0 && xPlus1 == 1) { // check if top left
      return SPRITES[2];
    }
    if (yMinus1 == 0 && yPlus1 == 1 && xMinus1 == 1 && xPlus1 == 0) { // check if top right
      return SPRITES[3];
    }
    if (yMinus1 == 1 && yPlus1 == 1 && xMinus1 == 0 && xPlus1 == 1) { // check if middle left
      return SPRITES[4];
    } 
    if (yMinus1 == 1 && yPlus1 == 1 && xMinus1 == 1 && xPlus1 == 0) { // check if middle right
      return SPRITES[5];
    }
    if (yMinus1 == 0 && yPlus1 == 1 && xMinus1 == 0 && xPlus1 == 0) { // check if top pillar
      return SPRITES[6];
    }
    if (yMinus1 == 1 && yPlus1 == 1 && xMinus1 == 0 && xPlus1 == 0) { // check if middle pillar
      return SPRITES[7];
    }
    if (yMinus1 == 1 && yPlus1 == 0 && xMinus1 == 0 && xPlus1 == 0) { // bottom pillar
      return SPRITES[8];
    }
    if (yMinus1 == 0 && yPlus1 == 0 && xMinus1 == 0 && xPlus1 == 1) { // check if left platform
      return SPRITES[9];
    }
    if (yMinus1 == 0 && yPlus1 == 0 && xMinus1 == 1 && xPlus1 == 1) { // check if middle platform
      return SPRITES[10];
    }
    if (yMinus1 == 0 && yPlus1 == 0 && xMinus1 == 1 && xPlus1 == 0) { // check if right platform
      return SPRITES[11];
    }
    return SPRITES[12];
  }
  
  private int isNotGround(int x, int y) {
    if (level[y][x] != 1)
      return 0;
    else return 1;
  } // returns air if the thing is anything but a ground
  
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
