import 'package:flutter/material.dart';

import 'package:catalog_app/presentation/catalog/catalog_screen.dart';

class RouteCatalogWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Catalog"),
      trailing:  Icon(Icons.blur_on),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatalogScreen(),
          ),
        );
      },
    );
  }
}