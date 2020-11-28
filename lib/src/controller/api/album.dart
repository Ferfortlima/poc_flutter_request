import 'package:http/http.dart' as http;
import 'dart:async';

Future<http.Response> fetchAlbum() async {
  return await http.get('https://jsonplaceholder.typicode.com/albums/1');
}