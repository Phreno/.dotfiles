package game.life;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.IntStream;

public class Game {

    private static final int LINE_RANGE_START = 0;
    private static final int LINE_RANGE_LENGTH = 25;

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
        IntStream
                .range(LINE_RANGE_START, LINE_RANGE_LENGTH)
                .forEach(i -> lives.add(new Life()));
        return lives;
    }
}
