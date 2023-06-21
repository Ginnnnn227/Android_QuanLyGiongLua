// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';

import '../../../constant/color.const.dart';
import '../../../constant/function/funtion.dart';
import '../../../routes/route.lib.dart';
import '../../../widget/customDialog.wg.dart';
import 'controller/loaisaubenh.controller.dart';

class LoaiSauBenhListScreen extends StatefulWidget {
  const LoaiSauBenhListScreen({super.key});

  @override
  State<LoaiSauBenhListScreen> createState() => _LoaiSauBenhListScreenState();
}

class _LoaiSauBenhListScreenState extends State<LoaiSauBenhListScreen> {
  LoaiSauBenhController lsb_controller = Get.put(LoaiSauBenhController());

  @override
  void initState() {
    super.initState();
    setState(() {
      lsb_controller.onInit();
    });
    //debugPrint(lsb_controller.filteredList.toString());
  }

  Future<void> _loadpage() async {
    setState(() {
      lsb_controller.onInit();
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const LoaiSauBenhListScreen(),
            transitionDuration: const Duration(seconds: 5)));
  }

  showImage(String image) {
    return FullScreenWidget(
      backgroundColor: Colors.white.withOpacity(0.1),
      disposeLevel: DisposeLevel.High,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 280,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        'http://10.0.2.2:80/quanlyluagiong/storage/app/$image'),
                    fit: BoxFit.cover),
                border: Border.all(
                  width: 8,
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(15)),
          )
          // child: Image.network(
          //   'http://10.0.2.2:80/quanlyluagiong/storage/app/${image}',
          //   fit: BoxFit.cover,
          //   scale: 1.0,
          //   //"https://trungtamphantichchungnhanhanoi.gov.vn/wp-content/uploads/2021/12/Giong-lua-lai-KC06-1.jpg",
          //   height: 50,
          // ),
          // child: CachedNetworkImage(
          //   imageUrl: "http://10.0.2.2:80/quanlyluagiong/storage/app/${image}",
          //   placeholder: (context, url) => new CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => new Icon(Icons.error),
          // ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Các loại sâu bệnh'.toUpperCase(),
          style: const TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        //elevation: 0,

        leadingWidth: 56,
        leading: BackButton(
          color: kPrimaryColor,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
                onPressed: () {
                  _loadpage();
                },
                icon: const Icon(Icons.refresh_outlined, color: kPrimaryColor)),
          )
        ],

        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _loadpage,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (value) => lsb_controller.search.value = value,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 20),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25),
                  hintText: 'Nhập từ khóa để tìm kiếm...',
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  // prefix: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            Obx(
              () {
                return Text(
                  "Số lượng: ${numberCustom10(lsb_controller.filteredList.length)}",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan),
                );
              },
            ),
            const Divider(),
            Expanded(
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: lsb_controller.filteredList.isEmpty
                      ? Column(
                          children: [
                            const Text(
                              'Chưa có dữ liệu sâu bệnh',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kSecondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${lsb_controller.search}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : GridView.builder(
                          itemCount: lsb_controller.filteredList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 5,
                                  mainAxisExtent: 150,
                                  childAspectRatio: 3 / 2),
                          itemBuilder: (context, index) {
                            final item = lsb_controller.filteredList[index];
                            final String name = item['loaisaubenh_ten'];
                            final String image = item['loaisaubenh_hinhanh'];
                            return Card(
                              shadowColor: kPrimaryColor,
                              elevation: 10,
                              // color: Colors.white60,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        showImage(image),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.LOAISAUBENH_DETAIL,
                                                    arguments: item);
                                              },
                                              child: const Icon(
                                                Icons.info,
                                                color: Colors.cyan,
                                                size: 40,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                ConfirmDialog("XÁC NHẬN",
                                                        "Bạn có chắc chắn muốn xóa?",
                                                        () async {
                                                  lsb_controller.
                                                      submitDelete(item['id']);
                                                  //debugPrint(item.id.toString());
                                                }, () {})
                                                    .show();
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      name,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: secondaryDark,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ),
            Container(
              height: 80,
            )
          ],
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () => {},
      //       child: Icon(Icons.navigate_before_rounded),
      //       heroTag: "fab1",
      //     ),
      //     FloatingActionButton(
      //       onPressed: () => {},
      //       child: Icon(Icons.navigate_next_rounded),
      //       heroTag: "fab2",
      //     ),

      //   ],

      // )
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(Routes.LOAISAUBENH_ADD);
        },
        icon: const Icon(Icons.add_circle_outline),
        label: const Text(
          'Thêm mới',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
