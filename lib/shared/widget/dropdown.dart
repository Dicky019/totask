import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/utils/assets.dart';

import 'text_widget.dart';

class DropdwonInput extends StatelessWidget {
  final List<String> items;
  final Rx<String> item;

  const DropdwonInput({
    Key? key,
    required this.items,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Obx(() => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                
                value: item.value,
                icon: Icon(
                  Icons.arrow_drop_down_circle,
                  size: 26,
                  color: fab,
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextWidget(
                                overflow: TextOverflow.ellipsis,
                                text: item,
                                color: primer,
                                size: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          value: item,
                        ))
                    .toList(),
                onChanged: (value) => item.value = value!),
          )),
    );
  }
}