package builder;

public class Director {

    private UserBuilder builder;

    public Director(UserBuilder builder) {
        this.builder = builder;
    }

    public User build() {
        builder.build();
        builder.buildAge();
        builder.buildBalance();
        builder.buildCompany();
        builder.buildEmail();
        builder.buildGender();
        builder.buildName();
        builder.buildPicture();
        return builder.get();
    }

}
