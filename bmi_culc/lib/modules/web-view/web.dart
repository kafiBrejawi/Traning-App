import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webscreeen extends StatelessWidget {
  final String url;

  webscreeen(this.url);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(),
                  body: WebView(
                    initialUrl: url,
                  ),
                )));
  }
}
