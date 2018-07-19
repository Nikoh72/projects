package com.example.emobilis.simplelist;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    List<here> hereList;
      ListView listview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
       hereList=new ArrayList<>();
       hereList.add(new here(R.drawable.aa,"imageView4","beast"));
       hereList.add(new here(R.drawable.e,"imageView4","lily"));
       hereList.add(new here(R.drawable.g,"imageView4","marsh"));
       hereList.add(new here(R.drawable.th,"imageView4","nik"));
       listview=findViewById(R.id.list);
       customadapter adapter=new customadapter(this,R.layout.nik,hereList);
       listview.setAdapter(adapter);


    }
}
