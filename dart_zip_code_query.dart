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
  final String zipCode;
  SearchZipCode(this.zipCode);

  final client = HttpClient();
  String url;

  Uri get _getUri => Uri.parse(url);

  ZipCodeModel convertData(Map<String, dynamic> json);

  Future<ZipCodeModel> search() async {
    final client = HttpClient();

    final request = await client.getUrl(_getUri);
    request.close();

    final response = await request.done;

    ZipCodeModel searchZipCodeModel;
    response.transform(utf8.decoder).listen((jsonEncoded) {
      // No arrive here =(
      searchZipCodeModel = convertData(json.decode(jsonEncoded));
    });

    return searchZipCodeModel;
  }
}

class ViaCep extends SearchZipCode {
  ViaCep(String zipCode) : super(zipCode);
  String get url => 'http://viacep.com.br/ws/$zipCode/json/';

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
  WsApiCep(String zipCode) : super(zipCode);
  String get url => 'https://ws.apicep.com/cep/$zipCode.json';

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
  final SearchZipCode viaCep = ViaCep(_zipCode);
  final SearchZipCode wsApiCep = WsApiCep(_zipCode);

  final zipCodeModel = await Future.any([
    viaCep.search(),
    wsApiCep.search(),
  ]);

  print(zipCodeModel.toJson);
}

void main() {
  final String _zipCode = _getInputFromConsole();
  makeMultipleQueries(_zipCode);
}
