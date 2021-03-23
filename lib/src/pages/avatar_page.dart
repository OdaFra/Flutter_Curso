import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i2.wp.com/hipertextual.com/wp-content/uploads/2018/11/Stan-Lee.jpg?fit=1000%2C563&ssl=1'),
                radius: 25.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.blueGrey,
              ),
            )
          ],
        ),
        body: Center(
            child: FadeInImage(
          image: NetworkImage(
              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/stan-lee-wandavision-cameo-tributo-homenaje-1614077568.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 100),
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
