import 'package:catalog_app_bloc/domain/bloc/dialog/delete_all_cart_item_bloc.dart';
import 'package:catalog_app_bloc/internal/dependencies/application_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_app_bloc/presentation/design/application_design.dart';

class DeleteAllCartItemsWidget extends StatefulWidget {

  @override
  _DeleteAllCartItemsWidgetState createState() => _DeleteAllCartItemsWidgetState();
}

class _DeleteAllCartItemsWidgetState extends State<DeleteAllCartItemsWidget> {
  final DeleteAllCartItemsBloc _deleteAllCartItemsBloc = CartModule.deleteAllCartItemsBloc();

  @override
  void dispose() {
    _deleteAllCartItemsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteAllCartItemsBloc, DeleteAllCartItemsState>(
      bloc: _deleteAllCartItemsBloc,
      builder: (context, state) {
        if(state is InitDeleteAllCartItemsState) {
          return _getDialogAcceptDeleteAllItems();
        }

        if(state is ApplyClearDeleteAllCartItemsState){
          return _getDialogSuccessDeleteAllItems();
        }

        if(state is ErrorDeleteAllCartItemsState) {
          return _getDialogErrorDeleteAllItems();
        }

        return _getDialogErrorDeleteAllItems();
      },
    );
  }

  Widget _getDialogAcceptDeleteAllItems() {
    return PlatformAlertDialog(
      title: Text('Confirm removal of all items from the basket'),
      actions: <Widget>[
        _getButtonBack('Back'),
        _getButtonDelete('Delete everything', onDeleteAllCartItems),
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
      onPressed:_onBack,
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
            'Items successfully deleted',
          ),
        ),
      ),
      actions: <Widget>[
        PlatformDialogAction(
          android: (_) => MaterialDialogActionData(),
          ios: (_) => CupertinoDialogActionData(),
          child: PlatformText(
            'Continue shopping',
          ),
          onPressed:_onBack,
        ),
      ],
    );
  }

  Widget _getDialogErrorDeleteAllItems () {
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

  void _onBack() {
    Navigator.pop(context);
  }

  void onDeleteAllCartItems() {
    _deleteAllCartItemsBloc.add(ClearDeleteAllCartItemsEvent());
  }

  void onError() {
    ErrorDialogWidget.showErrorDialog(context);
  }
}
