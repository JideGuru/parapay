// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parapay/models/competition_model.dart';
import 'package:parapay/provider/homeprovider.dart';
import 'package:parapay/util/shimmer.dart';
import 'package:provider/provider.dart';

import 'teams.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key key, @required this.id, @required this.name})
      : super(key: key);
  final int id;
  final String name;

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  void initState() {
    super.initState();

    Provider.of<HomeProvider>(context, listen: false)
        .getcompetitions(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name + " Competitions"),
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: data.getcompetitions(widget.id),
            builder: (context, snapshot) {
              List<Match> match = snapshot.data;
              final ds = match;

              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: match.length ?? 0,
                      itemBuilder: (context, index) {
                        final dss = match[index];
                        return ListTile(
                          title: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Teamss(
                                                  name: dss.homeTeam.name,
                                                  id: dss.homeTeam.id,
                                                )));
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        dss.homeTeam.name,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Vs",
                                  style: TextStyle(
                                      backgroundColor: Colors.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Teamss(
                                                  name: dss.awayTeam.name,
                                                  id: dss.awayTeam.id,
                                                )));
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        dss.awayTeam.name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        );
                      })
                  : snapshot.connectionState == ConnectionState.waiting
                      ? Listshimmerr()
                      : snapshot.hasError
                          ? Center(
                              child: Text(
                                "Unable To Get Data, Please Try Again.....",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            )
                          : Center(
                              child: Center(
                                child: Text(
                                  "Empty Data, Please Try Another Competition .....",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
            },
          ),
        ));
  }
}
