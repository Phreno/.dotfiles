package builder;

public abstract class UserBuilder {
    protected User user;

    public void build() {
        user = new User();

    }

    public User get() {
        return user;
    }

    public void buildCompany() {
    }

    public void buildPicture() {
    }

    public void buildAge() {
    }

    public void buildName() {
    }

    public void buildGender() {
    }

    public void buildEmail() {
    }

    public void buildBalance() {
    }

}
