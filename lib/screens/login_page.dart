
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_crypto/animation/fadeAnimation.dart';
import 'package:smart_crypto/custom_widgets/custom_welcomeTitle.dart';
import 'package:smart_crypto/routes/routeNames/route_names.dart';
import 'package:smart_crypto/utilities/colors/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,size: 20,color: black,)
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FadeAnimation(1, CustomTitle(text: 'Login')),
                      SizedBox(height: 20,),
                      FadeAnimation(1.2, Text('Login to your Account !',style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700
                      ),)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          FadeAnimation(1.2, makeInput(label: 'Email')),
                          FadeAnimation(1.3, makeInput(label: 'Password', obscureText: true))
                        ],
                      ),
                  ),
                  FadeAnimation(1.5, Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextButton(
                      onPressed: (){
                          Navigator.pushNamed(context, RouteName.home);
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        side: BorderSide(
                            color: primary
                        ),
                        backgroundColor: primary,
                      ),
                      child: Container(
                        height: 36,
                        alignment: Alignment.center,
                        child: Text('Login',style: TextStyle(
                            color: white,
                            fontSize: ScreenUtil().setSp(18)
                        ),),
                      ),
                    ),
                  )),
                  FadeAnimation(1.5, Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RouteName.signup);
                          },
                          child: Text('Sign Up',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: black
                          ),)
                      )
                    ],
                  ))
                ],
              ),
            ),
            FadeAnimation(1.2, Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.fill
                  )
                ),
              ),)
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: black
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400
              )
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.grey.shade400
                )
            ),
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}
