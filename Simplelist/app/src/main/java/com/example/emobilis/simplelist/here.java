package com.example.emobilis.simplelist;

/**
 * Created by emobilis on 7/10/18.
 */

public class here {
    //we will refer to the image based on the id
    int image;
    String name,team;

    public here(int image, String name, String team) {
        this.image = image;
        this.name = name;
        this.team = team;
    }

    public int getImage() {
        return image;
    }

    public String getName() {
        return name;
    }

    public String getTeam() {
        return team;
    }
}
