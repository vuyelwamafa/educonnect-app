import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
//import 'package:flutter_application_1/routes/routes.dart';

/*void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(title: 'Hello',),
    initialRoute: RouteManager.homepage,
    onGenerateRoute:RouteManager.generateRoute,
  ));
}*/

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required String title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Navigate to next screen after delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Image.asset(
                      'assets/images/CUTLogoBlueText-1-1.png',
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome To',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'CUT BLOEM Campus Navigator.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Dummy SignupScreen to demonstrate transition
//class SignupScreen extends StatelessWidget {
  //const SignupScreen({super.key});

  //@override
 // Widget build(BuildContext context) {
    //return Scaffold(
      //appBar: AppBar(title: const Text("Signup")),
      //body: const Center(child: Text("Signup Screen")),
   // );
 // }
//}
