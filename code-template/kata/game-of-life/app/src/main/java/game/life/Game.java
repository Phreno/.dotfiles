package game.life;

import java.util.ArrayList;
import java.util.List;

public class Game {
    private static final int ROW_SIZE = 5;
    static final int LINE_RANGE_START = 0;
    static final int LINE_RANGE_LENGTH = (int) Math.pow(ROW_SIZE, 2);

    private Game() {
    }

    static class GameHolder {
        private GameHolder() {
        }

        private static final Game instance = new Game();
        static List<Life> lives = new ArrayList<>();
    }

    public static Game getInstance() {
        return GameHolder.instance;
    }

    public static List<Life> getCells() {
        if (GameHolder.lives.isEmpty()) {
            GameBusiness.initCells();
        }
        return GameHolder.lives;
    }
}
