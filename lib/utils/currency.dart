import 'package:intl/intl.dart';
import 'package:universal_io/io.dart';

String getCurrency() {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: "NGN");
  return format.currencySymbol;
}
