import 'package:flutter/material.dart';
import 'package:zoom_2/resources/auth_methods.dart';
// import 'package:zoom_2/screens/history_meeting_screen.dart';
// import 'package:zoom_2/screens/meeting_screen.dart';
import 'package:zoom_2/utils/colors.dart';
import 'package:zoom_2/widgets/custom_button.dart';
import 'package:zoom_2/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  // List<Widget> pages = [
  //   MeetingScreen(),
  //   const HistoryMeetingScreen(),
  //   const Text('Contacts'),
  //   CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      // body: pages[_page],
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: (){},
                text:'New Meeting',
                icon: Icons.videocam,
                ),
                HomeMeetingButton(
                onPressed: (){},
                text:'Join Meeting',
                icon: Icons.add_box_rounded,
                ),
                HomeMeetingButton(
                onPressed: (){},
                text:'Schedule',
                icon: Icons.calendar_today,
                ),
                HomeMeetingButton(
                onPressed: (){},
                text:'Share screen',
                icon: Icons.arrow_upward_rounded,
                ),
            ],
          ),
          const Expanded(
            child: Center(
              child: Text('Create/Join meetings with just a click!',
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
              ),
              ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}