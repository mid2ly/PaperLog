import 'package:http/http.dart' as http;

Future<http.Response> getPosts() async {
  return http.get(Uri.parse("http://localhost:8080/api/v1/posts"));
}
