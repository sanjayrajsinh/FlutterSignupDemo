import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: Center(
              child: Text(
            "Or sign up with social account",
            style: TextStyle(fontSize: 16, color: Colors.black),
          )),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                          onTap: (){ Scaffold.of(context).showSnackBar(SnackBar(content: Text("Instagram")));},
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.all(7),
                      child: Image.asset("assets/images/ic_instagram.png"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            end: Alignment.topRight,
                            begin: Alignment.bottomLeft,
                            colors: [
                              Colors.yellow,
                              Colors.red,
                              Colors.purple[700],
                              Colors.purple[900]
                            ]),
                      ),
                    ),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: RaisedButton(
                  color: Color(0xff2A5297),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Image.asset(
                    "assets/images/ic_fb.png",
                    width: 45,
                    height: 45,
                    fit: BoxFit.fitHeight,
                  ),
                  onPressed: () {Scaffold.of(context).showSnackBar(SnackBar(content: Text("Facebook")));},
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
