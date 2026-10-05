
import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;  

  Future <void> m_creaUsuario({required String user,required String pass}) async{
    try {
      final credentials= await _firebaseAuth.createUserWithEmailAndPassword(email: user, password: pass);
      credentials.user!.sendEmailVerification();    
    } catch (e) {
      
    }
  }

  Future <bool> m_loginUser({required String user,required String pass}) async{
    try {
      final credentials= await _firebaseAuth.signInWithEmailAndPassword(email: user, password: pass);
      if (credentials.user!.emailVerified)
        return true;
      else
        return false;

    } catch (e) {
       return false;
    }
  }

  

}