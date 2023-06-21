import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constant/color.const.dart';
import '../../../models/loaisaubenh.model.dart';
import 'controller/loaisaubenh.controller.dart';

class LoaiSauBenhDetailScreen extends StatefulWidget {
  const LoaiSauBenhDetailScreen({super.key});

  @override
  State<LoaiSauBenhDetailScreen> createState() =>
      _LoaiSauBenhDetailScreenState();
}

class _LoaiSauBenhDetailScreenState extends State<LoaiSauBenhDetailScreen> {
  LoaiSauBenhController lsb_controller = Get.put(LoaiSauBenhController());

  Map<String, dynamic> data = Get.arguments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lsb_controller.tencontroller.text = data['loaisaubenh_ten'];
    lsb_controller.motacontroller.text = data['loaisaubenh_mota'] ?? '';
    lsb_controller.donvicontroller.text = data['loaisaubenh_donvi'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cập nhật, xóa loại sâu, bệnh'.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //dropdown giống
              textForm(lsb_controller.tencontroller,
                  "Tên sâu bệnh*".toUpperCase(), "Nhập tên sâu bệnh"),
              const SizedBox(
                height: 10,
              ),
              textForm(lsb_controller.donvicontroller, "Đơn vị".toUpperCase(),
                  "Nhập đơn vị"),
              const SizedBox(
                height: 10,
              ),
              textForm(lsb_controller.motacontroller, "Mô tả".toUpperCase(),
                  "Nhập mô tả"),
              const SizedBox(
                height: 10,
              ),
              // lsb_controller.imageFile != null
              //     ? Container(
              //         width: 150,
              //         height: 150,
              //         alignment: Alignment.center,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             image: DecorationImage(
              //                 image: FileImage(lsb_controller.imageFile!),
              //                 fit: BoxFit.cover),
              //             border: Border.all(
              //               width: 8,
              //               color: Colors.black12,
              //             ),
              //             borderRadius: BorderRadius.circular(15)),
              //       )
              //     :
              Container(
                width: 150,
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 8,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.network(
                  "http://10.0.2.2:80/quanlyluagiong/storage/app/${data['loaisaubenh_hinhanh']}",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.upload, size: 25),
                label: const Text(
                  'Upload',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Select Image'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('Take Photo'),
                              onTap: () {
                                // getImageSource(source: ImageSource.camera);
                                // debugPrint(
                                //     "image: ${lsb_controller.imageFile?.path.toString()}");
                                // //Controller.selectImageFromCamera();
                                // Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text('Choose from Gallery'),
                              onTap: () {
                                // getImageSource(source: ImageSource.gallery);
                                // debugPrint(
                                //     "image: ${lsb_controller.imageFile?.path.toString()}");
                                // //Controller.selectImageFromFile();
                                // Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          // loaisaubenhModel model = loaisaubenhModel(
          //           loaisaubenhTen: lsb_controller.tencontroller.text,
          //           loaisaubenhMoTa: lsb_controller.motacontroller.text,
          //           loaisaubenhDonVi: lsb_controller.donvicontroller.text,
          //           loaisaubenhHinhAnh: lsb_controller.imageFile!,
          //         );
          //         lsb_controller.postLoaiSauBenh(model);
          //CTNDlistController.submitCreate();
          //CTNDlistController.makeNull();
          Get.back();
        },
        icon: const Icon(Icons.add_circle_outline),
        label: const Text(
          'Cập nhật',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget textForm(
    TextEditingController controller,
    String label,
    String hint,
  ) {
    return TextFormField(
      validator: label == "Tên GDTT"
          ? (value) {
              if (value!.isEmpty) {
                return "Tên giai đoạn bắt buộc nhập";
              }
              return null;
            }
          : (value) {},
      controller: controller,
      //keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        floatingLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey.shade400),
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: outlineInputBorder(kTextColor01),
        focusedBorder: outlineInputBorder(Colors.blue),
        border: outlineInputBorder(kPrimaryColor),
        errorBorder: outlineInputBorder(Colors.red),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color cl) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: cl),
      gapPadding: 10,
    );
  }
}
