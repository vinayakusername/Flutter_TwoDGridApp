import 'dart:async';
import 'package:flutter/material.dart';
import 'package:two_d_grid_app/app_widgets/row_column_form_widget.dart';


class SplashScreen extends StatefulWidget 
{
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer
    (
      //Duration(minutes:1,seconds:3),
      Duration(seconds: 5),
      ()=>Navigator.pushReplacement
                    (
                      context, 
                      MaterialPageRoute
                      (
                        builder:(context)=>RowColFormPage()
                      )
                    ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Container
      (
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration
        (
          gradient:LinearGradient
          (
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: 
            [
              Color(0xFFFF800B),
              Color(0xFFCE1010)
            ]
         ),
        ),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: 
          [
            Column
            (
              children: 
              [
                Image.asset
                (
                  'images/mobigic_tech_logo.png',
                  height: 150.0,
                  width: 150.0,
                ),
                SizedBox(height: 8.0,),
                Text
                (
                  '2D Grid App for Mobigic Technolgoies',
                  textAlign:TextAlign.center,
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                )
              ],
            ),
            CircularProgressIndicator
            (
               valueColor:AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),

    );
  }
}

