package com.example.aileen.spring;

/**
 * Created by aileen on 3/25/16.
 */
public class Bulb {
    private String name;
    private int imageResourceID;

    //constructor
    private Bulb(String newname, int newID){
        this.name = newname;
        this.imageResourceID = newID;
    }

    public static final Bulb[] tulips = {
            new Bulb("Daydream", R.drawable.daydream),
            new Bulb("Apeldoorn Elite", R.drawable.apeldoorn),
            new Bulb("Banja Luka", R.drawable.banjaluka),
            new Bulb("Burning Heart", R.drawable.burningheart),
            new Bulb("Cape Cod", R.drawable.capecod)
    };

    public String getName(){
        return name;
    }

    public int getImageResourceID(){
        return imageResourceID;
    }

    //the string representation of a tulip is its name
    public String toString(){
        return this.name;
    }

}
