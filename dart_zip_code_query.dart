import 'dart:io';
import 'dart:convert';

Uri _getUrlFromViaCep(String zipCode) => Uri.parse('http://viacep.com.br/ws/$zipCode/json/');

void _searchDataFromZipCode(String _zipCode){
    final client = HttpClient();
    client.getUrl(_getUrlFromViaCep(_zipCode))
	.then((HttpClientRequest request) {
	   return request.close();
	})
        .then((HttpClientResponse response) {
	   response.transform(utf8.decoder).listen((contents) {
		print(contents);
	   });
	});
}


String _getInputFromConsole() {
    print('Write your zip code: ');
    final String _input = stdin.readLineSync(encoding: Encoding.getByName('utf-8'));
   return _input;
}



void main() {
   final String _zipCode = _getInputFromConsole();
   _searchDataFromZipCode(_zipCode);
}





