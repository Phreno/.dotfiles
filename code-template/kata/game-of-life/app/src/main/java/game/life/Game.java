package game.life;

import java.util.ArrayList;
import java.util.List;

public class Game {

    private Game() {
    }

    private static class GameHolder {
        private static final Game instance = new Game();
        private static final List<Life> lives = Game.initCells();
    }

    public static Game getInstance() {
        return GameHolder.instance;
    }

    public static List<Life> getCells() {
        return GameHolder.lives;
    }

    public static List<Life> initCells() {
        List<Life> lives = new ArrayList<>();
        for (int i = 0; i < 25; i++) {
            lives.add(new Life());
        }
        return lives;
    }
}
