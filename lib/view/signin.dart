import 'package:ecare/controller/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/media/sound.dart';
import '../model/resources.dart';
class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final  SoundService sound= SoundService();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  bool Checkvalue = false;

  // double getSmallDiameter(BuildContext context) =>
  //     MediaQuery.of(context).size.width * 2 / 3;
  // double getBiglDiameter(BuildContext context) =>
  //     MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF009EDC),
      body: Stack(
        children: <Widget>[

          Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: <Widget>[
               Container(
                 margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                 padding: const EdgeInsets.fromLTRB(10, 0, 10,0),
                 child: Center(
                   child: Text("Sign In",style: TextStyle( fontWeight: FontWeight.w700,color: Colors.white,fontSize: 28,letterSpacing:.03),),
                 ),

               ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children:  <Widget>[
                      TextField(
                        controller: emailEditingController,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Color(0xFF001347),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey.shade100 )),
                            labelText: "Email",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                      ),
                      TextField(
                        controller: passwordEditingController,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.vpn_key,
                              color: Color(0xFF001347),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                            labelText: "Password",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),

                      )
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: const Text(
                          "FORGOT PASSWORD?",
                          style:
                          TextStyle(color: Colors.white, fontSize: 11),
                        ))),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Row(
                          children: [
                            Checkbox(checkColor: Colors.white,hoverColor: Colors.white,
                              activeColor: Colors.white,
                              side: BorderSide(color: Colors.white),
                              value: this.Checkvalue, onChanged: ( value){


                              },
                            ),

                            const Text(
                              "REMEMBER ME",
                              style:
                              TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ))),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: MaterialButton(
                          elevation: 0,
                          shape: LinearBorder(start: LinearBorderEdge(size: .1),top:  LinearBorderEdge(size: .9)),

                          //borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          // child: InkWell(
                          //   borderRadius: BorderRadius.circular(20),
                            //splashColor: const Color(0xFF1200FF),
                            onPressed: () {
                              sound.playSound();
                              Navigator.pushReplacementNamed(context, 'home');
                             // SignInCheck(emailEditingController.value.text,passwordEditingController.value.text,context);
                            },
                            child: const Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                                                 //   ),
                        ),
                      ),
                      // FloatingActionButton(
                      //   onPressed: () {},
                      //   mini: true,
                      //   elevation: 0,
                      //   child: const Image(
                      //     image: AssetImage("assets/facebook2.png"),
                      //   ),
                      // ),
                      // FloatingActionButton(
                      //   onPressed: () {},
                      //   mini: true,
                      //   elevation: 0,
                      //   child: const Image(
                      //     image: AssetImage("assets/twitter.png"),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(width: MediaQuery.sizeOf(context).width/4,
                      height: 3,
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                    const SizedBox(width: 5,),
                    const Text("OR",style: TextStyle(color: Colors.white),),
                    const SizedBox(width: 5,),
                    Container(width: MediaQuery.sizeOf(context).width/4,
                      height: 3,
                      decoration: const BoxDecoration(color: Colors.white),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: FloatingActionButton(
                          onPressed: () {},
                          shape: CircleBorder(eccentricity: .1),
                          backgroundColor: Colors.white,
                          mini: true,
                          elevation: 0,
                          child: const Image(
                            image: AssetImage("assets/images/pngwing.png"),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: FloatingActionButton(
                          shape: CircleBorder(eccentricity: .1),
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          mini: true,
                          elevation: 0,
                          child: const Image(
                            image: AssetImage("assets/images/facebook.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "DON'T HAVE AN ACCOUNT ? ",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, 'signup');
                        },
                        child: const Text(
                          " SIGN UP",
                          style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFff0000),
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  SignInCheck(Username,Password,context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

   String? Email = await prefs.getString('Email');
   String? Pass = await prefs.getString('Password');
   print("..................$Email");
   print(".................$Pass");
    print("Password..................$Pass");
    print("Username.................$Username");
    if(Username == Email && Password == Pass){
      Navigator.pushReplacementNamed(context, 'chatbot');
    }else if(Username == '' && Password == ''){

        const signInnullSnack = SnackBar(
          content: Center(child: Text("Hey there! Don't forget to fill the Field. It can't be empty.",style: TextStyle(color: Color(0xFFFF4891) ),)),
          backgroundColor: Color(0xFFb8d3ff),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(signInnullSnack);


    }
    else{ if(Username != Email){
      const signInUSnack = SnackBar(
        content: Center(child: Text('please check username ',style:TextStyle(color: Color(0xFFFF4891) ))),
        backgroundColor: Color(0xFFb8d3ff),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(signInUSnack);

    }
    else{if(Pass != Password){
      const signInUSnack = SnackBar(
        content: Center(child: Text('please check Password ',style:TextStyle(color: Color(0xFFFF4891) ))),
        backgroundColor: Color(0xFFb8d3ff),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(signInUSnack);

    }}

    const signInSnack = SnackBar(
    content: Center(child: Text("username or password can't be empty",style:TextStyle(color: Color(0xFFFF4891) ))),
    backgroundColor: Color(0xFFb8d3ff),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(signInSnack);

    }
    }


  }
