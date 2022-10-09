package game.life;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.function.IntConsumer;
import java.util.stream.IntStream;

public class Game {
    private static final int ROW_SIZE = 5;
    private static final int LINE_RANGE_START = 0;
    private static final int LINE_RANGE_LENGTH = (int) Math.pow(ROW_SIZE, 2);

    private Game() {
    }

    private static class GameHolder {
        private static final Game instance = new Game();
        private static List<Life> lives = new ArrayList<>();
    }

    public static Game getInstance() {
        return GameHolder.instance;
    }

    public static List<Life> getCells() {
        if (GameHolder.lives.isEmpty()) {
            Game.initCells();
        }
        return GameHolder.lives;
    }

    public static void initCells() {
        try {
            initCells(" ".repeat(LINE_RANGE_LENGTH));
        } catch (GameException e) {
            e.printStackTrace();
        }

    }

    public static void initCells(String rawData) throws GameException {
        checkRawDataOrThrow(rawData);
        clear();
        doMappingAndUpdate(rawData);
    }

    private static void doMappingAndUpdate(String rawData) {
        IntConsumer updateLives = i -> GameHolder.lives.add(new Life());
        IntStream
                .range(LINE_RANGE_START, rawData.length())
                .forEach(updateLives);
    }

    private static void clear() {
        GameHolder.lives = new ArrayList<>();
    }

    private static void checkRawDataOrThrow(String rawData) throws GameException {
        if (Objects.isNull(rawData))
            throw new GameException("Le tableau ne peut pas etre initialisé");
        if (!MathToolBox.isSquareNumber(rawData.length()))
            throw new GameException("La taille des données n'est pas valid");
    }

}
