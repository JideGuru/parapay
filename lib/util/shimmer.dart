import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Listshimmer extends StatelessWidget {
  const Listshimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.grey.withOpacity(0.1),
              enabled: true,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => ListTile(
                  title: Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    height: 15.0,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Listshimmerr extends StatelessWidget {
  const Listshimmerr({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.4),
              highlightColor: Colors.grey.withOpacity(0.1),
              enabled: true,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => ListTile(
                  title: Row(
                            children: [
                              Container(
                    width: 80,
                    height: 15.0,
                    color: Colors.white,
                  ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child:  Container(
                    width: 50,
                    height: 15.0,
                    color: Colors.white,
                  ),
                              ),
                              Container(
                    width: 80,
                    height: 15.0,
                    color: Colors.white,
                  ),
                            ],
                          ),
                      
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

