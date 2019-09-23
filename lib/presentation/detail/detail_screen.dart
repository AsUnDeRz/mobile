import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/detail/offer_widgets/offer_widgets.dart';
import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/cart_action/cart_action_widget.dart';
import 'package:catalog_app/domain/model/offer.dart';
import 'package:catalog_app/presentation/detail/seller_widget/seller_widget.dart';
import 'package:catalog_app/presentation/detail/offer_widgets/gallery_offer_widget/gallery_offer_widget.dart';

import 'detail_presenter.dart';
import 'detail_view.dart';


class DetailScreen extends StatefulWidget {
  final Offer _offer;

  DetailScreen(this._offer);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> implements DetailView{

  DetailPresenter _detailPresenter;

  _DetailScreenState() {
    _detailPresenter = DetailPresenter(this);
  }

  Offer get offer => widget._offer;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  Widget _getAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
        'Описание',
          style: TextStyle (
            color: Colors.black
          ),
      ),
      centerTitle: true,
      actions: <Widget>[
        CartActionWidget(),
      ]
    );
  }

  Widget _getBody() {
    if(offer == null){
      return LoaderPage();
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: _getContent(offer),
      );
    }
  }

  Widget _getContent(Offer offer){
    List<Widget> listBlocks= [
      HeaderOfferWidget(offer),
      GalleryOfferWidget(offer.gallery),
      DescriptionOfferWidget(offer.description),
      CharactersOfferWidget(offer.characters),
      CategoryOfferWidget(offer.category),
      SellerWidget(offer.seller),
    ];
    return  ListView.builder(
      itemCount: listBlocks.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 16.0,
          ),
          child: listBlocks[index],
        );
      },
    );
  }

  @override
  void onError(dynamic error) {
    ErrorDialogWidget.showErrorDialog(context);
  }
}
