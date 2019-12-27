import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _handleTap() {}

  final colorBarAction = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    Widget titleProduct = Container(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 10.0, left: 16.0, right: 12.0),
        child: Row(
          children: [
            Text('Платье',
                style: TextStyle(
                  fontSize: 24,
                )),
          ],
        ));
    Widget priceProduct = Container(
        padding: const EdgeInsets.only(
            top: 0, bottom: 16.0, left: 16.0, right: 12.0),
        child: Row(
          children: [
            Text('451 ₽',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
          ],
        ));

    Widget addresProduct = Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 0, left: 16.0, right: 0),
        child: Wrap(
          children: [
            Text(
              'р-н Центральный \nТверь, Московский р-н',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                iconSize: 14.0,
                onPressed: _handleTap,
                color: Colors.grey[500])
          ],
        ));

    Widget charactersProduct = Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 0, left: 16.0, right: 32),
        child: Wrap(
//          verticalDirection: WrapAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(children: <Widget>[
                Text('Категория',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                Spacer(),
                Text('Одежда, обувь, аксессуары'),
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(children: <Widget>[
                Text('Вид одежды',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                Spacer(),
                Text('Женская одежда')
              ]),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Row(children: <Widget>[
                Text('Предмет одежды',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                Spacer(),
                Text('Платья и юбки')
              ]),
            ),
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: Row(children: <Widget>[
                  Text('Размер',
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                  Spacer(),
                  Text('44-46 (М)')
                ])),
          ],
        ));

    Widget labelProduct = Container(
      padding:
          const EdgeInsets.only(top: 10, bottom: 32, left: 16.0, right: 32),
      child: Row(
        children: <Widget>[
          Text('Платье',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
    Widget sellerProduct = Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(32),
        child: Row(children: <Widget>[
          Expanded(
              flex: 6,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Ангелина',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Частное лицо'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('31 объявление'),
                    ],
                  ),
                ],
              )),
          Expanded(
            flex: 2,
            child: Image.asset(
              'images/seller.png',
//                fit: BoxFit.cover,
            ),
          )
        ]));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Funny Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Описание',
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.favorite_border),
              tooltip: 'favorite',
              color: colorBarAction,
              onPressed: _handleTap,
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'more',
              color: colorBarAction,
              onPressed: _handleTap,
            ),
          ],
        ),
        body: ListView(
          children: [
            titleProduct,
            priceProduct,
            addresProduct,
            charactersProduct,
            labelProduct,
            sellerProduct,
          ],
        ),
      ),
    );
  }
}
