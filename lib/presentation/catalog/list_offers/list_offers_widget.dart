import 'package:catalog_app_bloc/domain/bloc/catalog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/presentation/design/application_design.dart';
import 'package:catalog_app_bloc/presentation/design/loader_view.dart';
import 'package:catalog_app_bloc/presentation/catalog/list_offers/card_offer/card_offer_widget.dart';
import 'package:catalog_app_bloc/internal/dependencies/offer_module.dart';

class ListOffersWidget extends StatefulWidget {
  @override
  _ListOffersWidgetState createState() => _ListOffersWidgetState();
}

class _ListOffersWidgetState extends State<ListOffersWidget> {
  final CatalogBloc _catalogBloc = OfferModule.catalogBloc();

  @override
  void initState() {
    super.initState();
    _catalogBloc.add(RefreshCatalogEvent());
  }

  @override
  void dispose() {
    _catalogBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatalogBloc, CatalogState>(
      bloc: _catalogBloc,
      listener: (context, state) {
        if (state is ErrorCatalogState) {
          _showErrorDialog(state.error);
        }
      },
      child: BlocBuilder<CatalogBloc, CatalogState>(
        bloc: _catalogBloc,
        builder: (context, state) {
          if (state is ReadyCatalogState) {
            return _getList(state.listOffers);
          }
          else {
            return LoaderPage();
          }
        },
      ),
    );
  }

  Widget _getList(listOffers) {
    return ListView(
      padding:  EdgeInsets.all(5),
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      children: [
        ...listOffers.map((offer) => CardOfferWidget(offer))
      ],
    );
  }

  void _showErrorDialog(dynamic error) {
    return ErrorDialogWidget.showErrorDialog(
      context,
      error: error,
      handlerButton: () => _catalogBloc.add(RefreshCatalogEvent(),
      ), //onRefreshCatalog
    );
  }
}