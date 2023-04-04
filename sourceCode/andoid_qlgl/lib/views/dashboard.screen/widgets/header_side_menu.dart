// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class HeaderSideMenu extends StatelessWidget {
  const HeaderSideMenu(
      {super.key, required this.username, required this.email});
  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    const String url =
        'https://cdn.vectorstock.com/i/1000x1000/15/37/isolated-cute-cat-avatar-vector-21041537.webp';
    const String nullImg =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7COE3rogck_kH9UzfocCDLBfQmQgP37_jU1Ds5nMgc1Dhyuasl60v-K07qM16Ktps53Y&usqp=CAU';
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 30,
          child: CircleAvatar(
            radius: 28,
            backgroundImage: url != null ? NetworkImage(url) : NetworkImage(nullImg),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //"Nguyễn Huy HOàng",
                username,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.email, color: Color(0xff263d67)),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      //'hoang@gmail.com',
                      email,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
