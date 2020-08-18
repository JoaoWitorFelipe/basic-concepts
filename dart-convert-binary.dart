String convertDecimalToBinary(int n) => (n ~/ 2 >= 2)
    ? generateBinary(convertDecimalToBinary(n ~/ 2), '${n % 2}')
    : generateBinary('${n ~/ 2}', '${n % 2}');

String generateBinary(String n, String preBinary) => '$preBinary' '$n';

String reverseString(String text) =>
    String.fromCharCodes(text.codeUnits.reversed);

void main() {
  //TODO: change functions names
  print(reverseString(convertDecimalToBinary(3)));
}
