import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/size.const.dart';
import 'package:qlgl_project/core/navbar/bottom_navbar/bottom_navbar.view.dart';

import '../../constant/color.const.dart';
import '../../navbar/bottom_navbar.controller.dart';
import '../../routes.dart';
import 'controller/chitieungoaidong.controller.dart';
import 'models/chitieungoaidong.model.dart';

class DataInputView extends StatefulWidget {
  const DataInputView({super.key});

  @override
  State<DataInputView> createState() => _DataInputViewState();
}

class _DataInputViewState extends State<DataInputView> {
  final chitieungoaidongListController CTNDlistController =
      Get.put(chitieungoaidongListController());
  BottomNavbarController controller = Get.find();
  @override
  void initState() {
    super.initState();
    setState(() {
      CTNDlistController.fetchData();
      CTNDlistController.search.value = '';
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      CTNDlistController.fetchData();
      CTNDlistController.search.value = '';
    });
    controller.changeTabIndex(1);
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const BottomNavbarView(),
            transitionDuration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: _loadpage, child: Icon(Icons.refresh_outlined)),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //title chi tieu ngoai dong
            TitleContent(
              title: "Chỉ tiêu ngoài đồng",
              ontap: () {
                AppPages.routes;
                Get.to(AppPages.getChiTieuNgoaiDongList());
              },
            ),
            //card item chi tieu ngoai dong
            Container(
              alignment: Alignment.center,
              height: 180,
              width: SizeConfig.screenWidth * 0.85,
              //color: Colors.blue,
              child: ListView.builder(
                  itemCount: CTNDlistController.filteredData.length >= 5
                      ? 5
                      : CTNDlistController.filteredData.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = CTNDlistController.allData[index];
                    return CardTile_CTND(
                      index: index,
                      item: item,
                      iconImage: "assets/logo/farm.png",
                    );
                  }),
            ),
            //title chi tieu trong nha
            TitleContent(
              title: "Chỉ tiêu trong nhà",
              ontap: () {},
            ),
            //card item chi tieu trong nha
            // Container(
            //   alignment: Alignment.center,
            //   height: 180,
            //   width: SizeConfig.screenWidth * 0.85,
            //   //color: Colors.blue,
            //   child: ListView.builder(
            //       itemCount: 5,
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       physics: const ClampingScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         return CardTile(
            //           iconImage: "assets/logo/house.png",
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}

// title content - xemthem
class TitleContent extends StatelessWidget {
  const TitleContent({
    Key? key,
    required this.title,
    required this.ontap,
  }) : super(key: key);
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kSecondaryColor),
          ),
          GestureDetector(
            onTap: ontap,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Xem thêm >',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//card chitieu
class CardTile_CTND extends StatefulWidget {
  const CardTile_CTND(
      {super.key,
      required this.iconImage,
      required this.index,
      required this.item});
  final String iconImage;
  final int index;
  final chitieungoaidongModel item;

  @override
  State<CardTile_CTND> createState() => _CardTile_CTNDState();
}

class _CardTile_CTNDState extends State<CardTile_CTND> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      padding: const EdgeInsets.only(bottom: 10, left: 5),
      width: SizeConfig.screenWidth * 0.75,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          Container(
            height: 140,
            width: SizeConfig.screenWidth * 0.7,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.5),
                  offset: const Offset(
                    2.5,
                    2.5,
                  ),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 20,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                //color: Colors.grey,
                shape: BoxShape.circle,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.blueGrey.withOpacity(0.3),
                //     offset: const Offset(
                //       2.0,
                //       2.5,
                //     ),
                //     blurRadius: 5.0,
                //     spreadRadius: 1.0,
                //   ),
                // const BoxShadow(
                //   color: Colors.white,
                //   offset: Offset(0.0, 0.0),
                //   blurRadius: 1.0,
                //   spreadRadius: 0.0,
                // ),
                //],
              ),
              child: CircleAvatar(
                //radius: 40,
                backgroundColor: Colors.blue.shade50,
                backgroundImage: AssetImage(widget.iconImage),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              widget.item.giongTen!.toUpperCase(),
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 110,
            left: 20,
            child: Text(
              "Ngày cập nhật:\n${widget.item.updatedAt!}",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.add, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 5,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    backgroundColor: kPrimaryColor, // <-- Button color
                    //foregroundColor: Colors.red, // <-- Splash color
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    AppPages.routes;
                    Get.to(AppPages.getChiTieuNgoaiDongEdit(),
                        arguments: widget.item);
                  },
                  child: Icon(Icons.edit, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 5,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(5),
                    backgroundColor: Colors.blue, // <-- Button color
                    //foregroundColor: Colors.red, // <-- Splash color
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
