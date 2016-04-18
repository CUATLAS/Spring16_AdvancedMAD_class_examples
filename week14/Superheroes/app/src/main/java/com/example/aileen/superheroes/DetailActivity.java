package com.example.aileen.superheroes;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class DetailActivity extends AppCompatActivity implements HeroDetailFragment.ButtonClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        //get reference to the hero detail fragment
        HeroDetailFragment heroDetailFragment = (HeroDetailFragment) getFragmentManager().findFragmentById(R.id.fragment_container);
        //get the id passed in the intent
        int universeId = (int) getIntent().getExtras().get("id");
        //pass the universe id to the fragment
        heroDetailFragment.setUniverse(universeId);
    }

    @Override public void addheroclicked(View view){
        HeroDetailFragment fragment = (HeroDetailFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addhero();
    }
}
