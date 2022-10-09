package game.life;

public class Life implements Cloneable {

    private static final boolean DEFAULT_LIFE_STATUS = false;
    private boolean isAlive = DEFAULT_LIFE_STATUS;

    public void setAlive(boolean isAlive) {
        this.isAlive = isAlive;
    }

    public boolean isAlive() {
        return isAlive;
    }

    public void wakeUp() {
        this.isAlive = true;
    }

    public void kill() {
        this.isAlive = false;
    }

    @Override
    public Life clone() {
        Life clone = new Life();
        clone.setAlive(this.isAlive);
        return clone;
    }
}
