// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parapay/models/competition_model.dart';
import 'package:parapay/provider/homeprovider.dart';
import 'package:parapay/util/shimmer.dart';
import 'package:provider/provider.dart';

import 'homescreen.dart';
import 'teams.dart';

class Competions extends StatefulWidget {
  const Competions({Key key}) : super(key: key);

  @override
  _CompetionsState createState() => _CompetionsState();
}

class _CompetionsState extends State<Competions> {
  @override
  void initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false).getcompetition();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Of Competitions'),
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: data.getcompetition(),
            builder: (context, snapshot) {
              List<Competition> match = snapshot.data;
              final ds = match;

              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: match.length,
                      itemBuilder: (context, index) {
                        final dss = match[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreens(
                                          name: dss.name,
                                          id: dss.area.id,
                                        )));
                          },
                          title: Text(
                            dss.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(dss.area.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        );
                      })
                  : Listshimmer();
            },
          ),
        ));
  }
}
