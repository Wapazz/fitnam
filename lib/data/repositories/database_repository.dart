import 'package:fitnam/data/models/fit_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnam/data/models/onboarding_data.dart';

class DatabaseRepository {
  static final DatabaseRepository _singleton = DatabaseRepository._internal();
  factory DatabaseRepository() {
    return _singleton;
  }
  DatabaseRepository._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> completeOnboarding(OnboardingData data, FitUser user) async {
    // await _db.collection("users").doc(user.uid).set(data.toMap());
  }

  Stream<FitUser> streamUser(FitUser user) =>
      _db.collection("users").doc(user.uid).snapshots().map((data) {
        if (!data.exists) {
          return user;
        }
        return FitUser.fromMap(data.data() ?? {});
      });
}
