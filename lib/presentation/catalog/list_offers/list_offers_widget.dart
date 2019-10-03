import 'package:catalog_app/domain/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app/presentation/design/application_design.dart';
import 'package:catalog_app/presentation/design/loader_view.dart';
import 'package:catalog_app/presentation/catalog/list_offers/card_offer/card_offer_widget.dart';
import 'package:catalog_app/internal/dependencies/offer_module.dart';

class ListOffersWidget extends StatefulWidget {
  @override
  _ListOffersWidgetState createState() => _ListOffersWidgetState();
}

class _ListOffersWidgetState extends State<ListOffersWidget> {
  final _catalogBloc = OfferModule.catalogBloc();

  @override
  void initState() {
    super.initState();
    _catalogBloc.dispatch(RefreshEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _catalogBloc,
      child: BlocListener<CatalogBloc, CatalogState>(
        listener: (context, state) {
          if (state is ErrorState) {
            _showErrorDialog(state.error);
          }
        },
        child: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            if (state is ReadyState) {
              return _getList(state.listOffers);
            }
            else {
              return LoaderPage();
            }
          },
        ),
      ),
    );
  }

  Widget _getList(listOffers) {
    return ListView(
      padding:  EdgeInsets.all(5),
      children: [
        ...listOffers.map((offer) => CardOfferWidget(offer))
      ],
    );
  }

  void _showErrorDialog(dynamic error) {
    return ErrorDialogWidget.showErrorDialog(
      context,
      error: error,
      handlerButton: () => _catalogBloc.dispatch(RefreshEvent(),
      ), //onRefreshCatalog
    );
  }
}