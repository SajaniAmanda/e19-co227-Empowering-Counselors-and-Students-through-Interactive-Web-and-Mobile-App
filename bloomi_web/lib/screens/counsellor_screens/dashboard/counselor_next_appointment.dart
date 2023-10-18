import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

class NextAppointment extends StatefulWidget {
  const NextAppointment({Key? key}) : super(key: key);

  @override
  State<NextAppointment> createState() => _NextAppointmentState();
}

Map<String, dynamic> nextAppointment = {
  "name": "Sajani",
  "email": "e19000@eng.pdn.ac.lk",
  "date": "12 / 10 / 2023",
  "time": "10:00 a.m.",
  "state": "Confirmed",
};

Color getAppointmentStateColor(String state) {
  if (state == 'Pending') {
    return Colors.orange;
  } else if (state == 'Confirmed') {
    return Colors.red;
  } else {
    return Colors.green;
  }
}

class _NextAppointmentState extends State<NextAppointment> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: width < 480
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.symmetric(horizontal: 60),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: UtilConstants.whiteColor,
        elevation: 10,
        shadowColor: UtilConstants.greyColor.withOpacity(0.4),
        child: Padding(
          padding: width < 480
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
              : const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Appointment Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: width < 480 ? 16.0 : 18.0,
                ),
              ),
              const Divider(
                thickness: 2,
                height: 10,
                color: UtilConstants.blackColor,
              ),
              const SizedBox(height: 8),
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                "Student Name: ${nextAppointment["name"]}",
                style: TextStyle(fontSize: width < 480 ? 14.0 : 16.0),
              ),
              Text(
                "Appointment Date: ${nextAppointment["date"].toString().substring(0, 10)}",
                style: TextStyle(fontSize: width < 480 ? 14.0 : 16.0),
              ),
              Text(
                "Appointment Time: ${nextAppointment["time"]}",
                style: TextStyle(fontSize: width < 480 ? 14.0 : 16.0),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getAppointmentStateColor(nextAppointment["state"]),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    nextAppointment["state"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width < 480 ? 14.0 : 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
