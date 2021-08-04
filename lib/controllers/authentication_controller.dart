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
    auth.signInWithCredential(credential);
  }
}
