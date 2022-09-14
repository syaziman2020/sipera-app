import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SearchForm extends StatelessWidget {
  TextEditingController controller;
  SearchForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(22, 15, 22, 10),
      child: TextFormField(
        controller: controller,
        cursorColor: greenCA,
        style: blackTextStyle.copyWith(fontSize: 13),
        decoration: InputDecoration(
          hintText: 'Cari...',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/search.png',
                  fit: BoxFit.cover,
                  height: 24,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 5),
                  height: 24,
                  width: 1,
                  color: greenCA,
                )
              ],
            ),
          ),
          suffixIcon: Icon(
            Icons.cancel,
            color: greenCA,
          ),
          contentPadding: const EdgeInsets.all(12),
          hintStyle: blackTextStyle.copyWith(
            fontSize: 13,
            color: blackC.withOpacity(0.87),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(color: greenCA),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(color: greenCA),
          ),
        ),
      ),
    );
  }
}
