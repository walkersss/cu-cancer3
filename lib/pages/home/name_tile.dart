import 'package:flutter/material.dart';
//import 'package:travel_budget/widgets/provider_widget.dart';
//import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NameTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: Provider.of(context).auth.getCurrentUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return displayUserInformation(context, snapshot);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              )
            ],
          )),
    );
  }

  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Name: ${user.displayName}",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
