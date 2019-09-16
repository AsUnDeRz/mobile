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
        case 1: {
            return _getDialogAcceptDeleteAllItems();
          }
          break;

        case 2: {
            return _getDialogSuccessDeleteAllItems();
          }
          break;

        default: {
          return _getDialogErrorDeleteAllItems();
        }
      }
    }
  }

  Widget _getDialogAcceptDeleteAllItems() {
    return PlatformAlertDialog(
      title: Text('Подвердите удаление всех товаро из корзины'),
      actions: <Widget>[
        _getButtonBack('Назад'),
        _getButtonDelete('Удалить всё', onDeleteAllCartItems),
      ],
    );
  }

  Widget _getButtonBack(String label) {
    return  PlatformDialogAction(
      android: (_) => MaterialDialogActionData(),
      ios: (_) => CupertinoDialogActionData(),
      child: PlatformText(
        label,
      ),
      onPressed: onBack,
    );
  }

  Widget _getButtonDelete(String label, Function handler) {
    return  PlatformDialogAction(
      android: (_) => MaterialDialogActionData(),
      ios: (_) => CupertinoDialogActionData(),
      child: PlatformText(
        label,
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      onPressed: handler,
    );
  }

  Widget _getDialogSuccessDeleteAllItems() {
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

  Widget _getDialogErrorDeleteAllItems () {
    return PlatformAlertDialog(
      title: Text('Ошибка'),
      content: Container(
        height: 50,
        child: Center(
          child: Text('Произошла неизвестная ошибка'),
        ),
      ),
      actions: <Widget>[
        _getButtonBack('Вернуться назад'),
      ],
    );
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
  void onError() {
    ErrorDialogWidget.showErrorDialog(context);
  }
}
