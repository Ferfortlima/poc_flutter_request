import 'package:flutter/material.dart';
import 'package:flutter_app_android/src/controller/services/album.dart';
import 'package:flutter_app_android/src/models/album.dart';
import 'package:flutter_app_android/src/view/widget/text_section.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextSection(snapshot.data.userId.toString()),
                      TextSection(snapshot.data.title),
                      TextSection(snapshot.data.id.toString())
                    ]);
                ;
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
