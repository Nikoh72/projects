package com.example.emobilis.prof;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

import de.hdodenhof.circleimageview.CircleImageView;

public class MainActivity extends AppCompatActivity {
    CircleImageView j;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        j=findViewById(R.id.circleImageView);

        j.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                j.setImageResource(R.drawable.th);
            }
        });
    }
}
