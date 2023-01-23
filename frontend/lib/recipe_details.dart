import 'dart:io';
import './color.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RecipeDetails extends StatefulWidget {
  final String url;

  RecipeDetails({Key key, @required this.url}) : super(key: key);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe View", style: TextStyle(fontFamily: 'Abel', fontSize: 25, color: mainColor)), elevation: 1,backgroundColor: Colors.amber,
        foregroundColor: Colors.black,),
      body: WebView(
        initialUrl: widget.url,
      )
    );
  }
}
