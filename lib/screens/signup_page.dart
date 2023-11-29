
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/fadeAnimation.dart';
import '../custom_widgets/custom_welcomeTitle.dart';
import '../routes/routeNames/route_names.dart';
import '../utilities/colors/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FadeAnimation(1, CustomTitle(text: 'Sign Up')),
                      SizedBox(height: 20,),
                      FadeAnimation(1.2, Text('Create an account, It\'s free',style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700
                      ),)),
                    ],
                  ),
                  Column(
                    children: [
                      FadeAnimation(1.2, makeInput(label: 'Full Name')),
                      FadeAnimation(1.3, makeInput(label: 'Phone Number')),
                      FadeAnimation(1.4, makeInput(label: 'Email')),
                      FadeAnimation(1.5, makeInput(label: 'Password', obscureText: true)),
                      FadeAnimation(1.6, makeInput(label: 'Confirm Password', obscureText: true))
                    ],
                  ),
                  FadeAnimation(1.6, TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RouteName.login);
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
                      child: Text('Sign Up',style: TextStyle(
                          color: white,
                          fontSize: ScreenUtil().setSp(18)
                      ),),
                    ),
                  )),
                  FadeAnimation(1.6, Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RouteName.login);
                          },
                          child: Text('Login',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: black
                          ),)
                      )
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget makeInput({label, obscureText = false }) {
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
