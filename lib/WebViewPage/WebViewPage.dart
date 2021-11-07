// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:nabd_mobile_app/utilites/size_config.dart';

class WebViewScreen extends StatefulWidget {

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  bool isLoading = true;
  String url ='https://survey.wowdesk.com/?r=survey/index&sid=361552&devId=devId';
  // String url = 'https://flutter.dev';
  String finishedUrl = 'https://survey.wowdesk.com/?r=survey/index&sid=361552';
  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme:const IconThemeData(
          color: Colors.black,
        ),
        toolbarHeight: SizeConfig.safeBlockVertical * 8,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
        'Survey',
          style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.titleFontSize,
          ),
        ),
      ),
      body:Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.padding/2),
            child: WebView(
              key: _key,
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (url) {
                if(url.toLowerCase() == finishedUrl){
                  Future.delayed(const Duration(seconds: 20),(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WebViewScreen()));
                  });
                }
                setState(() {
                  isLoading = false;
                });
              }
            ),
          ),
          isLoading ? const Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
