import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:catalog_app_bloc/domain/bloc/form_login/checkbox_bloc.dart';
import 'package:catalog_app_bloc/domain/bloc/form_login/login_form_bloc.dart';

class CheckboxWidget extends StatefulWidget {
  final LoginFormBloc _formBloc;

  CheckboxWidget(this._formBloc);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {

  @override
  Widget build(BuildContext context) {
    return _getBody(widget._formBloc);
  }

  Widget _getBody(LoginFormBloc formBloc){
    return BlocBuilder<CheckboxBloc, CheckboxState>(
      bloc: formBloc.checkboxBloc,
      builder:(context, checkboxState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: <Widget>[
              Spacer(flex: 1,),
              Checkbox(
                value: checkboxState.value,
                onChanged: (_) => _onUpdateBlocAgree(formBloc),
              ),
              Container(width:  20,),
              _getLabel(formBloc, checkboxState),
              Spacer(flex: 1,),
            ],
          ),
        );
      },
    );
  }

  Widget _getLabel(LoginFormBloc formBloc, CheckboxState checkboxState){
    if(formBloc.tryLogin && !checkboxState.value)
      return Text('I agree on everything', style: TextStyle(color: Colors.redAccent),);
    return Text('I agree on everything',);
  }

  void _onUpdateBlocAgree(LoginFormBloc formBloc) {
    formBloc.add(UpdateAgreeLoginFormEvent());
  }
}
