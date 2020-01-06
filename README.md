# Messenger

Messenger  - приложение демонстрирующее работу с интентами, что позволяет на практике вызвать например новый экран или поделиться с кем-то через что-то. Это любимейшее приложение из всех что делал для андроида, потому что можно взаимодействовать с другими приложениями. Здесь я расширил пример из книги

<details>
    <summary>Демо, полная версия</summary>
    
![demo][FullDemo]
</details>

<details>
    <summary>Передача данных другому экрану</summary>
    
   Код для этого события
   
    ```java    
    public  void onSendMessageLocal(View view){
        EditText editText = findViewById(R.id.editText);
        String message = editText.getText().toString();
        Intent intent = new Intent(this, ReceivedMessageActivity.class);
        intent.putExtra("message", message);
        startActivity(intent);
    }
    ```
 
   <details>
      <summary>Демо</summary>

  ![send data other screen demo][SendDataOtherScreenDemo]
  </details>   

   <details>
      <summary>Скриншоты</summary>

  ![send data other screen][SendDataOtherScreen]
  </details>   

</details>

--------------------------------------------------

<details>
    <summary>Передача данных другому приложению на примере почты с указанием конкретного MIME-type</summary>

Код для этого события

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
 <details>
    <summary>Демо</summary>
    
![send mail demo][SendMailDemo]
</details>   

 <details>
    <summary>Скриншоты</summary>
    
![send mail share][SendMailShare]
![send mail gmail][SendMailGmail]
</details>   
</details>

--------------------------------------------------

<details>
    <summary>Передача данных другому приложению на примере почты с любого MIME-type</summary>

Код для этого события

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
    
 <details>
    <summary>Демо</summary>
    
![tg demo][TgDemo]
</details>   

 <details>
    <summary>Скриншоты</summary>
    
![tg share][TgShare]
![send message tg][TgSendMessage]
</details>   
</details>
</details>

--------------------------------------------------

<details>
    <summary>Обработка случая, когда нет подходящего приложения для шаринга</summary>
    
   Увы, мне этот исходсобытий не удалось воспроизвести, хотя на маке раньше удавалось.

Код для этого события

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
</details>
--------------------------------------------------

[FullDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/demo.gif>

[SendDataOtherScreen]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/screens/send_data_to_other_screen.jpg>
[SendDataOtherScreenDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/other_screen_demo.gif>

[SendMailDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/send_mail_demo.gif>
[SendMailShare]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/screens/mail_share_dialog.jpg>
[SendMainGmail]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/screens/send_mail.jpg>

[TgDemo]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/send_tg_demo.gif>
[TgShare]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/screens/tg_share_dialog.jpg>
[TgSendMessage]:<https://github.com/iebrosalin/mobile/blob/master/readme/android/messanger/screens/tg_send_message.jpg>
