import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/domain/bloc/dialog/count_good_bloc.dart';
import 'package:catalog_app_bloc/domain/model/cart_item.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_component.dart';
import 'package:catalog_app_bloc/presentation/design/application_design.dart';

class CountGoodWidget extends StatefulWidget {
  final CartItem _cartItem;

  CountGoodWidget(this._cartItem);

  @override
  CountGoodWidgetState createState() => CountGoodWidgetState() ;
}

class CountGoodWidgetState extends State<CountGoodWidget> {

  final CountGoodBloc _countGoodBloc = CartModule.countGoodBloc();

  @override
  void initState() {
    _countGoodBloc.add(InitEvent(widget._cartItem));
    super.initState();
  }

  @override
  void dispose() {
    _countGoodBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountGoodBloc, CountGoodState>(
      bloc: _countGoodBloc,
      builder: (context, state) {
        if(state is LoadingCountGoodState) {
          return LoaderPage();
        }
        if(state is UpdateCountCountGoodState) {
          return _getDialogChooseCount(state.cartItem);
        }

        if(state is ApplyAddCartCountGoodState){
          return _getDialogFinishChooseItem();
        }

        if(state is ErrorCountGoodState) {
          return _getErrorFinishChooseItem();
        }

        return _getErrorFinishChooseItem();
      },
    );
  }

  Widget _getDialogChooseCount(CartItem cartItem){
    return PlatformAlertDialog(
      title: const Text('Choose quantity of goods'),
      content:  Table(
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              _getChooseCount(cartItem),
            ],
          ),
          TableRow(
            children: <Widget>[
              _getSummaryPrice(cartItem),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        _getButtonBack('Back'),
        _getButtonAction(
          'Add to Basket',
              () => _onAddCart(cartItem),
        ),
      ],
    );
  }

  Widget _getChooseCount(CartItem cartItem) {
    return Table(
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
                child: Icon(
                  Icons.add,
                ),
                onPressed: () => _onIncrement(cartItem),
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: Text('${cartItem.count}',
                ),
              ),
            ),
            Container(
              height: 50,
              child: RaisedButton(
                shape: CircleBorder(),
                child: Icon(
                  Icons.remove,
                ),
                onPressed: () => _onDecrement(cartItem),
              ),
            ),
          ],
        )
      ],
    );
  }

  _getSummaryPrice(CartItem cartItem) {
    return Table(
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
                    'Price:'
                ),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 5),
              child:  Center(
                child: Text(
                  MoneyHelper.formatMoney(cartItem.sum),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _getDialogFinishChooseItem(){
    return PlatformAlertDialog(
      title: Text(''),
      content: Container(
        height: 50,
        child: Center(
          child: const Text('Product successfully added'),
        ),
      ),
      actions: <Widget>[
        _getButtonBack('Continue shopping'),
      ],
    );
  }

  Widget _getButtonBack(String label, {handler}) {
    return  PlatformDialogAction(
      android: (_) => MaterialDialogActionData(),
      ios: (_) => CupertinoDialogActionData(),
      child: PlatformText(
        label,
      ),
      onPressed: handler ?? _onBack,
    );
  }

  Widget _getButtonAction(String label, Function handler) {
    return  PlatformDialogAction(
      android: (_) => MaterialDialogActionData(),
      ios: (_) => CupertinoDialogActionData(),
      child: PlatformText(
        label,
      ),
      onPressed: handler,
    );
  }

  Widget _getErrorFinishChooseItem () {
    return PlatformAlertDialog(
      title: Text('Error'),
      content: Container(
        height: 50,
        child: Center(
          child: Text('An unknown error has occurred'),
        ),
      ),
      actions: <Widget>[
        _getButtonBack('Back'),
      ],
    );
  }

  void _onAddCart(CartItem cartItem){
    _countGoodBloc.add(AddCartEvent());
  }

  void _onDecrement(CartItem cartItem) {
    if(cartItem.count == 1) return;
    _countGoodBloc.add(DecrementCountEvent());
  }

  void _onIncrement(CartItem cartItem) {
    _countGoodBloc.add(IncrementCountEvent());
  }

  void _onBack() {
    Navigator.pop(context);
  }
}
