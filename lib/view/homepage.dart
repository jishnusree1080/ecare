import 'dart:math';

import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../model/resources.dart';



const List<TabItem> items = [
  TabItem(
    icon: Icons.home,
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;
  int visit = 0;
  double height = 30;
  Color colorSelect = const Color(0XFF0686F8);
  Color color = const Color(0XFF7AC0FF);
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0XFF1752FE);


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return Scaffold(
      //backgroundColor: const Color(0xFF009EDC),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(child: CircleAvatar(child: Icon(Icons.chat),backgroundColor: Color(0xff25D366),),
        onPressed: (){Navigator.of(context).pushNamed('chatbot');},shape: CircleBorder(eccentricity: .4),backgroundColor: Color(0xff25D366),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchAnchor(
                viewElevation: 0.0,
                viewBackgroundColor: Colors.white,
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    hintText: "Search for Services",
                    hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.grey)),

                    elevation: const MaterialStatePropertyAll(.4),
                    backgroundColor: const MaterialStatePropertyAll(Color(0xffE0E0E0)),
                    shadowColor: const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 25.0),
                    ),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    //leading:
                     trailing:
                    <Widget>[
                      Tooltip(
                        message: 'Change brightness mode',
                        child: IconButton(
                          isSelected: isDark,
                          onPressed: () {
                            setState(() {
                              isDark = !isDark;
                            });
                          },
                          icon: const Icon(Icons.search),
                          //selectedIcon: const Icon(Icons.brightness_2_outlined),
                        ),
                     )
                    ],
                  );
                },
                suggestionsBuilder: (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 2, right: 8, left: 8),
              child: Container(
                height: MediaQuery.of(context).size.width ,
                width: MediaQuery.of(context).size.width,

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 12, bottom: 5),
                      child: Row(
                        children: [
                          const Text(
                            "Popular Services",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .01,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('viewScreen');
                            },
                            child: Text(
                              'View All ▶️',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.amber.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: allServices.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context).pushNamed('DetailPage', arguments: e);
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.10,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [

                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        e.image,
                                        semanticLabel: e.Servicename,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 6,
                                      left: 6,

                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.Servicename,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              e.ServiceType,
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 12, bottom: 5),
                      child: Row(
                        children: [
                          const Text(
                            "Recommended",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .01,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('viewScreen');
                            },
                            child: Text(
                              'View All ▶️',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.amber.shade500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: allServices.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15, left: 15, bottom: 5),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context).pushNamed('DetailPage', arguments: e);
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        e.image,
                                        semanticLabel: e.Servicename,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 6,
                                      left: 6,

                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.Servicename,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              e.ServiceType,
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 12, right: 8, left: 18),
              child: Text(
                "What you want?, All are here..",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .01,
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: allServices.map((e) {
                  return  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Stack(
                            clipBehavior: Clip.none,
                            children: [

                              Positioned(
                                top: 30,
                                // bottom: -50.w,
                                left: 0,
                                right: 0,
                                child: Container(
                                  constraints: const BoxConstraints(maxHeight: 110),
                                  padding:
                                  const EdgeInsets.only(top: 20, bottom: 0, left: 170),
                                  decoration: BoxDecoration(
                                      color:Colors.black.withOpacity(0.07),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(e.Servicename, style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                      ),),
                                      // ignore: prefer_const_constructors
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("desc"),
                                      const SizedBox(
                                        height: 0,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(e.ServiceType,style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade400,
                                          ),),
                                          CustomButton(label: 'View Profile', onPressed: () {}),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                color: Colors.black.withOpacity(0.01),
                                  elevation: 1,
                                  margin: const EdgeInsets.only(left: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  shadowColor: Colors.amber,
                                  child: Container(
                                    height: 130,
                                    width: 120,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.black.withOpacity(0.02), // Adjust opacity as needed
                                        backgroundBlendMode: BlendMode.colorBurn,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        e.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )


                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            // Your other widgets...
          ],
        ),
      ),

    );
  }
}



class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(

            color: Colors.black.withOpacity(.4),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}