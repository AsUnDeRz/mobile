import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';


class ErrorDialogWidget {
    static showErrorDialog(BuildContext context, {
      dynamic error,
      title = 'Ошибка',
      String labelButton = 'Повторить',
      Function handlerButton,
    }) {
      showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
          title: Text('Ошибка'),
          content: Text(error==null?'Произошла ошибка напишите об этом разработчику':error.toString()),
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
