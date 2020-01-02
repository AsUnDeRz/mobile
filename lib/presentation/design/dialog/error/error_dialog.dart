import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class ErrorDialogWidget {
    static showErrorDialog(BuildContext context, {
      dynamic error,
      title = 'Error',
      String labelButton = 'Repeat',
      Function handlerButton,
    }) {
      showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title: Text('Error'),
          content: Text(error==null?'An error has occurred, write to the developer about this':error.toString()),
          actions: <Widget>[
            PlatformDialogAction(
              android: (_) => MaterialDialogActionData(),
              ios: (_) => CupertinoDialogActionData(),
              child: PlatformText(labelButton),
              onPressed: () {
                Navigator.pop(context);
                if(handlerButton!=null) {
                  handlerButton();
                }
              },
            ),
          ],
        ),
      );
    }
}
