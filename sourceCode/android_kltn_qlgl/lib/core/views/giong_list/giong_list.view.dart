import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';

import '../../constant/color.const.dart';
import '../../controllers/giong_list.controller.dart';
import 'package:qlgl_project/core/models/giong.model.dart';

import '../../funtion.dart';
import '../../routes.dart';

class GiongListView extends StatefulWidget {
  const GiongListView({super.key});

  @override
  State<GiongListView> createState() => _GiongListViewState();
}

showImage() {
  return FullScreenWidget(
    disposeLevel: DisposeLevel.Medium,
    child: Hero(
      tag: "Image show",
      child: Image.network(
        "https://trungtamphantichchungnhanhanoi.gov.vn/wp-content/uploads/2021/12/Giong-lua-lai-KC06-1.jpg",
        height: 100,
      ),
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
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      GlistController.fetchData();
      GlistController.search.value = '';
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
            Obx(() {
              return Text(
                "Số lượng: ${numberCustom10(GlistController.filteredData.length)}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              );
            }),
            Divider(),
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
                                Get.to(AppPages.getGiongDetail(),arguments: item);
                              },
                              leading: FullScreenWidget(
                                backgroundColor: Colors.white.withOpacity(0.1),
                                disposeLevel: DisposeLevel.High,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    "https://trungtamphantichchungnhanhanoi.gov.vn/wp-content/uploads/2021/12/Giong-lua-lai-KC06-1.jpg",
                                    height: 100,
                                  ),
                                ),
                              ),
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
          ],
        ),
      ),
    );
  }
}
