import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/routes.dart';

import '../../controllers/nhomgiong_list.controller.dart';

class NhomGiongListView extends StatefulWidget {
  @override
  State<NhomGiongListView> createState() => _NhomGiongListViewState();
}

class _NhomGiongListViewState extends State<NhomGiongListView> {
  final NhomGiongListController NGlistController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      NGlistController.fetchData();
      NGlistController.search.value = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   NGlistController.fetchData();
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => NGlistController.search.value = value,
            decoration: InputDecoration(
              hintText: 'Nhập từ khóa để tìm kiếm...',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Obx(() {
            if (NGlistController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: NGlistController.filteredData.length,
                  itemBuilder: (context, index) {
                    final item = NGlistController.filteredData[index];
                    return ExpansionTile(
                      title: Text(
                        item.nhomgiongTen!,
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            item.nhomgiongMota!=null?item.nhomgiongMota!:'Chưa có mô tả cho nhóm giống này',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
