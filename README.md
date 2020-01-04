# Messenger

```java    
    public  void onSendMessageLocal(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(this, ReceivedMessageActivity.class);
        intent.putExtra("message", message);
        startActivity(intent);
    }    
```

```java    
    public  void onSendMessageApp(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.setType("text/plain");
        intent.putExtra(Intent.EXTRA_TEXT, message);
        startActivity(intent);
    }   
```

```java    
    public  void onSendMessageAppVia(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.setType("*/*");
        intent.putExtra(Intent.EXTRA_TEXT, message);
        String chooseTitle = getString(R.string.chooseSendAppVia);
        Intent chooseIntent = Intent.createChooser(intent, chooseTitle);
        startActivity(chooseIntent);
    }   
```

```java    
    public  void onSendMessageAppError(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(Intent.ACTION_SEND);
        intent.setType("application/vnd.zzazz.deck+xml");
        intent.putExtra(Intent.EXTRA_TEXT, message);
        if(intent.resolveActivity(getPackageManager()) != null )
            startActivity(intent);
    } 
```