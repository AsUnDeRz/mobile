import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/domain/model/offer.dart';

import 'count_good_presenter.dart';
import 'count_good_view.dart';

class CountGoodWidget extends StatefulWidget {
  final Offer _offer;

  CountGoodWidget(this._offer);

  @override
  _CountGoodWidgetState createState() => _CountGoodWidgetState();
}

class _CountGoodWidgetState extends State<CountGoodWidget>
    implements CountGoodView {
  CountGoodPresenter _countGoodPresenter;
  int _count;
  int _numberStep;
  bool _isLoading;

  _CountGoodWidgetState() {
    _count = 1;
    _numberStep = 1;
    _isLoading = false;
    _countGoodPresenter = CountGoodPresenter(this);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getBody(widget._offer);
  }

  Widget _getBody(Offer offer) {
    if (_isLoading) {
      return LoaderPage();
    } else {
      switch (_numberStep) {
        case 1:
          {
            return PlatformAlertDialog(
              title: Text('Выберите количество товара '),
              content:  Table(
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Table(
                          columnWidths: {
                            0: FixedColumnWidth(60.0),
                            1: FixedColumnWidth(10),
                            2: FixedColumnWidth(60.0),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: [
                                Container(
                                  height: 50,
                                  child: RaisedButton(
                                    shape: CircleBorder(),
                                    color: Colors.blue,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    onPressed: onIncrement,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: Center(
                                    child: Text('$_count',
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  child: RaisedButton(
                                    shape: CircleBorder(),
                                    color: Colors.blue,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    onPressed: onDecrement,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Table(
                          columnWidths: {
                            0: FixedColumnWidth(100.0),
                            1: FixedColumnWidth(100),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: [
                                Container(
                                  height: 50,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                    child:
                                    Center(
                                      child: Text(
                                          'Стоимость:'
                                      ),
                                    ),
                                ),
                                Container(
                                  height: 50,
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child:  Center(
                                    child: Text(
                                      MoneyHelper.formatMoney(_count * offer.price),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
                    'Добавить в корзину',
                  ),
                  onPressed: () => onAddCart(
                      CartItem(null, offer.title, offer.image, offer.id, _count, _count * offer.price)),
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
                        'Товар успешно добавлен',
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
  void onDecrement() {
    setState(() {
      if(_count>1) --_count;
    });
  }

  @override
  void onIncrement() {
    setState(() {
      ++_count;
    });
  }

  @override
  void onBack() {
    Navigator.pop(context);
  }

  @override
  void onAddCart(CartItem item) {
    _countGoodPresenter.addItem(item);
    setState(() {
      _isLoading = true;
    });
  }

  @override
  void onSaveCartItem() {
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
