import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/controllers/profile.controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  //const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Profile'),automaticallyImplyLeading: false,),);
  }
}