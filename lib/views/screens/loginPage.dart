import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/data/services/google-auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/icon.png",
                    ),
                  ),
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 12.0,
              ),
              child: Text(
                "Create and Manage your Notes",
                style: TextStyle(
                  fontSize: 36.0,
                  fontFamily: "lato",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: loading
                  ? CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                        Colors.red,
                        //Color(0xff5771F9),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          loading = true;
                        });
                        signInWithGoogle(context);

                        setState(() {
                          loading = false;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue With Google",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "lato",
                            ),
                          ),
                          //
                          SizedBox(
                            width: 10.0,
                          ),
                          //
                          Image.asset(
                            'assets/images/google.png',
                            height: 36.0,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.grey[700],
                        ),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                        ),
                      ),
                    ),
            ),

            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
