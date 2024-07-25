import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseService._();

  static Stream<User?> get authStateUpdate => firebaseAuth.authStateChanges();

  static bool isAuthenticated() {
    final user = FirebaseService.firebaseAuth.currentUser;
    return user != null;
  }

  static User? get userinfo => FirebaseService.firebaseAuth.currentUser;
}
