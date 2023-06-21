import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.const.dart';
import 'controller/chitieungoaidong.controller.dart';
import 'models/chitieungoaidong.model.dart';

class ChitieungoaidongAddView extends StatefulWidget {
  const ChitieungoaidongAddView({super.key});

  @override
  State<ChitieungoaidongAddView> createState() =>
      _ChitieungoaidongAddViewState();
}

class _ChitieungoaidongAddViewState extends State<ChitieungoaidongAddView> {
  final chitieungoaidongListController CTNDlistController =
      Get.put(chitieungoaidongListController());

  @override
  void initState() {
    super.initState();
    setState(() {
      CTNDlistController.loadDropdown();
      CTNDlistController.selectedGiong.value = "all";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thêm chỉ tiêu ngoài đồng',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: <Widget>[
              //dropdown giống
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: DropdownButtonFormField<int>(
                    iconSize: 25,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.cyan,
                    ),
                    dropdownColor: Colors.cyan.shade50,
                    decoration: const InputDecoration(
                      labelText: "Giai đoạn trưởng thành * ",
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                    ),
                    value: CTNDlistController.selectedId.value,
                    items: [
                      DropdownMenuItem<int>(
                        //alignment: AlignmentDirectional.centerStart,
                        value: 0,
                        child: Text(
                          '--Chọn giai đoạn--'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.cyan,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ...CTNDlistController.giongs.value.map(
                        (item) => DropdownMenuItem(
                          value: item.id,
                          child: Text(
                            item.giongTen!.toUpperCase(),
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
                      CTNDlistController.selectedId.value = value!;
                      CTNDlistController.giongid_controller =
                          CTNDlistController.selectedId.value;
                      //print(value);
                    },
                  ),
                ),
              ),
              textForm(CTNDlistController.phienla_controller, "Phiến lá",
                  "Nhập màu sắc phiến lá"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.taila_controller, "Tai lá",
                  "Nhập màu sắc tai lá"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.gocnhanh_controller, "Gốc nhánh",
                  "Nhập gốc nhánh"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.bela_controller, "Gốc bẹ lá",
                  "Nhập màu sắc Gốc bẹ lá"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.gocla_controller, "Góc lá",
                  "Nhập hướng góc lá"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.msgocla_controller, "Màu sắc góc lá",
                  "Nhập màu sắc góc lá"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.gocladong_controller, "Góc lá đòng",
                  "Nhập hướng góc lá đòng"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.thoatcb_controller, "Thoát CB",
                  "Nhập trạng thái Thoát CB"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.msgocthan_controller,
                  "Màu sắc góc thân", "Nhập màu sắc góc thân"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.dangbong_controller, "Dáng bông",
                  "Nhập hình thái dáng bông"),
              SizedBox(
                height: 10,
              ),
              textForm(CTNDlistController.congtrucbong_controller,
                  "Cong trục bông", "Nhập độ cong trục bông"),
              SizedBox(
                height: 10,
              ),
              textForm(
                  CTNDlistController.rau_controller, "Râu", "Nhập mật độ Râu"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          CTNDlistController.submitCreate();
          //CTNDlistController.makeNull();
          Get.back();
        },
        icon: const Icon(Icons.add_circle_outline),
        label: const Text(
          'Lưu',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//widget-------------------------------------------------------
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
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: cl),
    gapPadding: 10,
  );
}
