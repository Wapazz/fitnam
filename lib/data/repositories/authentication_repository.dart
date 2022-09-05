import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fitnam/data/models/fit_user.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'cache.dart';

/// {@template log_in_with_google_failure}
/// Thrown during the sign in with google process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithCredential.html
/// {@endtemplate}
class LogInWithGoogleFailure implements Exception {
  /// {@macro log_in_with_google_failure}
  const LogInWithGoogleFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
          "Compte existant",
        );
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
          "Verification mot de passe invalide",
        );
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          "Operation non autorise",
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          "Utilisateur desactive",
        );
      case 'user-not-found':
        return const LogInWithGoogleFailure(
          "Utilisateur introuvable",
        );
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          "Mot de passe incorrect",
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          "Code de verif invalide",
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          "ID de verif invalide",
        );
      default:
        return const LogInWithGoogleFailure("Erreur inconnue");
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();
  // clientId:
  //     "174656952204-56ugh606bia114t1vm5q1t5lav26pmun.apps.googleusercontent.com");

  final CacheClient _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<FitUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? FitUser.empty : firebaseUser.toUser;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  FitUser get currentUser {
    return _cache.read<FitUser>(key: userCacheKey) ?? FitUser.empty;
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      // LOOK IF WE WANT TO ADD WEB
      // if (isWeb) {
      //   final googleProvider = firebase_auth.GoogleAuthProvider();
      //   final userCredential = await _firebaseAuth.signInWithPopup(
      //     googleProvider,
      //   );
      //   credential = userCredential.credential!;
      // } else {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // }
      await _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure("Authentification interrompue");
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  FitUser get toUser {
    return FitUser(uid: uid, name: displayName ?? "", avatar: "");
  }
}
