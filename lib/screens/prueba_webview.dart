import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../config/constants.dart' as Constants;


class PruebaWebview extends StatefulWidget {
  final String csrfToken = sha1.convert(utf8.encode("login_")).toString();
  @override
  _PruebaWebviewState createState() => _PruebaWebviewState();
}

class _PruebaWebviewState extends State<PruebaWebview> {
  String clientId = Constants.CU_SANDBOX_CLIENT_ID;
  String redirectUri = Uri.encodeQueryComponent(Constants.CU_SANDBOX_URI);
  String urlInicial;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    urlInicial = "https://accounts.claveunica.gob.cl/openid/authorize/?client_id=$clientId&response_type=code&scope=openid run name&redirect_uri=$redirectUri&state=${widget.csrfToken}";

  }
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,        
        initialUrl: urlInicial,
        onWebViewCreated: (WebViewController c){
          _controller = c;
          _controller.loadUrl(urlInicial);
        },
        navigationDelegate: (NavigationRequest action) async{
          if(action.url.contains("http://saludaysen.cl/claveunica")){
            print(action.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}