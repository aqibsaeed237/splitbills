import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:fluttertoast/fluttertoast.dart';

class SignUpController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    String? phoneNumber,
    String? selectedCurrency,
    String? profileImage,
  }) async {
    try {
      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        String? imageUrl;
        if (profileImage != null) {
          imageUrl = await uploadProfileImage(profileImage);
        }

        await _usersCollection.doc(user.uid).set({
          'fullName': fullName,
          'email': email,
          'phoneNumber': phoneNumber,
          'selectedCurrency': selectedCurrency,
          'profileImage': profileImage,

        });
      }
    } catch (e) {
      // Handle signup errors
      print('Sign up failed: $e');
      Fluttertoast.showToast(
        msg: 'ASign up failed: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}

Future<String?> uploadProfileImage(String imagePath) async {
  try {
    final String fileName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    final firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('profile_images')
        .child(fileName);

    final file = File(imagePath);
    await ref.putFile(file);

    final imageUrl = await ref.getDownloadURL();
    return imageUrl;
  } catch (e) {
    // Handle image upload error
    print('Image Upload Error: $e');
    Fluttertoast.showToast(
      msg: 'Image Upload Error: $e',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
    return null;
  }
}
