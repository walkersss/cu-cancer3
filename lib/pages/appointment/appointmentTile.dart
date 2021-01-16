import 'package:flutter/material.dart';
import 'package:cu_cancer/models/appointment.dart';

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;
  AppointmentTile({this.appointment});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        color: Color(0xffFCB97F),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(7, 2, 7, 0),
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('${appointment.name} '),
            subtitle: Text('${appointment.type} ${appointment.department}'
                '${appointment.time} ${appointment.date}'),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.blue[700]),
                  child: const Text('Update'),
                  onPressed: () {
                    print("Update Pressed");
                  },
                ),
                const SizedBox(width: 8),
                // TextButton(
                //  child: const Text('Delete'),
                //  style: TextButton.styleFrom(primary: Colors.red[700]),
                //  onPressed: () {
                //    print("Delete Pressed");
                //  },
                //),
              ]),
        ]),
      ),
    );
  }
}
