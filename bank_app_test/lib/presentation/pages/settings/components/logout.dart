import 'package:bank_app_test/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LogoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          height: deviceSize.height * 0.5,
          width: deviceSize.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                MdiIcons.alertCircle,
                color: Colors.pink,
                size: 45,
              ),
              Text(
                'You are about logging out! Do you\n want to continue?',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () async {
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.of(context).pushAndRemoveUntil(
                        // the new route
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage(),
                        ),

                        // this function should return true when we're done removing routes
                        // but because we want to remove all other screens, we make it
                        // always return false
                        (Route route) => false,
                      );
                    },
                    color: Theme.of(context).primaryColor,
                  ),
                  RaisedButton(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
