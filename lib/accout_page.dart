import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {

  final FirebaseUser user;

  AccountPage(this.user);


  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
          ),
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            signOutWithGoogle();
          },
        )
      ],
      backgroundColor: Colors.white,
      title: Text(
        '𝔦𝔫𝔰𝔱𝔞𝔤𝔯𝔞𝔪 𝔠𝔩𝔬𝔫',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 27,
                          height: 27,
                          child: ClipOval(child: Container(color: Colors.white,),),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Text(widget.user.displayName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
            ],
          ),
          Text(
            '0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Future<Null> signOutWithGoogle() async {
    try {
      // Sign out with firebase
      await FirebaseAuth.instance.signOut();
      // Sign out with google
      await _googleSignIn.signOut();
      //await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
    } catch (e) {
      print('failed : ${e.toString()}');
    }
  }
}
