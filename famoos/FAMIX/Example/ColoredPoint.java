import java.awt.Color;

public class ColoredPoint extends Point {

  private Color _color;

  public ColoredPoint(int x, int y, Color color) {
	super(x,y);
	_color = color;
  }

  public Color getColor() {
	return _color;
  }

}
