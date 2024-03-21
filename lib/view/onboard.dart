import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../model/resources.dart';
import '../controller/constant.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    print(currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       Navigator.of(context).pushReplacementNamed('signin');
        //     },
        //     child: const Text(
        //       'Skip',
        //       style: TextStyle(
        //         fontWeight: FontWeight.w500,
        //         fontSize: 18,
        //         color: Colors.grey,
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     width: 2,
        //   ),
        // ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: CarouselSlider(
                  carouselController: carouselController,
                  items: viewPage
                      .map(
                        (e) => Column(
                      children: [
                        // const Spacer(),
                        Center(
                          child: Expanded(
                            flex: 2,
                            child: Transform.scale(
                              scale: 0.8,
                              child: Image.asset(
                                e['image'],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15 , left: 15),
                              child: Text(
                                e['Title'],
                                style: TextStyle(
                                    color: primarygreen,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                           flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5,left: 5),
                            child: Text(
                              e['desc'],
                              style:  TextStyle(
                                color: primarygreen,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    height: 800,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: currentPage,
                    enableInfiniteScroll: true,
                    reverse: false,
                    pauseAutoPlayOnManualNavigate: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                    const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (val, _) async {
                      setState(() {
                        currentPage = val;
                      });
                      if (currentPage == 2) {
                        await Future.delayed(
                          const Duration(seconds: 2),
                              () {
                            return Navigator.pushReplacementNamed(
                              context,
                              'signin',
                            );
                          },
                        );
                      }
                    },
                    scrollDirection: Axis.horizontal,
                  )),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 50,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: viewPage
                    .map(
                      (e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        carouselController.animateToPage(e,
                            duration: const Duration(seconds: 0),
                            curve: Curves.decelerate);
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor:
                      (currentPage == viewPage.indexOf(e))
                          ? themeBlue
                          : Colors.grey,
                      radius:
                      (currentPage == viewPage.indexOf(e)) ? 6 : 3,
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
