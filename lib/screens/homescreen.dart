// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parapay/models/competition_model.dart';
import 'package:parapay/provider/homeprovider.dart';
import 'package:provider/provider.dart';

import 'teams.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key key}) : super(key: key);

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  void initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false).getcompetitions();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Champions League Competitions'),
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: data.getcompetitions(),
            builder: (context, snapshot) {
              List<Match> match = snapshot.data;
              final ds = match;

              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: match.length,
                      itemBuilder: (context, index) {
                        final dss = match[index];
                        return Card(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Teamss(
                                                name: dss.homeTeam.name,
                                                id: dss.homeTeam.id,
                                              )));
                                },
                                child: Text(dss.homeTeam.name,
                                    style: TextStyle(fontSize: 20)),
                              ),
                              SizedBox(height: 10),
                              Text("Vs"),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Teamss(
                                                name: dss.awayTeam.name,
                                                id: dss.awayTeam.id,
                                              )));
                                },
                                child: Text(dss.awayTeam.name,
                                    style: TextStyle(fontSize: 20)),
                              )
                            ],
                          ),
                        ));
                      })
                  : Center(
                      child: const CircularProgressIndicator(),
                    );
            },
          ),
        ));
  }
}
