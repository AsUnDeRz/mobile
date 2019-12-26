import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/domain/bloc/form_login/password_field_bloc.dart';

class PasswordWidget extends StatefulWidget{

  final PasswordFieldBloc passwordBloc;
  final String label;
  final String errorText;

  PasswordWidget(this.passwordBloc, {label, errorText}):
        label = label ?? 'Пароль',
        errorText = errorText ?? 'Пожалуйста, введите пароль';

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: TextFormField(
        obscureText: true,
        controller: controller,
        focusNode: widget.passwordBloc.focusNode,
        onChanged: (password) => _onUpdateBlocPassword(password, widget.passwordBloc),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.label,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return widget.errorText;
          }
          return null;
        },
      ),
    );
  }

  void _onUpdateBlocPassword(String password, PasswordFieldBloc passwordBloc) {
    passwordBloc.add(PasswordFieldUpdateEvent(password));
  }
}