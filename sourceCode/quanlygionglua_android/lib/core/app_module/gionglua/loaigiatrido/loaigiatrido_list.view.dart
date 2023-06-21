
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.const.dart';
import '../../../constant/function/funtion.dart';
import '../../../models/loaigiatrido.model.dart';
import 'controller/loaigiatrido.controller.dart';

class LoaiGiaTriDoListScreen extends StatefulWidget {
  const LoaiGiaTriDoListScreen({super.key});

  @override
  State<LoaiGiaTriDoListScreen> createState() => _LoaiGiaTriDoListScreenState();
}

class _LoaiGiaTriDoListScreenState extends State<LoaiGiaTriDoListScreen> {
  var LGTDlistController = Get.put(LoaiGiaTriDoController());

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Ngoài đồng'.toUpperCase(),
    ),
    Tab(
      text: 'Trong nhà'.toUpperCase(),
    )
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      LGTDlistController.onInit();
    });
  }

  Future<void> _loadpage() async {
    
    setState(() {
      LGTDlistController.onInit();
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const LoaiGiaTriDoListScreen(),
            transitionDuration: const Duration(seconds: 5)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nhóm giống lúa'.toUpperCase(),
          style: TextStyle(
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
      body: DefaultTabController(
        length: myTabs.length,
        child: Column(
          children: <Widget>[
            TabBar(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              // indicatorColor: Colors.cyan,
              indicatorWeight: 1,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: kPrimaryColor),
              labelColor: Colors.white,
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelColor: Colors.grey,
              tabs: myTabs,
              onTap: (index) {
                LGTDlistController.phanloai.value = index == 0 ? 1 : 2;
              },
            ),
            Obx(() {
              return Text(
                "Số lượng: ${numberCustom10(LGTDlistController.phanloai.value == 1 ? LGTDlistController.filteredData1.length : LGTDlistController.filteredData2.length)}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
              );
            }),
            const Divider(),
            Expanded(
              child: Obx(
                () {
                  if (LGTDlistController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: buildTable(LGTDlistController.filteredData1),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: buildTable(LGTDlistController.filteredData2),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTable(List<loaigiatridoModel> datalist) {
    return DataTable(
      border: TableBorder.all(width: 1, color: Colors.cyan),
      columnSpacing: 0,
      headingRowColor:
          MaterialStateProperty.all<Color>(Colors.cyan.withOpacity(1)),
      headingTextStyle:
          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      columns: <DataColumn>[
        DataColumn(label: Text('Tên loại giá trị đo'.toUpperCase())),
        DataColumn(
          label: Text(
            'Đơn vị'.toUpperCase(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
      rows: datalist
          .map(
            (item) => DataRow(
              cells: [
                DataCell(Text(item.loaigiatridoTen!)),
                DataCell(
                  Center(
                    child: Text(
                      item.loaigiatridoDonVi!,
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
