package game.life;

public class MathToolBox {

    private MathToolBox() {
    }

    public static boolean isSquareNumber(double number) {
        double sqrt = Math.sqrt(number);
        return Math.floor(sqrt) == sqrt;
    }

}
