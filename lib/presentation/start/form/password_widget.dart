import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/domain/bloc/form_login/password_field_bloc.dart';

class PasswordWidget extends StatelessWidget{

  final PasswordFieldBloc passwordBloc;
  final String label;
  final String errorText;
  final TextEditingController controller;

  PasswordWidget(this.passwordBloc, {label, errorText}):
        label = label ?? 'Пароль',
        errorText = errorText ?? 'Пожалуйста, введите пароль',
        controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      onChanged: (password) => _onUpdateBlocPassword(password, passwordBloc),
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

  void _onUpdateBlocPassword(String password, PasswordFieldBloc passwordBloc) {
    passwordBloc.add(PasswordFieldUpdateEvent(password));
  }
}