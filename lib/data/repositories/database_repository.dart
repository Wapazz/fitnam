import 'package:fitnam/core/constants.dart';
import 'package:fitnam/data/models/fit_exercise.dart';
import 'package:fitnam/data/models/fit_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnam/data/models/fit_weighting.dart';
import 'package:fitnam/data/models/last_workout.dart';
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
    FitUser toCreate =
        user.copyWith(avatar: "default.png", hasCompletedOnboarding: true);
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

  Future<void> addUserExercise(FitUser user, String topic, int nb) async {
    List<FitExercise> exercises = [...user.exercises];
    exercises.add(FitExercise(
        uid: uidGen.v4(),
        name: "Exercice $nb",
        nbReps: topic != "idWorkoutCardio" ? 10 : 100,
        topic: topic,
        nbSeries: topic != "idWorkoutCardio" ? 4 : 15,
        kilos: 1,
        pounds: 1 * ratioKiloPounds));
    await _db.collection("users").doc(user.uid).set({
      'exercises': exercises.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  Future<void> removeUserExercise(FitUser user, FitExercise exo) async {
    List<FitExercise> exercises = [...user.exercises];
    FitExercise confirm = exercises.firstWhere(
        (element) => element.uid == exo.uid,
        orElse: () => FitExercise.empty);

    if (confirm.isEmpty) {
      return;
    }
    exercises.remove(confirm);
    await _db.collection("users").doc(user.uid).set({
      'exercises': exercises.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  Future<void> renameUserExercise(
      FitUser user, FitExercise exo, String name) async {
    List<FitExercise> exercises = [...user.exercises];
    FitExercise confirm = exercises.firstWhere(
        (element) => element.uid == exo.uid,
        orElse: () => FitExercise.empty);

    if (confirm.isEmpty) {
      return;
    }
    exercises.replaceRange(exercises.indexOf(confirm),
        exercises.indexOf(confirm) + 1, [confirm.copyWith(name: name)]);
    await _db.collection("users").doc(user.uid).set({
      'exercises': exercises.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  Future<void> saveSession(
      FitUser user, List<FitExercise> session, String currentSession) async {
    List<FitExercise> exercises = [...user.exercises];

    for (FitExercise ex in session) {
      FitExercise confirm = exercises.firstWhere(
          (element) => element.uid == ex.uid,
          orElse: () => FitExercise.empty);
      if (confirm.isNotEmpty) {
        exercises.replaceRange(
            exercises.indexOf(confirm), exercises.indexOf(confirm) + 1, [ex]);
      }
    }

    String sessionUid =
        currentSession.isNotEmpty ? currentSession : uidGen.v4();
    LastWorkout lw = LastWorkout(date: DateTime.now(), sessionUid: sessionUid);

    await _db.collection("users").doc(user.uid).set({
      'exercises': exercises.map((e) => e.toMap()).toList(),
      'lastWorkout': lw.toMap(),
      'nbWorkout':
          currentSession.isNotEmpty ? user.nbWorkout : user.nbWorkout + 1,
    }, SetOptions(merge: true));

    await _db.collection("session").doc(sessionUid).set({
      'uid': sessionUid,
      'userId': user.uid,
      'exercises': session.map((e) => e.toMap()).toList(),
      'date': FieldValue.serverTimestamp()
    });
  }

  Future<List<FitExercise>> getLastWorkoutExercises(String sessionId) async {
    List<FitExercise> ret = [];
    await _db.collection("session").doc(sessionId).get().then((doc) {
      ret = doc['exercises'] != null
          ? List<FitExercise>.from(
              doc['exercises']?.map((x) => FitExercise.fromMap(x)))
          : [];
    });
    return ret;
  }

  Future<void> saveAvatar(FitUser user, String avatar) async {
    await _db.collection("users").doc(user.uid).set({
      'avatar': avatar,
    }, SetOptions(merge: true));
  }
}
