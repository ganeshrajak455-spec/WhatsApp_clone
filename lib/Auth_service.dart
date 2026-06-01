import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // SIGNUP
  Future<String> signupUser({
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String uid = userCredential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,
        'phone': phone,
        'createdAt': DateTime.now(),
      });

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "Signup Failed";
    }
  }

  // LOGOUT
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}


