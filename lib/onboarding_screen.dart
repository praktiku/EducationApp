import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:ulearn/constants/color.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/welcome.jpg",
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Make Learning Accessible Anywhere",
                    style: TextStyle(
                      wordSpacing: 2.5,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const Text(
                    "Save yourself time by bringing all your courses tool together",
                    style: TextStyle(
                      wordSpacing: 2.5,
                      color: Color.fromARGB(255, 230, 230, 230),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: kPrimaryLight,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
