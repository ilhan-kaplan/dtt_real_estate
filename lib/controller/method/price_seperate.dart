String priceSeperate(String price) {
  String newPrice = '';
  var value = price.split('');
  int number = value.length;

  for (int i = 0; i < number; i++) {
    if ((number - (i + 1)) % 3 == 0) {
      if (i == number - 1) {
        newPrice += value[i];
      } else {
        newPrice += '${value[i]}.';
      }
    } else {
      newPrice += value[i];
    }
  }

  return newPrice;
}
