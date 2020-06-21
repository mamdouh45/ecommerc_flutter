import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

// we import 5 packages we used to sign
/*
*  we define var google sing new  constructor n ,  FirebaseAuth.instance ,SharedPreferences
*
* */
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextControler = TextEditingController();
  TextEditingController _passTextControler = TextEditingController();

  SharedPreferences sharedPreferences;

  // we have loading false to change by method
  bool loading = false;

  bool isLogedin = false;

  SharedPreferences preferences;


// firs we generate override initState() to make first value state to make change about state
  @override
  void initState() {
    super.initState();
    // create    isSignedIn();
    isSignedIn();
  }

  // async is wait is thing make in future
  void isSignedIn() async {

// if true login
    setState(() {
      loading = true;
    });
    // preferences wait value to SharedPreferences.getInstance()
    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      // push vs pushReplacement user do not make back or for word
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }else{
    // if false login
    setState(() {
      loading = false;
    });}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // this is background login page
          Image.asset(
            'images/w3.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // this is foreground black.withOpacity
          Container(
            height:double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.8),
          ),
          // this is logo
          Container(
              alignment: Alignment.topCenter,
            child: Image.asset('images/logo.png',height: 200.0,width: 200.0,),

            ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // this is TextFormField email
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _emailTextControler,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                icon: Icon(Icons.alternate_email),
                              ),
                              // ignore: missing_return
                              validator: (value) {
                                if (value.isEmpty) {
                                  // ignore: missing_return
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  // ignore: missing_return, missing_return
                                  if (!regex.hasMatch(value)) {
                                    return 'Please make sure your email address is valid';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      // this is TextFormField pass
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.withOpacity(0.5),
                          elevation: 0.0,

                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _passTextControler,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "password",
                                icon: Icon(Icons.lock_outline),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters long";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      // this is Btn login
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blue.withOpacity(0.8),
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          ),
                        ),
                      ),
                       // this is Text forget pass
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Forget my password",style: TextStyle(color: Colors.white,fontSize: 15.0),),
                        ) ,
                      // this is Text forget pass and new signUp
                     Padding(padding: const EdgeInsets.only(top:12.0),
                       child:  RichText(text: TextSpan(
                         children: [
                           TextSpan(
                             text: "Don't have an Account? Click her to :  ",style: TextStyle(color: Colors.white,fontSize: 17.0,fontWeight: FontWeight.w400),
                           ),
                           TextSpan(
                             text: "SignUp!",style: TextStyle(color: Colors.red,fontSize: 20.0),
                           )
                         ]
                       )),
                     ),
                      // this is Divider
                      Padding(
                        padding: const EdgeInsets.only(top:12.0),
                        child: Divider(
                          color: Colors.white,
                          height: 5.8,
                        ),
                      ),
                      // this is other login in option
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "other login in option",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // this is googleSing in btn login
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red.withOpacity(0.8),
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {
                              handleSignIn();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "google",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          ),
                        ),
                      ),
                      // this is facebook btn login
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue.withOpacity(0.8),
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {
                              handleSignIn();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Facebook",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],
      ),

    );


  }

// this is handleSignIn
  Future<FirebaseUser> handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    bool isSignIn = false;
    setState(() {
      loading = true;
    });

    final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    setState(() {
//isSignIn = true;

    });

    if (googleAccount != null) {
      // push vs pushReplacement user do not make back or for word
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }else{
      // if false login
      setState(() {
        loading = false;
      });}


    try {
      final FirebaseUser user =
          (await firebaseAuth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }

  }
}
