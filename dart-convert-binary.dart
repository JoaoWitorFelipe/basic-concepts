String convertDecimalToBinary(int n) => (n ~/ 2 > 2)
    ? generateBinary(convertDecimalToBinary(n ~/ 2), '${n % 2}')
    : generateBinary('${n ~/ 2}', '${n % 2}');

String generateBinary(String n, String preBinary) => '$preBinary' '$n';

String reverseString(String text) =>
    String.fromCharCodes(text.codeUnits.reversed);

void main() {
  //TODO: change functions names
  //TODO: fix bug case pass parameter 10, 11...
  print(reverseString(convertDecimalToBinary(25)));
}
