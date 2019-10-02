import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:catalog_app/domain/model/cart_item.dart';
import 'package:catalog_app/presentation/design/application_design.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem _cartItem;

  CartItemWidget(this._cartItem);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getPartCardCartItem(widget._cartItem),
        ),
      ),
    );
  }

  List <Widget> _getPartCardCartItem(CartItem cartItem) {
    return [
      _getImageItem(cartItem.image),
      _getTitleItem(cartItem.title),
      _getCountItem(cartItem.count),
      _getPriceItem(cartItem.sum),
      _getIconDelete(cartItem),
      ].map((content) => _getContainerPartCardCartItem(content) )
        .toList(growable: false);
  }

  Widget _getImageItem(String image) {
    return CachedNetworkImage(
      placeholder: (context, url) => LoaderPage(),
      imageUrl: image,
      height: 50,
    );
  }

  Widget _getTitleItem(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _getCountItem(int count) {
    return Text(
      CartItemHelper.formatCount(count),
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _getPriceItem(double price) {
    return Text(
      MoneyHelper.formatMoney(price),
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Widget _getContainerPartCardCartItem(Widget content) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: content,
      ),
    );
  }

  Widget _getIconDelete(CartItem cartItem) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () => onDeleteCartItem(cartItem),
      color: Colors.red,
    );
  }

  void onDeleteCartItem(CartItem cartItem) {
    showPlatformDialog(
      context: context,
      builder: (_) => DeleteCartItemWidget(cartItem),
    );
  }

  void onError(dynamic error) {
    ErrorDialogWidget.showErrorDialog(context);
  }
}