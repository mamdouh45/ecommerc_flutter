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
      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      if (firebaseUser != null) {
        final QuerySnapshot result = Firestore.instance
            .collection("users")
            .where("id", isEqualTo: firebaseUser.uid)
            .getDocuments() as QuerySnapshot;
        final List<DocumentSnapshot> documents = result.documents;
        if (documents.length == 0) {
          // insert the user to our collection
          Firestore.instance
              .collection("users")
              .document(firebaseUser.uid)
              .setData({
            "id":firebaseUser.uid,
            "username":firebaseUser.displayName,
            "profilePicture":firebaseUser.photoUrl,
          });
          await preferences.setString("id", firebaseUser.uid);
          await preferences.setString("username", firebaseUser.displayName);
          await preferences.setString("profilePicture", firebaseUser.photoUrl);
        }else{
          await preferences.setString("id", documents[0]['id']);
          await preferences.setString("username", documents[0]['username']);
          await preferences.setString("profilePicture", documents[0]['profilePicture']);
        }
        Fluttertoast.showToast(msg: "login is successful");
        setState(() {
          loading = false;

        });
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
