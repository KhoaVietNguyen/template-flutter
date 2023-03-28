extension CurrencyFormatter on double {
  String toVNCurrency({String separator = ','}) {
    double price = this;

    bool negative = false;
    if (price < 0) {
      negative = true;
      price *= -1;
    }
    if (price < 1000) return price.toStringAsFixed(0);

    final money = price.toStringAsFixed(0);
    final bufMoney = StringBuffer('');
    final iM = [];
    int i = money.length - (money.length ~/ 3) * 3;
    while (i < money.length) {
      if (i != 0) {
        if (i - 3 > 0) {
          iM.add(money.substring(i - 3, i));
        } else {
          iM.add(money.substring(0, i));
        }
      }
      i += 3;
    }
    iM.add(money.substring(i - 3));
    bufMoney.writeAll(iM, separator);

    if (negative) return "-$bufMoney";
    return bufMoney.toString();
  }
}

extension StringCurrencyFormatter on String {
  String stringToVNCurrency({String separator = ','}) {
    final price = double.tryParse(this);
    if (price == null) return '';

    if (price < 1000) return price.toStringAsFixed(0);

    final money = price.toStringAsFixed(0);
    final bufMoney = StringBuffer('');
    final iM = [];
    int i = money.length - (money.length ~/ 3) * 3;
    while (i < money.length) {
      if (i != 0) {
        if (i - 3 > 0) {
          iM.add(money.substring(i - 3, i));
        } else {
          iM.add(money.substring(0, i));
        }
      }
      i += 3;
    }
    iM.add(money.substring(i - 3));
    bufMoney.writeAll(iM, separator);
    return bufMoney.toString();
  }
}
