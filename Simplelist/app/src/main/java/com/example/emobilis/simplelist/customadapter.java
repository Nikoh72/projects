package com.example.emobilis.simplelist;

import android.app.AlertDialog;
import android.content.Context;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

/**
 * Created by emobilis on 7/10/18.
 */

public class customadapter extends ArrayAdapter<here> {
    Context mCtx;
    int resource;
    List<here> hereList;
    public customadapter(Context mCtx, int resource,
                         List<here> hereList){
        super(mCtx,resource,hereList);
        //initialize all variables
        this.mCtx=mCtx;
        this.resource=resource;
        this.hereList=hereList;
    }
    //overide method to return view of all items

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        return super.getView(position, convertView, parent);
        //we create a layout inflater to inflate the layout resource file

        LayoutInflater inflater=LayoutInflater.from(mCtx);
        View view=inflater.inflate(R.layout.nik,null);
        TextView nameit=view.findViewById(R.id.textView4);
        TextView team=view.findViewById(R.id.textView5);
        ImageView imax=view.findViewById(R.id.imageView4);
        //get object fromlist based on position
        here here=hereList.get(position);
        nameit.setText(here.getName());
        team.setText(here.getTeam());
        imax.setImageDrawable(mCtx.getResources().getDrawable(here.getImage()));
        view.findViewById(R.id.button2).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });
        return view;
        //Custom custom=hereList.get(position){
        }
    }


}
