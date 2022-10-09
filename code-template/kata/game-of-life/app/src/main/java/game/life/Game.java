package game.life;

public class Game {

    private Game() {
    }

    public Game getInstance() {
        return new Game();
    }
}
