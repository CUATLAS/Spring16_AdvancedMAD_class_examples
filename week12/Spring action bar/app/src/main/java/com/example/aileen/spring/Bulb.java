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

    public static final Bulb[] daffodils = {
            new Bulb("Bella Vista", R.drawable.bellavista),
            new Bulb("Big Gun", R.drawable.biggun),
            new Bulb("Full House", R.drawable.fullhouse),
            new Bulb("Ice Follies", R.drawable.icefollies),
            new Bulb("Yellow Hoop", R.drawable.yellowhoop)
    };

    public static final Bulb[] iris = {
            new Bulb("Blazing Sunrise", R.drawable.blazingsunrise),
            new Bulb("October Sun", R.drawable.octobersun),
            new Bulb("Purple Night Sky", R.drawable.purplenightsky),
            new Bulb("Temper Tantrum", R.drawable.tempertantrum),
            new Bulb("Victoria Falls", R.drawable.victoriafalls)
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
