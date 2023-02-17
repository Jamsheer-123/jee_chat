import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jee_chat/infastructure/constand/utils/index.dart';

class WelcomeViewScreen extends StatelessWidget {
  WelcomeViewScreen({super.key});
  final ValueNotifier<int> postionNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            onPageChanged: (value) {
              postionNotifier.value = value;
            },
            controller: PageController(
                initialPage: 0, keepPage: false, viewportFraction: 1),
            pageSnapping: true,
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(AppImages.sinupimage))),
              ),
              Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(AppImages.welcomePage2))),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(AppImages.welcomePage3))),
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Positioned(
                      bottom: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "sinup");
                            // GoogleSignIn().signIn();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.backgroundColor,
                            backgroundColor: AppColors.white,
                          ),
                          child: const Text("Start Login")))
                ]),
              )
            ],
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 30),
              child: ValueListenableBuilder(
                valueListenable: postionNotifier,
                builder: (context, position, child) {
                  return DotsIndicator(
                      dotsCount: 3,
                      position: position.toDouble(),
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      reversed: false,
                      decorator: DotsDecorator(
                          activeSize: const Size(18.0, 9.8),
                          size: const Size.square(9),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))));
                },
              ))
        ],
      ),
    ));
  }
}
