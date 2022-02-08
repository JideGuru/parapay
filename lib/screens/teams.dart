import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:parapay/models/team_model.dart';
import 'package:parapay/provider/home_provider.dart';
import 'package:parapay/provider/teams_provider.dart';
import 'package:provider/provider.dart';

class Teamss extends StatefulWidget {
  const Teamss({Key key, @required this.id, @required this.name})
      : super(key: key);
  final int id;
  final String name;

  @override
  _TeamssState createState() => _TeamssState();
}

class _TeamssState extends State<Teamss> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TeamsProvider>(context, listen: false).getTeam(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TeamsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name + " Team Details"),
      ),
      body: !provider.isLoading
          ? ListView(children: [
              Row(children: [
                // Container(
                //   child: CachedNetworkImage(
                //     imageUrl: ds.crestUrl,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Column(
                  children: [
                    Text(provider.team.name, style: TextStyle(fontSize: 15)),
                    // Text(ds.area.name, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ]),
              // Container(
              //   child: Text("Team Squd", style: TextStyle(fontSize: 15)),
              // ),
              // Container(
              //     child: ListView.builder(
              //         itemCount: ds.squad.length,
              //         itemBuilder: (context, index) {
              //           final dss = ds.squad[index];
              //           return Card(
              //               child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Column(
              //               children: [
              //                 Text(dss.name, style: TextStyle(fontSize: 20)),
              //                 SizedBox(height: 10),
              //               ],
              //             ),
              //           ));
              //         }))
            ])
          : Center(
              child: const CircularProgressIndicator(),
            ),
    );
  }
}
