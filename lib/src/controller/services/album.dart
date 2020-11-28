import 'package:flutter_app_android/src/controller/api/album.dart';
import 'package:flutter_app_android/src/models/album.dart';
import 'dart:async';
import 'dart:convert';

Future<Album> getAlbum() async {
  final response = await fetchAlbum();

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}