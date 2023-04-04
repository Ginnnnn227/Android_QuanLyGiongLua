import 'package:andoid_qlgl/views/dashboard.screen/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/bloc/dashboard.bloc/dashboard_bloc.dart';
import '../../login.screen/login_page.dart';
import '../../profile/profile.dart';
import 'drawer_item.dart';
import 'header_side_menu.dart';

class SideMenuDrawer extends StatelessWidget {
  const SideMenuDrawer({super.key, required this.user});

  final String user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 288,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
            child: Column(
              children: [
                HeaderSideMenu(username: user,email: user),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Profile())),
                  child: Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width * 0.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent.withOpacity(1),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 10,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const[
                        Padding(
                          padding: EdgeInsets.only(right:10.0),
                          child: Icon(Icons.edit_note, color: Colors.white,),
                        ),
                        Text(
                          'Thông tin cá nhân',
                          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  name: "Trang chính",
                  icon: Icons.home,
                  onPressed: () => onItemPresses(context, index: 0),
                ),
                const SizedBox(
                  height: 10,
                ),
                
                DrawerItem(
                  name: "Cài đặt",
                  icon: Icons.settings,
                  onPressed: () => onItemPresses(context, index: 4),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Đăng xuất",
                  icon: Icons.logout,
                  onPressed: () async=> onItemPresses(context, index: 5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

onItemPresses(BuildContext context, {required int index}) {
  Navigator.pop(context);
  switch (index) {
    // case 0:
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => Dashboard(title: "dashboard", username: user,)));
    //   break;
    case 5:
    BlocProvider.of<DashboardBloc>(context).add(NavBack());
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginPage()));
      break;
    default:
      Navigator.pop(context);
      break;
  }
}

