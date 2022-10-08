package builder.builder;

public class BabyBuilder extends AbstractUserBuilder {

    private static final String EMPTY = "";

    public void buildCompany() {
        user.setCompany(EMPTY);
    }

    public void buildPicture() {
        user.setPicture(EMPTY);
    }

    public void buildAge() {
        user.setAge("2");
    }

    public void buildName() {
        user.setName("BiBi");
    }

    public void buildGender() {
        user.setGender("h");
    }

    public void buildEmail() {
        user.setEmail(EMPTY);
    }

    public void buildBalance() {
        user.setBalance(EMPTY);
    }
}
