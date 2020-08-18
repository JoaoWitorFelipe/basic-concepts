bool checkIfCharacterIsAlphaNumeric(any) => (any is String) || (any is int);

void main() {
  print(checkIfCharacterIsAlphaNumeric(""));
  print(checkIfCharacterIsAlphaNumeric(5));
  print(checkIfCharacterIsAlphaNumeric(2.6));
  print(checkIfCharacterIsAlphaNumeric(true));
}
