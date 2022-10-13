package game.life;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.function.IntConsumer;
import java.util.stream.IntStream;

public class GameBusiness {

    private GameBusiness() {
    }

    static void checkRawDataOrThrow(String rawData) throws GameException {
        if (Objects.isNull(rawData))
            throw new GameException("Le tableau ne peut pas etre initialisé");
        if (!MathToolBox.isSquareNumber(rawData.length()))
            throw new GameException("La taille des données n'est pas valid");
    }

    static void doMappingAndUpdate(String rawData) {
        IntConsumer updateLives = i -> Game.GameHolder.lives.add(new Life(rawData.charAt(i)));
        IntStream
                .range(Game.LINE_RANGE_START, rawData.length())
                .forEach(updateLives);
    }

    static void clear() {
        Game.GameHolder.lives = new ArrayList<>();
    }

    static String bluePrint() {
        return "";
    }

    static List<Life> getCells() {
        if (Game.GameHolder.lives.isEmpty()) {
            GameBusiness.initCells();
        }
        return Game.GameHolder.lives;
    }

    static void initCells(String rawData) throws GameException {
        checkRawDataOrThrow(rawData);
        clear();
        doMappingAndUpdate(rawData);
    }

    static void initCells() {
        try {
            initCells((Life.DEAD + "").repeat(Game.LINE_RANGE_LENGTH));
        } catch (GameException e) {
            e.printStackTrace();
        }
    }

}
