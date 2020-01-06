# Messenger

Messenger  - приложение демонстрирующее работу с интентами, что позволяет на практике вызвать например новый экран или поделиться с кем-то через что-то. Это любимейшее приложение из всех что делал для андроида, потому что можно взаимодействовать с другими приложениями. Здесь я расширил пример из книги

<details>
    <summary>Демо</summary>
![demo][Demo]
</details>

<details>
    <summary>Передача данных другому экрану</summary>
    
    ```java    
    public  void onSendMessageLocal(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(this, ReceivedMessageActivity.class);
        intent.putExtra("message", message);
        startActivity(intent);
    }```
    
 ![send data other screen][SendDataOtherScreen]
</details>


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

[Demo]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/demo.gif>
[SendDataOtherScreen]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/screens/send_data_to_other_screen.jpg>
[Demo]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/demo.gif>
