import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';

import 'delete_all_cart_item_presenter.dart';
import 'delete_all_cart_item_view.dart';

class DeleteAllCartItemsWidget extends StatefulWidget {

  @override
  _DeleteAllCartItemsWidgetState createState() => _DeleteAllCartItemsWidgetState();
}

class _DeleteAllCartItemsWidgetState extends State<DeleteAllCartItemsWidget>
    implements DeleteAllCartItemsView {
  DeleteAllCartItemsPresenter _deleteAllCartItemsPresenter;
  int _numberStep;
  bool _isLoading;

  _DeleteAllCartItemsWidgetState() {
    _numberStep = 1;
    _isLoading = false;
    _deleteAllCartItemsPresenter = DeleteAllCartItemsPresenter(this);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    if (_isLoading) {
      return LoaderPage();
    } else {
      switch (_numberStep) {
        case 1:
          {
            return PlatformAlertDialog(
              title: Text('Подвердите удаление всех товаро из корзины'),
              actions: <Widget>[
                PlatformDialogAction(
                  android: (_) => MaterialDialogActionData(),
                  ios: (_) => CupertinoDialogActionData(),
                  child: PlatformText(
                    'Назад',
                  ),
                  onPressed: onBack,
                ),
                PlatformDialogAction(
                  android: (_) => MaterialDialogActionData(),
                  ios: (_) => CupertinoDialogActionData(),
                  child: PlatformText(
                    'Удалить всё',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  ),
                  onPressed: () => onDeleteAllCartItems(),
                ),
              ],
            );
          }
          break;

        case 2:
          {
            return PlatformAlertDialog(
              title: Text(''),
              content: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                        'Товары успешно удалены',
                    ),
                  ),
              ),
              actions: <Widget>[
                PlatformDialogAction(
                  android: (_) => MaterialDialogActionData(),
                  ios: (_) => CupertinoDialogActionData(),
                  child: PlatformText(
                    'Продолжить покупки',
                  ),
                  onPressed: onBack,
                ),
              ],
            );
          }
          break;
      }
    }
  }

  @override
  void onBack() {
    Navigator.pop(context);
  }

  @override
  void onDeleteAllCartItems() {
    _deleteAllCartItemsPresenter.deleteItems();
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void onAcceptDelete() {
    setState(() {
      _isLoading = false;
      _numberStep = 2;
    });
  }

  @override
  void onError(String error) {
    ErrorDialogWidget.showErrorDialog(error, context);
  }
}
