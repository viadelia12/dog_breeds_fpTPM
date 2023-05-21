import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profile"),
      //   backgroundColor: Color(0xffCEAB93),
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left: 100,
              top: 50,
              child: Text("Profile"),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Color(0xffCEAB93),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 20,
              child: IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text('Are you sure want to log out?'),
                      actions: <TextButton>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await prefs.remove('username');

                            if (mounted) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/login', (Route<dynamic> route) => false);
                            }
                          },
                          child: const Text('Yes',
                              style: TextStyle(color: Colors.black)),
                        )
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.logout_outlined),
              ),
            ),
            Positioned(
              left: 100,
              top: 100,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/image/me.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
