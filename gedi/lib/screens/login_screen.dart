import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' show json;
import "package:http/http.dart" as http;
import 'package:google_sign_in/google_sign_in.dart';



class SignInDemo extends StatefulWidget {
  @override
  State createState() => SignInDemoState();
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignInDemo(),
      ),
    );
  }
}

class SignInDemoState extends State<SignInDemo> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<Object?> signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await _auth.signInWithCredential(credential);
  }
  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: user,
            ),
            title: Text(user.displayName ?? ''),
            subtitle: Text(user.email),
          ),
          const Text("Signed in successfully."),
          Text(_contactText),
          ElevatedButton(
            child: const Text('SIGN OUT'),
            onPressed: _handleSignOut,
          ),
          ElevatedButton(
            child: const Text('REFRESH'),
            onPressed: () => signInWithGoogle(),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            child: Image.asset('assets/icons/gedi_logo.png', fit: BoxFit.contain),
          ),
          const Text("Gender-Neutral\n dictionary",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child:GestureDetector(
            onTap: (){
              signInWithGoogle();
            },
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white
              ),
                width: 300,
                height: 50,
                child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/google_icon.png'),
                      ),
                    ),
                  ),
                  Text("구글로 시작하기"),
                  ],
                  )
                ),
            )
            )
        ],
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SNS Login"),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: _buildBody(),
      ),
      backgroundColor: Color(0xffA3A4CD),
    );
  }
}