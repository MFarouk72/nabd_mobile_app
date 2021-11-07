// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:nabd_mobile_app/WebViewPage/WebViewPage.dart';
import 'package:nabd_mobile_app/utilites/AppAssets.dart';
import 'package:nabd_mobile_app/utilites/size_config.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WebViewScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: SizeConfig.blockSizeVertical * 100,
        width: SizeConfig.blockSizeHorizontal * 100,
        child: Image.asset(
          AppAssets.logo,
        ),
      ) ,

    );
  }
}

