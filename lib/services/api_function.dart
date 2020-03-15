import 'package:http/http.dart' as http;

const baseUrl = 'https://rk-eu.10it.lk/richkids/wp-json/';

Future<String> getToken(username, password) async {
  var url = baseUrl + "jwt-auth/v1/token";
  http.Response response = await http.post(url, body: {
    "username": username,
    "password": password,
  });
  return response.body;
}
