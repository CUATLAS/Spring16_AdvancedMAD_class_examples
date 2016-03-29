package com.example.aileen.spring;

import android.app.ListActivity;
import android.os.Bundle;
import android.widget.ListView;
import android.widget.ArrayAdapter;
import android.content.Intent;
import android.view.View;

public class BulbCategoryActivity extends ListActivity {

    private String bulbtype;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent i = getIntent();
        String bulbtype = i.getStringExtra("bulbtype");

        //get the list view
        ListView listBulbs = getListView();

        //define an array adapter
        ArrayAdapter<Bulb> listAdapter;

        //initialize the array adapter with the right list of bulbs
        switch (bulbtype){
            case "Tulips":
                listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_list_item_1, Bulb.tulips);
                break;
            default: listAdapter = new ArrayAdapter<Bulb>(this, android.R.layout.simple_list_item_1, Bulb.tulips);
        }

        //set the array adapter on the list view
        listBulbs.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(BulbCategoryActivity.this, BulbActivity.class);
        intent.putExtra("bulbid", (int) id);
        intent.putExtra("bulbtype", bulbtype);
        startActivity(intent);
    }
}
