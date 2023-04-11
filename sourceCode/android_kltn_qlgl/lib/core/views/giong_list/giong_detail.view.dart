import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/size.const.dart';
import 'package:qlgl_project/core/models/giong.model.dart';

import '../../controllers/field_list.controller.dart';
import '../../controllers/ptn_list.controller.dart';

class GiongDetailView extends StatefulWidget {
  const GiongDetailView({super.key});

  @override
  State<GiongDetailView> createState() => _GiongDetailViewState();
}

class _GiongDetailViewState extends State<GiongDetailView> {
  final MaPTNListController PTNlistController = Get.find();
  final MaFIELDListController FIELDlistController = Get.find();

  giongModel data = Get.arguments;
  @override
  void initState() {
    super.initState();
    setState(() {
      PTNlistController.fetchData();
      PTNlistController.giongten.value = data.giongTen!;

      FIELDlistController.fetchData();
      FIELDlistController.giongten.value = data.giongTen!;
    });
  }

  @override
  Widget build(BuildContext context) {
    //giongModel data = Get.arguments;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     "${data.giongTen}",
        //     style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        //   ),
        //   centerTitle: true,
        // ),
        body: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Image.network(
                "http://localhost/quanlyluagiong/storage/app/${data.giongHinhanh}"
                //"https://trungtamphantichchungnhanhanoi.gov.vn/wp-content/uploads/2021/12/Giong-lua-lai-KC06-1.jpg",
              ),
            ),
            backButtonArrow(context),
            scrollContent(),
          ],
        ),
      ),
    );
  }

  Widget backButtonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget scrollContent() {
    return DraggableScrollableSheet(
      initialChildSize: 0.72,
      maxChildSize: 1,
      minChildSize: 0.72,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5,
                        width: 35,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                Text(
                  "${data.giongTen!.toUpperCase()}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                Text(
                  "Ngày cập nhật: ${data.updatedAt}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                const Text(
                  "Mã phòng thí nghiệm (PTN):",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: PTNlistController.filteredDataByGiongTen.length,
                    itemBuilder: (context, index) {
                      final item =
                          PTNlistController.filteredDataByGiongTen[index];
                      return Text(
                        "${item.ptnCode}",
                        style: const TextStyle(fontSize: 20, color: Colors.black54),
                        textAlign: TextAlign.justify,
                      );
                    },
                  );
                }),
                const Text(
                  "Mã ngoài đồng:",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        FIELDlistController.filteredDataByGiongTen.length,
                    itemBuilder: (context, index) {
                      final item =
                          FIELDlistController.filteredDataByGiongTen[index];
                      return Text(
                        "${item.fieldCode}",
                        style: const TextStyle(fontSize: 20, color: Colors.black54),
                        textAlign: TextAlign.justify,
                      );
                    },
                  );
                }),
                cardRowItem("Nguồn gốc", "${data.giongNguongoc}"),
                cardRowItem("Nhóm giống", "${data.nhomgiongTen}"),
                cardRowItem("Kiểu hình", "${data.kieuhinhTen}"),
                Text(
                  "Mô tả:",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "${data.giongMota!}",
                  style: TextStyle(
                      fontSize: 20,
                      color: data.giongMota != 'Chưa cập nhật'
                          ? Colors.black54
                          : Colors.red),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget cardRowItem(String title, String content) {
    return Row(
      children: [
        Text(
          "${title}: ",
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
        Text(
          content,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: content != 'Chưa cập nhật' ? Colors.black : Colors.red),
          softWrap: false,
        ),
      ],
    );
  }
}
