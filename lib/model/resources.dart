import 'package:carousel_slider/carousel_controller.dart';


import 'package:flutter/material.dart';

import 'Services.dart';
import 'navigation.dart';

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

const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
    // title: 'Home',
  ),
  TabItem(
    icon: Icons.search_sharp,
    title: 'Shop',
  ),
  TabItem(
    icon: Icons.favorite_border,
    title: 'Wishlist',
  ),
  TabItem(
    icon: Icons.shopping_cart_outlined,
    title: 'Cart',
  ),
  TabItem(
    icon: Icons.account_box,
    title: 'profile',
  ),
];


List allServices = [
  Services(Servicename : 'Lab test', image:'assets/images/PngItem.png', ServiceType:"Medical",time: "at 5am"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Hospital', image:'assets/images/hospital.jpeg', ServiceType:"Emergency",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 2pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 3am"),
  Services(Servicename : 'Lab test', image:'assets/images/PngItem.png', ServiceType:"Medical",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Hospital', image:'assets/images/hospital.jpeg', ServiceType:"Emergency",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/PngItem.png', ServiceType:"Medical",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Hospital', image:'assets/images/hospital.jpeg', ServiceType:"Emergency",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/PngItem.png', ServiceType:"Medical",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Hospital', image:'assets/images/hospital.jpeg', ServiceType:"Emergency",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),
  Services(Servicename : 'Lab test', image:'assets/images/doctor05.jpeg', ServiceType:"dadd",time: "at 4pm"),





];



