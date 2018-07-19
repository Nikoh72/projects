package com.example.emobilis.shared;

import android.content.SharedPreferences;
import android.os.Build;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
    //define variables to hold the views
    android.support.v7.widget.Toolbar mtoolbar;
    Button mred,mgreen,mblue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mtoolbar=findViewById(R.id.toolbar);
        mred=findViewById(R.id.button1);
        mgreen=findViewById(R.id.button2);
        mblue=findViewById(R.id.button3);
        //set tittle for toolbar
        mtoolbar.setTitle("MY TOOLBAR");
        if (getColor()!=getResources().getColor(R.color.colorPrimary));
        mtoolbar.setBackgroundColor(getColor());
        if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP){
            getWindow().setStatusBarColor(getColor());
        }
        mblue.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                mtoolbar.setBackgroundColor(getColor());
                if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP){
                    getWindow().setStatusBarColor(getResources().getColor(R.color.colorBlue));
                }
                storeColors (getResources().getColor(R.color.colorBlue));
            }
        });
        mred.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP){
                    getWindow().setStatusBarColor(getResources().getColor(R.color.colorRed));
                }
                storeColors(getResources().getColor(R.color.colorRed));

            }
        });
        mgreen.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP){
                    getWindow().setStatusBarColor(getResources().getColor(R.color.colorGreen));
                }
                storeColors(getResources().getColor(R.color.colorGreen));

            }
        });}

        private void storeColors(int color){
            SharedPreferences msharedprefrence=getSharedPreferences("Toolbarcolor",MODE_PRIVATE);
            SharedPreferences.Editor editor=msharedprefrence.edit();
            editor.putInt("color",color);
            editor.apply();
    }
    private int getColor(){
            SharedPreferences mSharedPrefrences=getSharedPreferences(
            ""+"Toolbarcolor",MODE_PRIVATE);
            int selectedcolor=mSharedPrefrences.getInt("color",getResources().getColor(R.color.colorPrimary));
            return selectedcolor;
    }
    }

