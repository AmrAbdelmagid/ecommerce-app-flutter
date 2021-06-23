import 'package:ecommmerce_app/screens/login_screen.dart';
import 'package:ecommmerce_app/shared/components/on_boarding_item.dart';
import 'package:ecommmerce_app/shared/helpers/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  final List<OnBoardingItem> onBoardingItems = [
    OnBoardingItem(
      image: 'assets/images/everything_1.jpg',
      title1: 'Comprehensive',
      title2: 'Find everything you need in one place',
    ),
    OnBoardingItem(
      image: 'assets/images/easy_2.jpg',
      title1: 'Easy',
      title2: 'Very easy to use',
    ),
    OnBoardingItem(
      image: 'assets/images/save_3.jpg',
      title1: 'Save',
      title2: 'Many offers for you every single day!',
    ),
  ];

  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    bool isLast = false;
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(onPressed: (){
          onBoardViewed(context);
        }, child: Text('SKIP'))
      ],),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageViewController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => onBoardingItems[index],
                itemCount: onBoardingItems.length,
                onPageChanged: (index) {
                  if (index == onBoardingItems.length - 1){
                    isLast = true;
                  }
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageViewController,
                  count: onBoardingItems.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10.0,
                    activeDotColor: Colors.deepOrange,
                    dotWidth: 10.0,
                    expansionFactor: 4,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast){
                      onBoardViewed(context);
                    }
                    pageViewController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: Icon(
                    Icons.arrow_forward,
                  ),
                  elevation: 0.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

onBoardViewed(BuildContext context){
  CacheHelper.saveData(key: 'OnBoarding', value: true);
  Navigator.pushReplacementNamed(context,LoginScreen.routeName);
}