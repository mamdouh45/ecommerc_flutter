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
    }
    // if false login
    setState(() {
      loading = false;
    });
    Future<FirebaseUser> handleSignIn() async {
      preferences = await SharedPreferences.getInstance();

      setState(() {
        loading = true;
      });
      final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/w3.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
              alignment: Alignment.center,
              //color: Colors.blue,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                                icon: Icon(Icons.email),
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
                                icon: Icon(Icons.lock),
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

                    ],
                  ),
                ),
              )),
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
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
          child: FlatButton(
            color: Colors.red.shade900,
            onPressed: () {
              handleSignIn();
            },
            child: Text(
              "sign in / Sign up with google ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Future<FirebaseUser> handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });
    final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

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
