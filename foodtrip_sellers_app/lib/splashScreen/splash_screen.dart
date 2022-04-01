import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodtrip_sellers_app/authentication/auth_screen.dart';
import 'package:foodtrip_sellers_app/global/global.dart';
import 'package:foodtrip_sellers_app/mainScreens/home_screen.dart';



class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{
  startTimer()
  {
    Timer(const Duration(seconds: 4), () async
    {
      // if seller is already logged in or not
      if(firebaseAuth.currentUser != null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const HomeScreen()));
      }
      // if seller is not logged in already
      else
        {
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));
        }
    });
  }

  @override
  void initState() {

    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("images/splash.jpg"),
              ),

              const SizedBox(height: 10,),

              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Sell Food Online",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40,
                    fontFamily: "Signatra",
                    letterSpacing: 3,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
