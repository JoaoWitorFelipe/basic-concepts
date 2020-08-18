String convertDecimalToBinary(int n) => (n ~/ 2 >= 2)
    ? buildBinaryInString(convertDecimalToBinary(n ~/ 2), '${n % 2}')
    : buildBinaryInString('${n ~/ 2}', '${n % 2}');

String buildBinaryInString(String n, String preBinary) => '$preBinary' '$n';

String reverseString(String text) =>
    String.fromCharCodes(text.codeUnits.reversed);

void main() {
  print(reverseString(convertDecimalToBinary(4)));
}
