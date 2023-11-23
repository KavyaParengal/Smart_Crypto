
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_crypto/custom_widgets/custom_welcomeTitle.dart';
import 'package:smart_crypto/routes/routeNames/route_names.dart';
import 'package:smart_crypto/utilities/colors/colors.dart';
import 'package:smart_crypto/utilities/constants/images.dart';
import 'package:smart_crypto/utilities/constants/welcome_page_items.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final _pageViewController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(45),
            child: InkWell(
              onTap: (){},
              child: Text(
                'Skip',style: TextStyle(
                color: primary,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(15)
              ),),
            ),
          )
        ],
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        itemBuilder: (context,index){
          return Column(
            children: [
              Image.asset(Items.welcomeData[index]['image']!,
                width: ScreenUtil().setWidth(406),
                height: ScreenUtil().setHeight(270),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )
                  ),
                  width: ScreenUtil().setWidth(375),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                              3,
                                (indicator)=>Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 3),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: indicator == index ? primary : Colors.grey
                                  ),
                                )
                             ),
                          ),
                        ),
                        CustomTitle(text: Items.welcomeData[index]['title']!),
                        const SizedBox(height: 11,),
                        Text(Items.welcomeData[index]['text']!,textAlign: TextAlign.center,style: TextStyle(
                          color: const Color(0xff485068),
                          fontSize: ScreenUtil().setSp(15),
                        ),),
                        const Spacer(),
                        TextButton(
                          onPressed: (){
                            if(index<2){
                              _pageViewController.animateToPage(index+1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            }
                            else{
                              Navigator.pushNamed(context, RouteName.login);
                            }
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              side: BorderSide(
                                  color: primary
                              ),
                              backgroundColor: index != 2 ? transparent : primary,
                          ),
                          child: Container(
                            height: 26,
                            width: ScreenUtil().setWidth(160),
                            alignment: Alignment.center,
                            child: Text(index != 2 ? 'Next Step' : 'Let\'s Get Started',style: TextStyle(
                                color: index !=2 ? primary : white,
                                fontSize: ScreenUtil().setSp(16)
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
        itemCount: 3,
      ),
    );
  }
}
