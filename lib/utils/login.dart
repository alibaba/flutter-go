import 'package:firebase_auth/firebase_auth.dart';
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    return user;
}

_handleSignIn()
    .then((FirebaseUser user) => print(user))
    .catchError((e) => print(e));

final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
    email: 'an email',
    password: 'a password',
);