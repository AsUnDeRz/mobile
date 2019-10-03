import 'package:catalog_app/domain/bloc/form_login/text_field_bloc.dart';
import 'package:flutter/material.dart';


class NameWidget extends StatelessWidget {

  final TextFieldBloc nameBloc;
  final String label;
  final String errorText;
  final TextEditingController controller;

  NameWidget(this.nameBloc,{label, errorText}):
        label = label ?? 'Имя',
        errorText = errorText ?? 'Пожалуйста, введите имя',
        controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (password) => _onUpdateBlocName(password, nameBloc),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: label,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }

  void _onUpdateBlocName(String name, TextFieldBloc nameBloc) {
    nameBloc.dispatch(TextFieldUpdateEvent(name));
  }
}