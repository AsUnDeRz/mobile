package com.example.android_my_messanger;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class CreateMessageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_message);
    }

    public  void onSendMessageLocal(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(this, ReceivedMessageActivity.class);
        intent.putExtra("message", message);
        startActivity(intent);
    }

    public  void onSendMessageApp(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.setType("text/plain");
        intent.putExtra(Intent.EXTRA_TEXT, message);
        startActivity(intent);
    }

    public  void onSendMessageAppVia(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.setType("textdcds/dsa");
        intent.putExtra(Intent.EXTRA_TEXT, message);
        String chooseTitle = getString(R.string.chooseSendAppVia);
        Intent chooseIntent = Intent.createChooser(intent, chooseTitle);
        startActivity(chooseIntent);
    }
}
