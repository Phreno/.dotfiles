package builder;

import builder.builder.AbstractUserBuilder;
import builder.model.User;

public class Director {

    private AbstractUserBuilder builder;

    public Director(AbstractUserBuilder builder) {
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
