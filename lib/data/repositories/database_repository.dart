import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnam/data/models/fit_weighting.dart';
import 'package:fitnam/data/models/profile_form_data.dart';
import 'package:uuid/uuid.dart';

const Uuid uidGen = Uuid();

class DatabaseRepository {
  static final DatabaseRepository _singleton = DatabaseRepository._internal();
  factory DatabaseRepository() {
    return _singleton;
  }
  DatabaseRepository._internal();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> completeOnboarding(FitUser user) async {
    FitUser toCreate = user.copyWith(avatar: "default.png");
    await Future.delayed(const Duration(milliseconds: 1200));
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

  Future<void> saveWeightData(FitUser user, FitWeighting data) async {
    // String currentDocUid =
    //     "${user.uid}-${DateTime.now().month}-${DateTime.now().year}";
    FitWeighting upload = data.copyWith(date: DateTime.now());
    try {
      String uid = uidGen.v4();
      await _db.collection("weighting").doc(uid).set({
        'uid': uid,
        'userId': user.uid,
        ...upload.toMap(),
      });
      await _db.collection("users").doc(user.uid).set({
        'lastWeighting': upload.toMap(),
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> addUserExercise(FitUser user) async {
    List<FitExercise> exercises = [...user.exercises];
    exercises.add(FitExercise(
        name: "Test1",
        nbReps: 10,
        topic: "idWorkoutArms",
        nbSeries: 4,
        weight: 50));
    await _db.collection("users").doc(user.uid).set({
      'exercises': exercises.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
    // TODO ADD REAL EXERCISE DATA
  }
}
