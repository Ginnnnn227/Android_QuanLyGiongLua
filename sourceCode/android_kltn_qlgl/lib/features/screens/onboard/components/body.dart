import 'package:android_kltn_qlgl/constants/colors.const.dart';
import 'package:android_kltn_qlgl/constants/other.const.dart';
import 'package:android_kltn_qlgl/constants/size_configs.const.dart';
import 'package:android_kltn_qlgl/features/screens/login/signin.screen.dart';
import 'package:android_kltn_qlgl/features/screens/onboard/components/content.dart';
import 'package:flutter/material.dart';

class BodyOnBoard extends StatefulWidget {
  const BodyOnBoard({super.key});

  @override
  State<BodyOnBoard> createState() => _BodyOnBoardState();
}

class _BodyOnBoardState extends State<BodyOnBoard> {
  int currentpage = 0;
  List<Map<String, String>> contentData = [
    {"text": "Welcome to My App 01", "image": "assets/images/onboard01.jpg"},
    {"text": "Welcome to My App 02", "image": "assets/images/onboard02.jpg"},
    {"text": "Welcome to My App 03", "image": "assets/images/onboard03.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentpage = value;
                  });
                },
                itemCount: contentData.length,
                itemBuilder: (context, index) => OnboardContent(
                  text: contentData[index]['text'].toString(),
                  image: contentData[index]["image"].toString(),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          contentData.length, (index) => buildDot(index)),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.of(context).pushNamed(LoginPage.routename);
                          Navigator.pushNamed(context, LoginPage.routename);
                        }, 
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(kPrimaryColor),
                        ),
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(20),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentpage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentpage == index ? kPrimaryColor : const Color(0xffd8d8d8),
        borderRadius: BorderRadius.circular(3),
      ),
      duration: kAnimationDuration,
    );
  }
}
