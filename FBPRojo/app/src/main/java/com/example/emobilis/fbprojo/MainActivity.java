package com.example.emobilis.fbprojo;

import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class MainActivity extends AppCompatActivity {
EditText mName,mEmail,mAge;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mName=findViewById(R.id.editText);
        mEmail=findViewById(R.id.editText2);
        mAge=findViewById(R.id.editText3);
    }

    public void save(View view) {
      String name=mName.getText().toString();
      String mail=mEmail.getText().toString();
      String age=mAge.getText().toString();
      long time = System.currentTimeMillis();
        DatabaseReference ref= FirebaseDatabase.getInstance().getReference().child("Users/"+time);
        User members=new User(name,mail,age);
        ref.setValue(members).addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {
                if (task.isSuccessful()){
                    Toast.makeText(MainActivity.this, "success", Toast.LENGTH_SHORT).show();
                }else {
                    Toast.makeText(MainActivity.this, "failed", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    public void fetch(View view) {
    }
}
