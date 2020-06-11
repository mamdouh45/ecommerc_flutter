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
      final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      try {
        FirebaseUser user = (await firebaseAuth.signInWithCredential(
            credential)) as FirebaseUser;
        return user;
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("login", style: TextStyle(color: Colors.red.shade900),),
        elevation: 0.1,
      ),
      body: Stack(
        children: [Center(
          child: FlatButton(
            color: Colors.red.shade900,
            onPressed: () {
              handleSignIn();
            },
            child: Text("sign in / Sign up with google ",
              style: TextStyle(color: Colors.white),),
          ),
        ),
          Visibility(visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                ),
              ))
        ],

      ),
    );
  }

  Future<FirebaseUser>handleSignIn() async {
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
       FirebaseUser user = (await firebaseAuth.signInWithCredential(
           credential)) as FirebaseUser;
     return user;
     } catch (e) {
     print(e.toString());
     return null;
     }
   }
   }

/*
*    loading = true;
      });
      GoogleSignInAccount googleAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
      await googleAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      try {
        FirebaseUser user = (await firebaseAuth.signInWithCredential(
            credential)) as FirebaseUser;
        return user;
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("login", style: TextStyle(color: Colors.red.shade900),),
        elevation: 0.1,
      ),
      body: Stack(
        children: [Center(
          child: FlatButton(
            color: Colors.red.shade900,
            onPressed: () {
              handleSignin();
            },
            child: Text("sign in / Sign up with google ",
              style: TextStyle(color: Colors.white),),
          ),
        ),
          Visibility(visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                ),
              ))
        ],

      ),
    );
  }
}
*/
