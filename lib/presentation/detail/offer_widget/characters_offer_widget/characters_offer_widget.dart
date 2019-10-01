import 'package:flutter/material.dart';

class CharactersOfferWidget extends StatelessWidget {
  final Map _characters;

  CharactersOfferWidget(this._characters);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _getListCharacter(),
    );
  }

  List<Widget> _getListCharacter(){
    return _characters
        .entries
        .map((entry) => _getRowCharacter(entry.key, entry.value))
        .toList(growable: false);
  }

  Widget _getRowCharacter(String titleCharacter, String valueCharacter){
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              titleCharacter,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Text(valueCharacter),
          ),
        ],
      ),
    );
  }
}