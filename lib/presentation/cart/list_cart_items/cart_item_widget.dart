import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:catalog_app_bloc/domain/model/cart_item.dart';
import 'package:catalog_app_bloc/presentation/design/application_design.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  CartItemWidget(this.cartItem);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: _getImageItem(widget.cartItem.image),
          ),
          Expanded(
            flex: 2,
            child: _getTitleItem(widget.cartItem.title),
          ),
          Expanded(
            flex: 2,
            child: _getCountItem(widget.cartItem.count),
          ),
          Expanded(
            flex: 4,
            child: _getPriceItem(widget.cartItem.sum),
          ),
          Expanded(
            flex: 2,
            child: _getIconDelete(widget.cartItem),
          ),
        ],
      ),
    );
  }


  Widget _getImageItem(String image) {
    return AspectRatio(
      aspectRatio: 4/3.5,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CachedNetworkImage(
          placeholder: (context, url) => LoaderPage(),
          imageUrl: image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _getTitleItem(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getCountItem(int count) {
    return Text(
      CartItemHelper.formatCount(count),
      style: TextStyle(
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _getPriceItem(double price) {
    return Text(
      MoneyHelper.formatMoney(price),
      style: TextStyle(
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
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