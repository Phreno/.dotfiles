package game.life;

public class Life {
    private static final char DEAD = '.';
    private static final char ALIVE = '*';

    private Character state = DEAD;

    public Life() {
    }

    public Life(Character printable) {
        if (printable.equals(ALIVE))
            wakeUp();
    }

    public void setAlive(boolean isAlive) {
        this.state = isAlive ? ALIVE : DEAD;
    }

    public boolean isAlive() {
        return state.equals(ALIVE);
    }

    public void wakeUp() {
        this.state = ALIVE;
    }

    public void kill() {
        this.state = DEAD;
    }

    public String toString() {
        return state.toString();
    }
}
