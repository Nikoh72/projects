package com.example.emobilis.mydatabase;

import android.database.Cursor;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    DatabaseHelper myDb;
    Button btnAddData,btnviewAll,btnDelete;
    EditText editName,editSurname,editMarks,editTextId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        myDb=new DatabaseHelper(this);
        editName=findViewById(R.id.editText);
        editSurname=findViewById(R.id.editText2);
        editMarks=findViewById(R.id.editText3);
        editTextId=findViewById(R.id.editText4);
        btnAddData=findViewById(R.id.button);
        btnviewAll=findViewById(R.id. button2);
        btnDelete=findViewById(R.id. button3);
        addData();
        viewAll();
        DeleteData();

    }

    private void DeleteData() {
        btnDelete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
           Integer deletedRows=myDb.deleteData(editTextId.getText().toString());
           if (deletedRows>0)
               Toast.makeText(MainActivity.this,"DELETED",Toast.LENGTH_SHORT).show();
           else
               Toast.makeText(MainActivity.this,"FAILED TO DELETE",Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void viewAll() {
        btnviewAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Cursor res = myDb.getAllData();
                if (res.getCount() == 0) {
                    showMessage("Error", "No student in database");
                    return;
                }
                StringBuffer buffer = new StringBuffer();
                while (res.moveToNext()) {
                    buffer.append("MY ID :" + res.getString(0) + "\n");
                    buffer.append("MY NAME :" + res.getString(1)+ "\n");
                    buffer.append("surname :" + res.getString(2) + "\n");
                    buffer.append("my MARKS :" + res.getString(3) + "\n");
                }
                showMessage("students RECORD", buffer.toString());

            }


        });
    }
    private void showMessage(String title_, String Message) {
        AlertDialog.Builder builder=new AlertDialog.Builder(this);
        builder.setCancelable(true);
        builder.setTitle(title_);
        builder.setMessage(Message);
        builder.show();
    }

    private void addData() {
        btnAddData.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
           boolean isInSerted=myDb.insertData
                   (editName.getText().toString(),
                   editSurname.getText().toString(),
                editMarks.getText().toString());
        if (isInSerted==true)
            Toast.makeText(MainActivity.this,"Inserted",Toast.LENGTH_SHORT).show();
        else
            Toast.makeText(MainActivity.this,"failed to insert",Toast.LENGTH_SHORT).show();
            }
        });
    }


}
