import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/bloc/dashboard.bloc/dashboard_bloc.dart';
import '../widgets/loading.wg.dart';
import '../widgets/space.wg.dart';
import 'widgets/side_menu_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.title, required this.username});

  final String title;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuDrawer(key: key, user: username,),
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is DashboardNav) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is DashboardLoading) {
            return LoadingWidget(
              child: initialLayout(context),
            );
          } else {
            return initialLayout(context);
          }
        },
      ),
    );
  }

  Widget initialLayout(BuildContext context) => Center(
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text(
        //       "hai $username!",
        //       style: const TextStyle(fontSize: 50.00),
        //     ),
        //     const HeightSpacer(myHeight: 10.00),
        //     ElevatedButton(
        //         onPressed: () {
        //           BlocProvider.of<DashboardBloc>(context).add(NavBack());
        //         },
        //         child: const Text("Back"))
        //   ],
        // ),
      );
}