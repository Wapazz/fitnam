import 'package:fitnam/data/models/fit_user.dart';
import 'package:fitnam/views/common/widget/secured_scaffold.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key, required this.user}) : super(key: key);
  final FitUser user;

  static Route route(user) => MaterialPageRoute(builder: ((context) {
        return StatsPage(user: user);
      }));

  @override
  Widget build(BuildContext context) {
    return SecuredScaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: Text(
          "Les stats arrivent bientot !",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
