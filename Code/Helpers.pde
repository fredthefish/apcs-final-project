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
}
