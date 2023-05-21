import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/loaigiatrido.controller.dart';

class LoaiGiaTriDoListScreen extends StatefulWidget {
  const LoaiGiaTriDoListScreen({super.key});

  @override
  State<LoaiGiaTriDoListScreen> createState() => _LoaiGiaTriDoListScreenState();
}

class _LoaiGiaTriDoListScreenState extends State<LoaiGiaTriDoListScreen> {
  var LGTDlistController = Get.find<LoaiGiaTriDoController>();

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
          'Các giá trị đo'.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
    );
  }
}
