
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundpool/soundpool.dart';

import '../controller/Sharedpref.dart';
import '../controller/constant.dart';
import '../model/media/sound.dart';
import '../model/resources.dart';
import '../controller/firework/PowerQuery.dart';
class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
   PowerQuery pq = PowerQuery();
   final  SoundService sound= SoundService();
  // Color themecolor = themeGradient as Color;
  TextEditingController Fullname = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Phno  = new TextEditingController();
  TextEditingController Password = new TextEditingController();
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

          // SingleChildScrollView(
          //   child: Positioned(child:
          //   ClipPath(
          //     clipper: BezierClipper1(),
          //     child: Container(
          //       height: MediaQuery.sizeOf(context).height,
          //       width: double.infinity,
          //       color: themeBlue,
          //     ),
          //   ),),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10,0),
                  child: Center(
                    child: Text("Sign Up",style: TextStyle( fontWeight: FontWeight.w700,color: Colors.white,fontSize: 28,letterSpacing:.03),),
                  ),

                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    children:  <Widget>[
                      TextField(
                        controller: Fullname,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.person,
                              color: Color(0xFF001347),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey.shade100 )),
                            labelText: "full name",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),
                      ),
                      TextField(
                        //obscureText: true,
                        controller: Phno,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.phone,
                              color: Color(0xFF001347),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                            labelText: "Phone no",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),

                      ),
                      TextField(
                        controller: Email,
                        //obscureText: true,
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.email,
                              color: Color(0xFF001347),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                            labelText: "Email",
                            enabledBorder: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.grey)),

                      ),
                      TextField(
                        controller: Password,
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
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF1298FF),
                                    Color(0xFF1260FF),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: const Color(0xFF1200FF),
                              onTap: () {
                                sound.playSound();
                                print("Value.text ..................${Fullname.value.text}");
                                print("Value.text ..................${Email.value.text}");
                                print("Value.text ..................${Phno.value.text}");
                                print("Value.text ..................${Password.value.text}");
                                print(".text ..................${Fullname.text}");
                                print(".text ..................${Email.text}");
                                print(".text ..................${Phno.text}");
                                print(".text ..................${Password.text}");
                                Registration(Fullname.value.text,Email.value.text,Phno.value.text,Password.value.text,context);
                                Reg(Fullname.value.text,Email.value.text,Phno.value.text,Password.value.text,context);

                              },
                              child: const Center(
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Container(width: MediaQuery.sizeOf(context).width/4,
                //       height: 3,
                //       decoration: const BoxDecoration(color: Colors.cyan),
                //     ),
                //     const SizedBox(width: 5,),
                //     const Text("OR"),
                //     const SizedBox(width: 5,),
                //     Container(width: MediaQuery.sizeOf(context).width/4,
                //       height: 3,
                //       decoration: const BoxDecoration(color: Colors.cyan),
                //     )
                //   ],
                // ),
                // FloatingActionButton(
                //   onPressed: () {},
                //   mini: true,
                //   elevation: 0,
                //   child: const Image(
                //     image: AssetImage("assets/images/google.png"),
                //   ),
                // ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     Text(
                //       "DON'T HAVE AN ACCOUNT ? ",
                //       style: TextStyle(
                //           fontSize: 11,
                //           color: Colors.grey,
                //           fontWeight: FontWeight.w500),
                //     ),
                //     Text(
                //       " SIGN UP",
                //       style: TextStyle(
                //           fontSize: 11,
                //           color: Color(0xFFFF4891),
                //           fontWeight: FontWeight.w700),
                //     )
                //   ],
                // )
              ],
            ),
          )
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(

        // isExtended: true,
        child: Icon(Icons.arrow_back,color: Colors.white,),

        backgroundColor: Colors.blue,
        shape: CircleBorder(eccentricity: .1),
        onPressed: () {
          Navigator.pushReplacementNamed(context, "signin");

        },
      ),
    );

  //  );
  }

   Reg(Fullname,Email,Phno,Password,context){
    var SqlQuery ="INSERT INTO registration(sponsorname,email,phno,password)";
    var Value = "('"+Fullname+"','"+Email+"','"+Phno+"','"+Password+"')";
     pq.writeStream(SqlQuery, Value, (ev, context) { });


  }



  Registration(Fullname,Email,Phno,Password,context) async{
    if(Fullname != "" && Email != "" &&Phno != "" && Password != "") {
      await AppPreferences.setPusername(Fullname, Email, Phno, Password);
      const snack = SnackBar(
        content: Center(child: Text('Success',style:TextStyle(color: Color(0xFF009900) ))),
        backgroundColor: Color(0xFFb8d3ff),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      Navigator.pushReplacementNamed(context, 'signin');
    }
    else{
      const snackdemo = SnackBar(
        content: Center(child: Text('Fields cannot be empty',style: TextStyle(color: Color(0xFFFF4891) ))),
        backgroundColor: Color(0xFFb8d3ff),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    }
  }



}