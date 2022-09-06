import 'package:fitnam/data/models/fit_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnam/data/models/profile_form_data.dart';

class DatabaseRepository {
  static final DatabaseRepository _singleton = DatabaseRepository._internal();
  factory DatabaseRepository() {
    return _singleton;
  }
  DatabaseRepository._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> completeOnboarding(FitUser user) async {
    FitUser toCreate = user.copyWith(avatar: "default.png");
    await Future.delayed(const Duration(seconds: 1));
    await _db.collection("users").doc(user.uid).set(toCreate.toMap());
  }

  Stream<FitUser> streamUser(FitUser user) =>
      _db.collection("users").doc(user.uid).snapshots().map((data) {
        if (!data.exists) {
          return user;
        }
        return FitUser.fromMap(data.data() ?? {});
      });

  Future<void> saveProfile(FitUser user, ProfileFormData data) async {
    FitUser upload = user.copyWith(
        name: data.name,
        avatar: data.avatar,
        program: data.program,
        europeanMetrics: data.usesEuropeanMetrics);
    await _db
        .collection("users")
        .doc(user.uid)
        .set(upload.toMap(), SetOptions(merge: true));
  }
}
