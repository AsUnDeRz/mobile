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
            return PlatformAlertDialog(
              title: Text('Подвердите удаление'),
              content: Container(
                height: 80,
                child: Center(
                  child: Text(
                    '${cartItem.title} ${CartItemHelper.formatCount(cartItem.count)} ${MoneyHelper.formatMoney(cartItem.price)}'
                  ),
                ),
              ) ,
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
                    'Удалить',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  ),
                  onPressed: () => onDeleteCartItem(cartItem.id),
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
          break;
      }
    }
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
  void onError(String error) {
    ErrorDialogWidget.showErrorDialog(error, context);
  }
}
