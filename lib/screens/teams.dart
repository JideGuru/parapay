import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:parapay/models/team_model.dart';

import 'package:parapay/provider/homeprovider.dart';
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
    // _loading = true;

    Provider.of<HomeProvider>(context, listen: false).getteam(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name + " Team Details"),
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: data.getteam(widget.id),
            builder: (context, snapshot) {
              print(snapshot.data);
              print("me as: fata dey");

              final Teams ds = snapshot.data;
              // final ds = match;

              return snapshot.hasData
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
                            Text(ds.name, style: TextStyle(fontSize: 15)),
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
                    );
            },
          ),
        ));
  }
}
