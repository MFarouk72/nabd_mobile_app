// ignore_for_file: file_names
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:nabd_mobile_app/utilites/size_config.dart';
import 'package:device_info/device_info.dart';

class WebViewScreen extends StatefulWidget {

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  String? deviceId;
  bool isLoading = true;
  String url= 'https://survey.wowdesk.com/?r=survey/index&sid=361552&devId=f5d4b025e2e20a91';
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
                // if(url.toLowerCase() == finishedUrl){
                //   Future.delayed(const Duration(seconds: 20),(){
                //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WebViewScreen()));
                //   });
                // }
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
  getDeviceInfo() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceId = androidInfo.androidId;
        url = 'https://survey.wowdesk.com/?r=survey/index&sid=361552&devId=$deviceId';
        print(url);
      });

    }
    else if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceId = iosInfo.identifierForVendor;
        url = 'https://survey.wowdesk.com/?r=survey/index&sid=361552&devId=$deviceId';
        print(url);
      });
    }
  }
  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
