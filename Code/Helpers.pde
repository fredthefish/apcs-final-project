static class Helpers {
  /*
  air for nothing
  black for solid
  red for lava
  green for goal
  yellow for spawnpoint
  */
  static color[] colors = new color[] {#FFFFFF, #000000, #FF0000, #00FF00, #FFFF00};
  
  public static color getColor(int tile) {
    return colors[tile];
  }
  public static int getTile(color pixel) {
    for (int i = 0; i < colors.length; i++)
      if (colors[i] == pixel)
        return i;
    return -1;
  }
  public static boolean isColliding(int x1, int y1, int width1, int x2, int y2, int width2) {
    // check if 1 is colliding with 2
    //if ((x1 >= x2 && x1 <= x2 + width2) && (y1 >= y2 && y1 <= y2 + width2))
    //  return true;
    if (y1 + width1 == y2 || y1 == y2 + width2 || x1 + width1 == x2 || x1 == y2 + width2)
      return true;
    return false;
  }
  
  // floating
  
}
