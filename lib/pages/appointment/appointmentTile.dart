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
        color: Color(0xfffa8b2a),
        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
        child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('${appointment.name} '),
            subtitle: Text('${appointment.type} ${appointment.department}'
                '${appointment.time} ${appointment.date}'),
            //Row(mainAxisAlignment: MainAxisAlignment.center,),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    print("Update Pressed");
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  style: ButtonStyle(),
                  child: const Text('Delete'),
                  onPressed: () {
                    print("Delete Pressed");
                  },
                ),
              ]),
        ]),
      ),
    );
  }
}
