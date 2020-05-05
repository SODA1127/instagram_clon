import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram에 오신 것을 환영합니다',
                  style: TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Text('사진과 동영상을 보려면 팔로우 하세요.'),
                SizedBox(
                  width: 260,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://t1.daumcdn.net/cfile/tistory/994BEF355CD0313D05'),
                            )),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        Text('이메일 주소'),
                        Text('이름'),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network('https://t1.daumcdn.net/cfile/tistory/994BEF355CD0313D05', fit: BoxFit.cover,),
                            ),
                            Padding(
                              padding: EdgeInsets.all(1),
                            ),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network('https://t1.daumcdn.net/cfile/tistory/994BEF355CD0313D05', fit: BoxFit.cover,),
                            ),
                            Padding(
                              padding: EdgeInsets.all(1),
                            ),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.network('https://t1.daumcdn.net/cfile/tistory/994BEF355CD0313D05', fit: BoxFit.cover,),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        Text('Facebook 친구'),
                        Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        RaisedButton(
                          child: Text('팔로우'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
