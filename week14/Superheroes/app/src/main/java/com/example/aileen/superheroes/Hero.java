package com.example.aileen.superheroes;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class Hero {
    private String universe;
    private ArrayList<String> superheroes = new ArrayList<>();

    //constructor
    private Hero(String univ, ArrayList<String> heroes){
        this.universe = univ;
        this.superheroes = new ArrayList<String>(heroes);
    }

    public static final Hero[] heroes = {
            new Hero("DC", new ArrayList<String>()),
            new Hero("Marvel", new ArrayList<String>())

            // new Hero("DC", new ArrayList<String>(Arrays.asList("Superman", "Batman", "Wonder Woman", "The Flash", "Green Arrow", "Catwoman"))),
            // new Hero("Marvel", new ArrayList<String>(Arrays.asList("Iron Man", "Black Widow", "Captain America", "Jean Grey", "Thor", "Hulk")))

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

    public void storeHeroes(Context context, long universeId){
        //get access to a shared preferences file
        SharedPreferences sharedPrefs = context.getSharedPreferences("Superheroes", Context.MODE_PRIVATE);
        //create an editor to write to the shared preferences file
        SharedPreferences.Editor editor = sharedPrefs.edit();
        //create a set
        Set<String> set = new HashSet<String>();
        //add heroes to the set
        set.addAll(heroes[(int) universeId].getSuperheroes());
        //pass the key/value pair to the shared preference file
        editor.putStringSet(heroes[(int) universeId].getUniverse(), set);
        //save changes
        editor.commit();
    }

    public void loadHeroes(Context context, int universeId){
        //get access to a shared preferences file
        SharedPreferences sharedPrefs = context.getSharedPreferences("Superheroes", Context.MODE_PRIVATE);
        //create an editor to read from the shared preferences file
        SharedPreferences.Editor editor = sharedPrefs.edit();
        //create a set with the hero list
        Set<String> set =sharedPrefs.getStringSet(heroes[universeId].getUniverse(), null);
        //if there was a saved list add it to the heroes array
        if (set != null){
            Hero.heroes[universeId].superheroes.addAll(set);
        }
        //if no hero list was saved, use the defaults
        else {
            switch (universeId) {
                case 0:
                    Hero.heroes[0].superheroes.addAll(Arrays.asList("Superman", "Batman", "Wonder Woman", "The Flash", "Green Arrow", "Catwoman"));
                    break;
                case 1:
                    Hero.heroes[1].superheroes.addAll(Arrays.asList("Iron Man", "Black Widow", "Captain America", "Jean Grey", "Thor", "Hulk"));
                    break;
                default:
                    break;
            }
        }
    }
}
