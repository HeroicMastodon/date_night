package com.assortedfolk.date_night

import android.app.Activity
import android.os.Bundle
import android.view.Window
import android.widget.Button
import android.widget.TextView

class WidgetDialog: Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.widget_dialog);

        val dialogText = "This is the dialog text";
        val textView = findViewById<TextView>(R.id.w_dialog_txt);
        textView.text = dialogText;

        val dismissButton = findViewById<Button>(R.id.w_dismiss_btn);
        dismissButton.setOnClickListener {
            this.finish()
        };
    }
}