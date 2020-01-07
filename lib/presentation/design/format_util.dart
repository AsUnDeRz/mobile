import 'package:flutter_money_formatter/flutter_money_formatter.dart';


class FormatUtil {
  static String formatStatistic(double count) {
    return FlutterMoneyFormatter(amount: count).output.compactNonSymbol;
  }
}
