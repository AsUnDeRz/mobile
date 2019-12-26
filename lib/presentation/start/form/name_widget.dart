import 'package:flutter/material.dart';

import 'package:catalog_app_bloc/domain/bloc/form_login/text_field_bloc.dart';

class NameWidget extends StatefulWidget {

  final TextFieldBloc nameBloc;
  final String label;
  final String errorText;

  NameWidget(this.nameBloc,{label, errorText}):
        label = label ?? 'Имя',
        errorText = errorText ?? 'Пожалуйста, введите имя';

  @override
  _NameWidgetState createState() => _NameWidgetState();
}

class _NameWidgetState extends State<NameWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: TextFormField(
        controller: controller,
        focusNode: widget.nameBloc.focusNode,
        onChanged: (password) => _onUpdateBlocName(password, widget.nameBloc),
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

  void _onUpdateBlocName(String name, TextFieldBloc nameBloc) {
    nameBloc.add(TextFieldUpdateEvent(name));
  }
}