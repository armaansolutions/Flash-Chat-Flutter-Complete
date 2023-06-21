import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:asmvp/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  bool isDarkMode = true;

  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);
    controller?.forward();
    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation?.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                Expanded(
                  child: AnimatedTextKit(
                    key: ValueKey<bool>(isDarkMode),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        isDarkMode ? 'Armaan Solutions' : 'Armaan Solutions',
                        cursor: isDarkMode ? '>' : '<',
                        textStyle: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w900,
                            color: isDarkMode
                                ? Colors.amber[300]
                                : Colors.grey[850]),
                        speed: const Duration(milliseconds: 100),
                      ),
                      //      TypewriterAnimatedTextKit(
                      //   text: ['Flash Chat'],
                      //   textStyle: TextStyle(
                      //     fontSize: 45.0,
                      //     fontWeight: FontWeight.w900,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
