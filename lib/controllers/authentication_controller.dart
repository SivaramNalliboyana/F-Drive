import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount>(null);

  login() async {
    googleAccount.value = await googleSignin.signIn();
  }
}
