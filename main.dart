import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool online = true;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    cekKoneksi();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://google.com'));
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
            ? WebViewWidget(controller: controller)
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
