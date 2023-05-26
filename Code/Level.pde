int[][][] SPRITE_TEMPLATES = new int[][][]{
  {
    {0, 0, 0},
    {1, 1, 1},
    {0, 0, 0}
  },
  {
    {0, 0, 0},
    {1, 1, 1},
    {0, 0, 0}
  },
};
class Level {
  String imagePath;
  PImage background = loadImage("../Sprites/bg.png");
  PImage[] SPRITES = new PImage[]{
  loadImage("../Sprites/top_ground.png"), };
  public int[][] level;
  public int scale; // for each pixel in image, this many pixels should be drawn on screen
  
  public Level(String imagePath, PImage[] sprites) {
    this.SPRITES = sprites;
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
    image(background, 0, 0);
    for (int y = 0; y < level.length; ++y){
      for (int x = 0; x < level[0].length; ++x) {
        
        //Hide yellow tiles (spawn area).
        //if (type == #FFFF00) fill(#FFFFFF);
        if (level[y][x] != 0 && level[y][x] != 4 && level[y][x] != 3 && level[y][x] != 2 && returnSprite(x, y) != -1) { 
                PImage sprite = SPRITES[returnSprite(x, y)];
                image(sprite, x * scale, y * scale);
          }

      }
    }
  }
  //returns index of sprite in sprite array
  private int returnSprite(int x, int y) {
    int yMinus1 = y - 1 < 0 ? 1 : y - 1;
    int yPlus1 = y + 1 <= height ? 1 : y + 1;
    int xMinus1 = x - 1 < 0 ? 1 : x - 1;
    int xPlus1 = x + 1 <= width ? 1 : x + 1;

    int[][] surroundingGrid = new int[][]{
    {level[yMinus1][xMinus1], level[yMinus1][x], level [yMinus1][xPlus1]},
    {level[y][xMinus1], level[y][x], level [y][xPlus1]},
    {level[yPlus1][xMinus1], level[yPlus1][x], level [yPlus1][xPlus1]},
    };
    for (int[] row : surroundingGrid) {
      for (int i : row) { System.out.print(i + " ");}
      System.out.println(" ");
    }
    System.out.println();
    int i = java.util.Arrays.asList(SPRITE_TEMPLATES).indexOf(surroundingGrid);
  
    return i;
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
