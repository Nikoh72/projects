package com.example.emobilis.firebase;

import android.app.ProgressDialog;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class MainActivity extends AppCompatActivity {
    EditText mname,memail,mage;
    ProgressDialog progress;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mname=findViewById(R.id.editText);
        memail=findViewById(R.id.editText2);
        mage=findViewById(R.id.editText3);
    }
//put the save code here
    public void save(View view) {
        String name=mname.getText().toString();
        String age=mage.getText().toString();
        String email=memail.getText().toString();
        progress =new ProgressDialog(this);
        progress.setMessage("saving..");
        if (name.isEmpty()||age.isEmpty()||email.isEmpty()){
            Toast.makeText(this, "Please fill all inputs Nigga", Toast.LENGTH_SHORT).show();
            return;
        }
        long time=System.currentTimeMillis();
        DatabaseReference ref= FirebaseDatabase.getInstance().getReference().child("users/"+time);
        Users members=new Users(name,email,age);
        progress.show();
        ref.setValue(members).addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {
                progress.dismiss();
                if (task.isSuccessful()){
                    mage.setText("");
                    mname.setText("");
                    memail.setText("");
                    Toast.makeText(MainActivity.this, "sucess", Toast.LENGTH_SHORT).show();
                }
                else
                    Toast.makeText(MainActivity.this, "failed", Toast.LENGTH_SHORT).show();
            }
        });
    }
//view code here


    public void view(View view) {
    }
}
