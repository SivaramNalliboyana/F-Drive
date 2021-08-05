import 'package:fdrive/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignin = GoogleSignIn();
  Rx<User> user = Rx<User>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
  }

  login() async {
    GoogleSignInAccount googleUser = await googleSignin.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    UserCredential userCredential = await auth.signInWithCredential(credential);
    userCollection.doc(userCredential.user.uid).set({
      "username": userCredential.user.displayName,
      "profilepic": userCredential.user.photoURL,
      "email": userCredential.user.email,
      "uid": userCredential.user.uid,
      "userCreated": DateTime.now()
    });
  }
}
