package com.example.emobilis.sharedpref2;

import android.content.SharedPreferences;
import android.os.Build;
import android.support.annotation.RequiresApi;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends AppCompatActivity {
  private Button mred,mgreen,mblue;
   android.support.v7.widget.Toolbar toolbar;
    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mred=findViewById(R.id.button);
        mgreen=findViewById(R.id.button2);
        mblue=findViewById(R.id.button3);
        toolbar=findViewById(R.id.toolbar);
        toolbar.setTitle("MY SHARED PREF");
        if (getColor()!=getResources().getColor(R.color.colorPrimary));
        toolbar.setBackgroundColor(getResources().getColor(R.color.colorBlue));
        if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.LOLLIPOP){
            getWindow().setStatusBarColor(getResources().getColor(R.color.colorBlue));
            mred.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick (View view) {
                    mred.setBackgroundColor(getResources().getColor(R.color.colorRed));
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        getWindow().setStatusBarColor(getResources().getColor(R.color.colorRed));

                    }
                    storeColors(getResources().getColor(R.color.colorBlue));
                });
                public void onClick(View view){
                    mblue.setBackgroundColor(getResources().getColor(R.color.colorBlue));
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        getWindow().setStatusBarColor(getResources().getColor(R.color.colorBlue));

                    }
                    storeColors(getResources().getColor(R.color.colorBlue));
            });

                    public void onClick (View view){
                    mgreen.setBackgroundColor(getResources().getColor(R.color.colorGreen));
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        getWindow().setStatusBarColor(getResources().getColor(R.color.colorBlue));
                    }
                        storeColors(getResources().getColor(R.color.colorBlue));



                }
            });
            mblue.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    mblue.setBackgroundColor(getResources().getColor(R.color.colorBlue));
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        getWindow().setStatusBarColor(getResources().getColor(R.color.colorBlue));

                    }
                    storeColors(getResources().getColor(R.color.colorBlue));
                }
            });
            private int getColor(){
            SharedPreferences mSharedpref=
                    getSharedPreferences("ToolbarColor",MODE_PRIVATE);
            SharedPreferences.Editor editor=mSharedpref.edit();
            editor.putInt("color",Color);
            editor.apply();
        }
        private int getColor(){
                SharedPreferences msharedpref=getSharedPreferences("toolbarcolor",MODE_PRIVATE);
                int SelectedColor=msharedpref.getInt("color",getResources().getColor(R.color.colorPrimary));
                return SelectedColor;
        }
        }
    }
}
