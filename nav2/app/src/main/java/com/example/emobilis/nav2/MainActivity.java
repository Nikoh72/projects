package com.example.emobilis.nav2;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.view.View;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;

public class MainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent sendit=new Intent(Intent.ACTION_SENDTO, Uri.fromParts("mailto","luvativickram@gmail.com",null));
                sendit.putExtra(Intent.EXTRA_SUBJECT,"REVIEW");
                sendit.putExtra(Intent.EXTRA_TEXT,"MY REVIEW IS");
                startActivity(Intent.createChooser(sendit,"SEND MAIL TO"));
            }

        });

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_camera) {
            // Handle the camera action
        } else if (id == R.id.nav_gallery) {
            Intent gal=new Intent(Intent.ACTION_SEND);
            gal.setType("plain/text");
            startActivity(Intent.createChooser(gal,"share via"));

        } else if (id == R.id.nav_slideshow) {
            Intent sli=new Intent(Intent.ACTION_DIAL);
            sli.setType("plain/text");
            startActivity(Intent.createChooser(sli,"share via"));

        } else if (id == R.id.nav_manage) {
            Intent mm=new Intent(Intent.ACTION_ANSWER);
            mm.setType("plain/text");
            startActivity(Intent.createChooser(mm,"share via"));

        } else if (id == R.id.nav_share) {
            Intent ss=new Intent(Intent.ACTION_GET_CONTENT);
            ss.setType("plain/text");
            startActivity(Intent. ss,"share via"));

        } else if (id == R.id.nav_send) {
            Intent vv=new Intent(Intent.ACTION_CHOOSER);
            vv.setType("plain/text");
            startActivity(Intent.createChooser(vv,"share via"));

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
}