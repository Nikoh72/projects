/**
 * Created by emobilis on 7/16/18.
 */
package com.example.emobilis.database;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
public class Databasehelper extends SQLiteOpenHelper {
    public static final String DATABASE_NAME="db";
    public static final String TABLE_NAME="";
    public static final String COL_1="ID";
    public static final String COL_2="name";
    public static final String COL_3="marks";
    public static final String COL_4="admision";



    //super is a keyword used to refer to an immidiate parent class object
    public Databasehelper(Context Context){
        super(Context,DATABASE_NAME,null,1);
    }
    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("create table "+TABLE_NAME +
                "(ID INTEGER PRIMARY KEY AUTOINCREMENT ," +
                "NAME TEXT ,MARKS INTEGER,ADMISSION INTEGER)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase  db, int oldVersion, int newVersion) {
        //WILL CREATE database on a new version
        //it will drop the table from the previous version
        db.execSQL("DROP TABLE IF EXISTS"+TABLE_NAME);
        onCreate(db);

    }
    public boolean insertData(String s, String name, String marks, String admission){
        SQLiteDatabase db=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put(COL_2,name);
        contentValues.put(COL_3,marks);
        contentValues.put(COL_2,admission);
        long result=db.insert(TABLE_NAME,null,contentValues);
        if (result==-1)
            return false;
        else
            return true;
    }
    public Cursor getAllData(){
        SQLiteDatabase db=this.getWritableDatabase();
        Cursor result=db.rawQuery(
                "select * from "+TABLE_NAME,null);
                return result;

    }
    public Integer deleteData(String id){
        SQLiteDatabase db=this.getWritableDatabase();
        return db.delete(TABLE_NAME,"ID=?",
                new String[]{id});
    }
}
