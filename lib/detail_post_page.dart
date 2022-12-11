import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailPostPage extends StatefulWidget {
  final dynamic document;

  DetailPostPage(this.document);

  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () {
              deletePost(widget.document);
            },
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.document['userPhotoUrl']),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.document['email'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.document['displayName']),
                    ],
                  ),
                )
              ],
            ),
          ),
          Hero(
            tag: widget.document['photoUrl'],
            child: Image.network(widget.document['photoUrl']),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.document['contents']),
          ),
        ],
      ),
    );
  }

  Future<Null> deletePost(document) async {
    try {
      final String id = document['id'];
      Firestore.instance.collection("post").document(id).delete().then(
        (doc) {
          print("Document deleted : $id");
          Fluttertoast.showToast(msg: "글이 삭제되었습니다.");
          Navigator.pop(context);
        },
        onError: (e) => print("Error updating document $e"),
      );
      //await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
    } catch (e) {
      print('failed : ${e.toString()}');
    }
  }
}
