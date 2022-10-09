package game.life;

public class Game {

    private Game() {
    }

    private static class GameHolder {
        private final static Game instance = new Game();
    }

    public static Game getInstance() {
        return GameHolder.instance;
    }

    public static void getCells() {

    }
}
