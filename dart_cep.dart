import 'dart:io';
import 'dart:convert';

String getZipCodeFromConsole(){
    print('Enter cep:');
    return sanitizeZipCode(stdin.readLineSync());
}

String sanitizeZipCode(String zipCode){
    return zipCode.replaceAll(RegExp(r'[^0-9]'), '');
}

fetchDataFromZipCode(String zipCode){
   final HttpClient client = HttpClient();
   final Uri uri = Uri.parse("https://viacep.com.br/ws/$zipCode/json");
   client.getUrl(uri)
	.then((HttpClientRequest request) {
	   return request.close();
	})
	.then((HttpClientResponse response) {
	   response.transform(utf8.decoder).listen((contents) {
	      print(contents);
	   });
	});
}

void main(){
    fetchDataFromZipCode(getZipCodeFromConsole());
}



