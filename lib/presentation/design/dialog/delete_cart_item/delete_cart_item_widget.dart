import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';

import 'delete_cart_item_presenter.dart';
import 'delete_cart_item_view.dart';

class DeleteCartItemWidget extends StatefulWidget {
  final CartItem _cartItem;

  DeleteCartItemWidget(this._cartItem);

  @override
  _DeleteCartItemWidgetState createState() => _DeleteCartItemWidgetState();
}

class _DeleteCartItemWidgetState extends State<DeleteCartItemWidget>
    implements DeleteCartItemView {
  DeleteCartItemPresenter _deleteCartItemPresenter;
  int _numberStep;
  bool _isLoading;

  _DeleteCartItemWidgetState() {
    _numberStep = 1;
    _isLoading = false;
    _deleteCartItemPresenter = DeleteCartItemPresenter(this);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getBody(widget._cartItem);
  }

  Widget _getBody(CartItem cartItem) {
    if (_isLoading) {
      return LoaderPage();
    } else {
      switch (_numberStep) {
        case 1:
          {
            return _getDialogAcceptDeleteItem(cartItem.id);
          }
          break;

        case 2:
          {
            return _getDialogSuccessDeleteItem();
          }
          break;

        default: {
          return _getDialogErrorDeleteItem();
        }
      }
    }
  }

  Widget _getDialogAcceptDeleteItem(int id) {
    return PlatformAlertDialog(
      title: Text('Подвердите удаление'),
      actions: <Widget>[
        _getButtonBack('Назад'),
        _getButtonDelete('Удалить', () => onDeleteCartItem(id)),
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

  Widget _getDialogSuccessDeleteItem() {
    return PlatformAlertDialog(
      title: Text(''),
      content: Container(
        height: 50,
        child: Center(
          child: Text(
            'Товар успешно удалён',
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

  Widget _getDialogErrorDeleteItem() {
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
  void onDeleteCartItem(int id) {
    _deleteCartItemPresenter.deleteItem(id);
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
