import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String emailController,
    required String passwordController,
  })async{
    await _firebaseAuth.signInWithEmailAndPassword(email: emailController, password: passwordController);
  }
    Future<void> createUserWithEmailAndPassword({
    required String emailController,
    required String passwordController,
  })async{
    await _firebaseAuth.createUserWithEmailAndPassword(email: emailController, password: passwordController);
  }
  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

}