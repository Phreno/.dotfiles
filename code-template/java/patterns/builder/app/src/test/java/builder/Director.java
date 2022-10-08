package builder;

public class Director {

    private UserBuilder builder;

    public Director(UserBuilder builder) {
        this.builder = builder;
    }

    public User build() {
        return new User();
    }

}
