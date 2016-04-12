package com.example.aileen.superheroes;

import java.util.ArrayList;
import java.util.Arrays;

public class Hero {
    private String universe;
    private ArrayList<String> superheroes = new ArrayList<>();

    //constructor
    private Hero(String univ, ArrayList<String> heroes){
        this.universe = univ;
        this.superheroes = new ArrayList<String>(heroes);
    }

    public static final Hero[] heroes = {
            new Hero("DC", new ArrayList<String>(Arrays.asList("Superman", "Batman", "Wonder Woman", "The Flash", "Green Arrow", "Catwoman"))),
            new Hero("Marvel", new ArrayList<String>(Arrays.asList("Iron Man", "Black Widow", "Captain America", "Jean Grey", "Thor", "Hulk")))
    //source: http://www.ign.com/articles/2013/11/19/the-top-25-heroes-of-dc-comics
    //source: http://www.ign.com/articles/2014/09/10/top-25-best-marvel-superheroes
    };

    public String getUniverse(){
        return universe;
    }

    public ArrayList<String> getSuperheroes(){
        return superheroes;
    }

    public String toString(){
        return this.universe;
    }
}
