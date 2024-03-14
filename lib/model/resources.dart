import 'package:carousel_slider/carousel_controller.dart';

import 'package:flutter/material.dart';

int currentPage = 0;
CarouselController carouselController = CarouselController();
dynamic person;

List viewPage = [
  {
    'Title': "Join Our Team ",
    'image': 'assets/images/healthcare.png',
    'desc': "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",

  },
  {
    'Title': 'Medical Assistance',
    'image': 'assets/images/medical assistance.png',
    'desc': "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",

  },
  {
    'Title': 'Home care',
    'image': 'assets/images/homecare.png',
    'desc': "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
  },
];

class BezierClipper1 extends CustomClipper<Path>
{
  @override
  getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var offsetheight = height * .2;
    Path path = Path();
    path.moveTo(width , 50);
    path.lineTo(0, (height-offsetheight)* .8);
    path.quadraticBezierTo(height , height * .3 , height ,height * .0001);
    path.lineTo(width * .2, height );
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {

    return true;
  }
}