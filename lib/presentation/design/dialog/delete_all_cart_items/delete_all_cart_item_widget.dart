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
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _deleteAllCartItemsBloc,
      child: BlocBuilder<DeleteAllCartItemsBloc, DeleteAllCartItemsState>(
        builder: (context, state) {
          if(state is InitState) {
            return _getDialogAcceptDeleteAllItems();
          }
          
          if(state is ApplyClearState){
            return _getDialogSuccessDeleteAllItems();
          }

          if(state is ErrorState) {
            return _getDialogErrorDeleteAllItems();
          }

          return _getDialogErrorDeleteAllItems();
        },
      ),
    );
  }

  Widget _getDialogAcceptDeleteAllItems() {
    return PlatformAlertDialog(
      title: Text('Подвердите удаление всех товаро из корзины'),
      actions: <Widget>[
        _getButtonBack('Назад'),
        _getButtonDelete('Удалить всё', onDeleteAllCartItems),
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
            'Товары успешно удалены',
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
          onPressed:_onBack,
        ),
      ],
    );
  }

  Widget _getDialogErrorDeleteAllItems () {
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

  void _onBack() {
    Navigator.pop(context);
  }

  void onDeleteAllCartItems() {
    _deleteAllCartItemsBloc.dispatch(ClearEvent());
  }

  void onError() {
    ErrorDialogWidget.showErrorDialog(context);
  }
}
