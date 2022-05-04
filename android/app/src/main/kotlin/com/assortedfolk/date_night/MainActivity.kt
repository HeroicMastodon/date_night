package com.assortedfolk.date_night

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    private var sharedText: String? = null
    private val CHANNEL = "app.channel.shared.data"
    private val widgetChannelName = "app.channel.home_widget"
    private var widgetChannel: MethodChannel? = null
    private val widgetMethod = "getPick"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        super.onResume()
        intent
        widgetChannel?.invokeMethod(widgetMethod, getPick())
        setPick(null)
//        if (getPick() != null) {
//            widgetChannel?.invokeMethod(widgetMethod, getPick())
//        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                    if (call.method?.contentEquals("getSharedText") == true) {
                        result.success(sharedText)
                        sharedText = null
                    }
                }

        widgetChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, widgetChannelName);
//        widgetChannel?.invokeMethod(widgetMethod, getPick())
    }

    fun handleSendText(intent: Intent) {
        sharedText = intent.getStringExtra(Intent.EXTRA_TEXT)
    }
}

/*
 this is what I have been looking for
 Android code
 class MainActivity: FlutterActivity() {

    private val CHANNEL = "CHANNEL"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

       val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL);

        channel.invokeMethod("nameOfMethod", "dataToPass")

    }

}

Flutter code
MethodChannel channel = MethodChannel('CHANNEL');

  @override
  void initState() {

    channel.setMethodCallHandler((call){

      if(call.method == 'nameOfMethod'){
        print(call.arguments);
      }

      return null;
    });
    super.initState();
  }
 */
