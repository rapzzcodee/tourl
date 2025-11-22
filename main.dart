import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool online = true;

  @override
  void initState() {
    super.initState();
    cekKoneksi();
  }

  Future<void> cekKoneksi() async {
    final status = await Connectivity().checkConnectivity();
    setState(() {
      online = status != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: online
            ? WebView(
                initialUrl: 'https://google.com',
                javascriptMode: JavascriptMode.unrestricted,
              )
            : Center(
                child: Text(
                  "Maaf, butuh koneksi internet.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
    );
  }
}
