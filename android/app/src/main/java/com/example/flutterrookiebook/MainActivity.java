package com.example.flutterrookiebook;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

//      setContentView(R.layout.activity_main);
    GeneratedPluginRegistrant.registerWith(this);
  }
}
