package com.example.aileen.superheroes;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.app.Fragment;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import java.util.ArrayList;

public class HeroDetailFragment extends Fragment implements View.OnClickListener{
// implements View.OnClickListener

    public HeroDetailFragment() {
        // Required empty public constructor
    }

    private long universeId; //id of the universe chosen

    //set the universe id
    public void setUniverse(long id){
        this.universeId = id;
    }

    //create array adapter
    private ArrayAdapter<String> adapter;

    //create interface
    public interface ButtonClickListener{
        public void addheroclicked(View view);
    }

    //create listener
    private ButtonClickListener listener;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        if (savedInstanceState !=null){
            universeId = savedInstanceState.getLong("universeId");
        }
        //if the hero list is empty, load heroes
        if (Hero.heroes[0].getSuperheroes().size() == 0 ) {
            Hero.heroes[0].loadHeroes(getActivity(), 0);
        }
        if (Hero.heroes[1].getSuperheroes().size() == 0 ) {
            Hero.heroes[1].loadHeroes(getActivity(), 1);
        }
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_hero_detail, container, false);
    }

    @Override public void onStart(){
        super.onStart();

        View view = getView();
        ListView listHeroes = (ListView) view.findViewById(R.id.herolistView);

        // get hero data
        ArrayList<String> herolist = new ArrayList<String>();
        herolist = Hero.heroes[(int) universeId].getSuperheroes();
                // Hero.heroes[0].getSuperheroes();

        //set the array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, herolist);

        //bind array adapter to the list view
        listHeroes.setAdapter(adapter);

        Button addButton = (Button) view.findViewById(R.id.addButton);
        addButton.setOnClickListener(this);

        //register contextmenu
        registerForContextMenu(listHeroes);
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("universeId", universeId);
    }

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        if (context instanceof ButtonClickListener) {
            listener = (ButtonClickListener) context; //causes crash
        }
    }

    @Override public void onClick(View view){
        if (listener !=null){
            listener.addheroclicked(view);
        }
    }

    public void addhero(){
        final Dialog dialog = new Dialog(getActivity());
        dialog.setContentView(R.layout.dialog);
        dialog.setTitle("Add Hero");
        dialog.setCancelable(true);
        final EditText editText = (EditText) dialog.findViewById(R.id.editTextHero);
        Button button = (Button) dialog.findViewById(R.id.addButton);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String heroName = editText.getText().toString();
                // add hero
                Hero.heroes[(int) universeId].getSuperheroes().add(heroName);
                //refresh the list view
                HeroDetailFragment.this.adapter.notifyDataSetChanged();
                Hero.heroes[(int) universeId].storeHeroes(getActivity(), universeId);
                dialog.dismiss();
            }
        });
        dialog.show();
    }

    //create a context menu on long press
    @Override public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get hero name that was pressed
        String heroname = adapter.getItem(adapterContextMenuInfo.position);
        //set the menu title
        menu.setHeaderTitle("Delete " + heroname);
        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }

    //handle context menu item selection
    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) { //if yes menu item was pressed
            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
            //remove the hero
            Hero.heroes[(int) universeId].getSuperheroes().remove(info.position);
            //refresh the list view
            HeroDetailFragment.this.adapter.notifyDataSetChanged();
            Hero.heroes[(int) universeId].storeHeroes(getActivity(), universeId);
        }
        return true;
    }

    //reference: http://www.survivingwithandroid.com/2012/10/android-listviewarrayadapter-and.html

}
