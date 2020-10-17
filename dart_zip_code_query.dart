import 'dart:io';
import 'dart:convert';

class ZipCodeModel {
  final String zipCode;
  final String neighborhood;
  final String street;
  final String state;
  final String city;

  ZipCodeModel.fromJson(Map<String, dynamic> json)
      : zipCode = json['zipCode'],
        neighborhood = json['neighborhood'],
        state = json['state'],
        city = json['city'],
        street = json['street'];

  Map<String, dynamic> get toJson => {
        "zipCode": zipCode,
        "neighborhood": neighborhood,
        "state": state,
        "city": city,
        "street": street,
      };
}

abstract class SearchZipCode {
  final client = HttpClient();
  String getUrl(String zipCode);

  ZipCodeModel convertData(Map<String, dynamic> json);

  Future<ZipCodeModel> search(String zipCode) async {
    final _uri = Uri.parse(getUrl(zipCode));
    final request = await client.getUrl(_uri);
    final response = await request.close();

    ZipCodeModel searchZipCodeModel;
    final responseTransformed = response.transform(utf8.decoder);
    return convertData(json.decode(await responseTransformed.first));
  }
}

class ViaCep extends SearchZipCode {
  String getUrl(String zipCode) => 'http://viacep.com.br/ws/$zipCode/json/';

  @override
  ZipCodeModel convertData(Map<String, dynamic> json) {
    return ZipCodeModel.fromJson({
      "zipCode": json['cep'],
      "neighborhood": json['bairro'],
      "city": json['localidade'],
      "state": json['uf'],
      "street": json['logradouro'],
    });
  }
}

class WsApiCep extends SearchZipCode {
  String getUrl(String zipCode) => 'https://ws.apicep.com/cep/$zipCode.json';

  @override
  ZipCodeModel convertData(Map<String, dynamic> json) {
    return ZipCodeModel.fromJson({
      "zipCode": json['code'],
      "neighborhood": json['district'],
      "city": json['city'],
      "state": json['state'],
      "street": json['address'],
    });
  }
}

String _getInputFromConsole() {
  print('Write your zip code: ');
  final String _input =
      stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
  return _input;
}

Future<ZipCodeModel> makeMultipleQueries(String _zipCode) async {
  final SearchZipCode viaCep = ViaCep();
  final SearchZipCode wsApiCep = WsApiCep();

  final zipCodeModel = await Future.any([
    viaCep.search(_zipCode),
    wsApiCep.search(_zipCode),
  ]);

  print(zipCodeModel.toJson);
}

void main() {
  final String _zipCode = _getInputFromConsole();
  makeMultipleQueries(_zipCode);
}
