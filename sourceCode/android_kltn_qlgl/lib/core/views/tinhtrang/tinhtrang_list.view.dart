import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../constant/color.const.dart';
import '../../controllers/doituongtinhtrang_list.controller.dart';
import '../../funtion.dart';
import '../../routes.dart';
import '../widget/customDialog.wg.dart';

class TinhTrangListView extends StatefulWidget {
  const TinhTrangListView({super.key});

  @override
  State<TinhTrangListView> createState() => _TinhTrangListViewState();
}

class _TinhTrangListViewState extends State<TinhTrangListView> {
  final DTTTListController DTTTlistController = Get.find();

  @override
  void initState() {
    super.initState();
    setState(() {
      DTTTlistController.fetchData();
      DTTTlistController.search.value = '';
      DTTTlistController.loadDropdown();
      DTTTlistController.selectedGiaiDoan.value = "all";
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      DTTTlistController.fetchData();
      DTTTlistController.search.value = '';
      DTTTlistController.loadDropdown();
      DTTTlistController.selectedGiaiDoan.value = "all";
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const TinhTrangListView(),
            transitionDuration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TÍNH TRẠNG GIỐNG LÚA',
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
                onChanged: (value) => DTTTlistController.search.value = value,
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
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: DropdownButtonFormField<String>(
                  iconSize: 25,
                  isExpanded: false,
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.cyan,
                  ),
                  dropdownColor: Colors.cyan.shade50,
                  decoration: const InputDecoration(
                    labelText: "Giai đoạn trưởng thành: ",
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  value: DTTTlistController.selectedGiaiDoan.value,
                  items: [
                    DropdownMenuItem<String>(
                      //alignment: AlignmentDirectional.centerStart,
                      value: "all",
                      child: Text(
                        'Tất cả giai đoạn'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.cyan,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ...DTTTlistController.giaidoans.value.map(
                      (item) => DropdownMenuItem(
                        value: item.gdttTen,
                        child: Text(
                          item.gdttTen!.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    DTTTlistController.selectedGiaiDoan.value = value!;
                    debugPrint(DTTTlistController.selectedGiaiDoan.value);
                  },
                ),
              ),
            ),
            Obx(() {
              return Text(
                "Số lượng: ${numberCustom10(DTTTlistController.filteredData.length)}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              );
            }),
            const Divider(),
            Obx(
              () {
                if (DTTTlistController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: DTTTlistController.filteredData.length,
                      itemBuilder: (context, index) {
                        final item = DTTTlistController.filteredData[index];
                        return Slidable(
                          key: Key('$item'),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: <Widget>[
                              SlidableAction(
                                onPressed: (context) async {
                                  // GDTTlistController.fetchDataById(item.id!);
                                  DTTTlistController.showUpdateDialog(item.id!);
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
                                    DTTTlistController.submitDelete(item.id!);
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              child: ListTile(
                                onTap: () {
                                  AppPages.routes;
                                  Get.to(AppPages.getTinhTrangDetail(),
                                      arguments: item);
                                },
                                leading: Text(
                                  "${index + 1}.",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                title: Text(
                                  "${item.dtttTen}".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  "${item.gdttTen}\nNgày cập nhật: ${item.updatedAt}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                trailing: SizedBox(
                                    height: double.infinity,
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: kPrimaryColor,
                                      size: 25,
                                    )),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  minimumSize: const Size.fromHeight(60)),
              onPressed: () {
                DTTTlistController.showCreateDialog();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Thêm mới".toUpperCase(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
