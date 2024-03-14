import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Icon(Icons.home,color: Colors.blue,size: 20,),
        title: Icon(Icons.settings),
        
      ),
    );
  }
}
