package com.example.aileen.superheroes;


import android.app.ListFragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;

import java.util.ArrayList;

public class HeroDetailFragment extends ListFragment {

    private long universeId; //id of the universe chosen

    public HeroDetailFragment() {
        // Required empty public constructor
    }

    //set the universe id
    public void setUniverse(long id){
        this.universeId = id;
    }

    @Override public void onStart(){
        super.onStart();

        // get hero data
        ArrayList<String> herolist = new ArrayList<String>();
        herolist = Hero.heroes[(int) universeId].getSuperheroes();
        // herolist = Hero.heroes[0].getSuperheroes();

        //create array adapter
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, herolist);

        //bind array adapter to the list view
        setListAdapter(adapter);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        //recover the id if one was saved
        if (savedInstanceState !=null){
            universeId = savedInstanceState.getLong("universeId");
        }
        return super.onCreateView(inflater, container, savedInstanceState);
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("universeId", universeId);
    }
}
