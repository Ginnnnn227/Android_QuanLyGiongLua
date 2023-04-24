import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../constant/color.const.dart';
import '../../controllers/giaidoantruongthanh_list.controller.dart';
import '../../funtion.dart';
import '../../models/giaidoantruongthanh.model.dart';
import '../widget/customDialog.wg.dart';

class GDTTListView extends StatefulWidget {
  const GDTTListView({super.key});

  @override
  State<GDTTListView> createState() => _GDTTListViewState();
}

class _GDTTListViewState extends State<GDTTListView> {
  final GDTTListController GDTTlistController = Get.find();

  @override
  void initState() {
    super.initState();
    setState(() {
      GDTTlistController.fetchData();
      GDTTlistController.search.value = '';
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      GDTTlistController.fetchData();
      GDTTlistController.search.value = '';
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const GDTTListView(),
            transitionDuration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GIAI ĐOẠN TRƯỞNG THÀNH',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _loadpage,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (value) => GDTTlistController.search.value = value,
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
            // so luong
            Obx(() {
              return Text(
                "Số lượng: ${numberCustom10(GDTTlistController.filteredData.length)}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              );
            }),
            Divider(),
            Obx(() {
              if (GDTTlistController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: GDTTlistController.filteredData.length,
                    itemBuilder: (context, index) {
                      final item = GDTTlistController.filteredData[index];
                      return Slidable(
                        key: Key('$item'),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: <Widget>[
                            SlidableAction(
                              onPressed: (context) async{
                                // GDTTlistController.fetchDataById(item.id!);
                                GDTTlistController.showUpdateProductDialog(item.id!);
                              },
                              backgroundColor: Colors.blue,
                              icon: Icons.edit,
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: <Widget>[
                            SlidableAction(
                              onPressed: (context) {
                                ConfirmDialog("XÁC NHẬN",
                                        "Bạn có chắc chắn muốn xóa?\n${item.gdttTen?.toUpperCase()}",
                                        () async {
                                  GDTTlistController.submitDelete(item.id!);
                                  //debugPrint(item.id.toString());
                                }, () {})
                                    .show();
                                //GDTTlistController.showConfirmDeleteDialog("${item.gdttTen}");
                              },
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: cardItemGDTT(index, item),
                      );
                    },
                  ),
                );
              }
            }),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.cyan,
            //       minimumSize: const Size.fromHeight(60)),
            //   onPressed: () => GDTTlistController.showCreateProductDialog(),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Icon(Icons.add_circle_outline,size: 30,),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         "Thêm mới".toUpperCase(),
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => GDTTlistController.showCreateProductDialog(),
        icon: const Icon(Icons.add_circle_outline),
        label: const Text(
          'Thêm mới',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget cardItemGDTT(int index, giaidoantruongthanhModel item) {
    return Card(
      child: ExpansionTile(
        textColor: kPrimaryColor,
        iconColor: kPrimaryColor,
        leading: Text(
          "${index + 1}.",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(
          "${item.gdttTen}".toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          "Ngày cập nhật: ${item.updatedAt}",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                Text(
                  "Mô tả:",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Text(item.gdttMota != null?
                  "${item.gdttMota!}":
                  "Chưa cập nhật",
                  style: TextStyle(
                      fontSize: 20,
                      color: item.gdttMota != null
                          ? Colors.black54
                          : Colors.red),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
