import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/size.const.dart';
import 'package:qlgl_project/core/models/nhomgiong.model.dart';

import '../../constant/color.const.dart';
import '../../controllers/giong_list.controller.dart';

import '../../controllers/nhomgiong_list.controller.dart';
import '../../funtion.dart';
import '../../routes.dart';

class GiongListView extends StatefulWidget {
  const GiongListView({super.key});

  @override
  State<GiongListView> createState() => _GiongListViewState();
}

showImage() {
  return FullScreenWidget(
    backgroundColor: Colors.white.withOpacity(0.1),
    disposeLevel: DisposeLevel.High,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        //'http://localhost:80/quanlyluagiong/storage/app/${item.giongHinhanh}',
        fit: BoxFit.cover,
        scale: 1.0,
        //"https://via.placeholder.com/600/24f355",
        "https://trungtamphantichchungnhanhanoi.gov.vn/wp-content/uploads/2021/12/Giong-lua-lai-KC06-1.jpg",
        height: 50,
      ),
      //     CachedNetworkImage(
      //   imageUrl:
      //       "http://localhost:80/quanlyluagiong/storage/app/${item.giongHinhanh}",
      //   placeholder: (context, url) =>
      //       new CircularProgressIndicator(),
      //   errorWidget: (context, url, error) =>
      //       new Icon(Icons.error),
      // ),
    ),
  );
}

class _GiongListViewState extends State<GiongListView> {
  final GiongListController GlistController = Get.find();

  @override
  void initState() {
    super.initState();
    setState(() {
      GlistController.fetchData();
      GlistController.search.value = '';
      GlistController.loadDropdown();
      GlistController.selectedNG.value = "all";
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      GlistController.fetchData();
      GlistController.search.value = '';
      GlistController.loadDropdown();
      GlistController.selectedNG.value = "all";
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const GiongListView(),
            transitionDuration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DANH SÁCH GIỐNG LÚA',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _loadpage,
        child: Column(
          children: <Widget>[
            //search field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (value) => GlistController.search.value = value,
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
            //dropdownbutton nhom giong
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
                    labelText: "Chọn nhóm giống: ",
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                  ),
                  value: GlistController.selectedNG.value,
                  items: [
                    DropdownMenuItem<String>(
                      //alignment: AlignmentDirectional.centerStart,
                      value: 'all',
                      child: Text(
                        'Tất cả nhóm giống'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.cyan,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ...GlistController.nhomgiongs.value.map(
                      (item) => DropdownMenuItem(
                        value: item.nhomgiongTen,
                        child: Text(
                          item.nhomgiongTen!.toUpperCase(),
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
                    GlistController.selectedNG.value = value!;
                    debugPrint(GlistController.selectedNG.value);
                  },
                ),
              ),
            ),
            //count
            Obx(() {
              return Text(
                "Số lượng: ${numberCustom10(GlistController.filteredData.length)}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              );
            }),
            Divider(),
            //list giống
            Obx(
              () {
                if (GlistController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: GlistController.filteredData.length,
                      itemBuilder: (context, index) {
                        final item = GlistController.filteredData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                AppPages.routes;
                                Get.to(AppPages.getGiongDetail(),
                                    arguments: item);
                              },
                              leading: showImage(),
                              title: Text(
                                "${item.giongTen}".toUpperCase(),
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
                              trailing: SizedBox(
                                  height: double.infinity,
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: kPrimaryColor,
                                    size: 25,
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            // Center(
            //   child: CachedNetworkImage(
            //     imageUrl:
            //         "http://localhost/quanlyluagiong/storage/app/lua-f2/lua-f2.jpg",
            //     placeholder: new CircularProgressIndicator(),
            //     errorWidget: new Icon(Icons.error),
            //   ),
            // )
            // Center(
            //   child: Image.network(
            //     'http://localhost/quanlyluagiong/storage/app/lua-f2/lua-f2.jpg',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // Center(
            //   child: Image.memory(
            //     base64.decode(
            //         'http://localhost/quanlyluagiong/storage/app/lua-f2/lua-f2.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
