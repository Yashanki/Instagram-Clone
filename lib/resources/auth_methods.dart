import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up the user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
  }) async {
    String res = "Some error occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty ){
        //register user
         UserCredential cred = await _auth.signInWithEmailAndPassword(email: email, password: password);

         print(cred.user!.uid);
         //add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username' : username,
          'uid' : cred.user!.uid,
          'email' : email,
          'bio' : bio,
          'followers' : [],
          'followers' : [],
        });
        // await _firestore.collection('users').add(
        //     {'username': username,
        //       'uid': cred.user!.uid,
        //       'email': email,
        //       'bio': bio,
        //       'followers': [],
        //       'followers': [],}
        // );

        res = "success";
      }
    } catch(err){
      res = err.toString();
    }
    return res;
}

}