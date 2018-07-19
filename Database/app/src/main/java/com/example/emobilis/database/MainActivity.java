package com.example.emobilis.database;

import android.database.Cursor;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Databasehelper db;
    EditText textname,textmarks,textadmission,textid;
    Button btadd,btview,btdel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textname = findViewById(R.id.editText2);
        textmarks = findViewById(R.id.editText3);
        textadmission = findViewById(R.id.editText5);
        textid = findViewById(R.id.editText4);
        btadd = findViewById(R.id.button);
        btdel = findViewById(R.id.button2);
        btview = findViewById(R.id.button4);
        AddData();
        viewAll();
        DeleteData();
    }
        private void viewAll() {
        btview.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Cursor res=db.getAllData();
                if (res.getCount()==0){
                    showMessage("Error","No data");
                    return;
            }
            StringBuffer buffer=new StringBuffer();
                while (res.moveToNext()){
                    buffer.append("id "+res.getString(0)+"\n");
                    buffer.append("name "+res.getString(0)+"\n");
                    buffer.append("marks "+res.getString(0)+"\n");
                    buffer.append("admission "+res.getString(3)+"\n");

        }
            showMessage("Information",buffer.toString());
            }});

    }

    private void showMessage(String tittle,String message) {
        AlertDialog.Builder builder=new AlertDialog.Builder(this);
    }

    public void DeleteData() {
        btdel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
         Integer deleteRows=db.deleteData(textid.getText().toString());
         if (deleteRows>0)
             Toast.makeText(MainActivity.this, "succesfully deleted", Toast.LENGTH_SHORT).show();
         else Toast.makeText(MainActivity.this, "not deleted", Toast.LENGTH_SHORT).show();
            }
        });
    }

    public void AddData(){
        btadd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                boolean isInserted=db.insertData(
                        textadmission.getText().toString(),
                        textid.getText().toString(),
                        textmarks.getText().toString(),
                        textname.getText().toString());
                        if (isInserted==true)
                    Toast.makeText(MainActivity.this, "data inserted", Toast.LENGTH_SHORT).show();
                        else Toast.makeText(MainActivity.this, "Data NOT INSERTED", Toast.LENGTH_SHORT).show();
            }
        });
    }
    }

