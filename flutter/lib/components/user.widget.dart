import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/components/avatar.widget.dart';
import 'package:todos/controllers/login.controller.dart';
import 'package:todos/user.dart';
import 'package:todos/views/login.views.dart';

class UserCard extends StatelessWidget {
  final loginController = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: new ExactAssetImage("assets/images/notification.png"),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          TDAvatar(path: user.picture, width: 80),
          SizedBox(
            height: 40,
          ),
          Text(
            user.name,
            style: TextStyle(color: Colors.white),
          ),
          Container(
            height: 20,
            child: FlatButton(
              onPressed: () {
                loginController.logout().then((data) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ),
                  );
                });
              },
              child: Text(
                "Sair",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
