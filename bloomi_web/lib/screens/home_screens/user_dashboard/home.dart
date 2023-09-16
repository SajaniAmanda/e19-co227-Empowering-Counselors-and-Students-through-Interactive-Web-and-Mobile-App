import 'package:bloomi_web/components/custom_text.dart';
import 'package:bloomi_web/components/drawer.dart';
import 'package:bloomi_web/components/footer.dart';
import 'package:bloomi_web/providers/nav_provider/navigation_provider.dart';
import 'package:bloomi_web/screens/counsellor_screens/Appointment/new_appointment.dart';
import 'package:bloomi_web/screens/counsellor_screens/home/topbar_contents.dart';
import 'package:bloomi_web/screens/home_screens/chat/home/contact.dart';
import 'package:bloomi_web/screens/home_screens/relax/relax.dart';
import 'package:bloomi_web/screens/home_screens/user_dashboard/home_page.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final List<Widget> widget = [
      const HomePage(),
      const Appointment(),
      const Contact(),
      const Relax(),
    ];
    return Scaffold(
      appBar: (width <= 900)
          ? AppBar(
              iconTheme: const IconThemeData(color: UtilConstants.primaryColor),
              backgroundColor: UtilConstants.lightgreyColor,
              elevation: 0,
              centerTitle: true,
              title: CustomText("BLOOMI",
                  fontSize: width * 0.03,
                  fontWeight: FontWeight.w300,
                  fontColor: UtilConstants.primaryColor))
          : PreferredSize(
              preferredSize: Size(width, 70),
              child: const HomeNavBar(),
            ),
      body: Consumer<NavigationProvider>(
        builder: (context, value, child) {
          return widget[value.currentIndex];
        },
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: Footer(width: width, height: 55),
    );
  }
}
