import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totask/app/modules/home/controllers/home_controller.dart';

import '../data/utils/assets.dart';

class ListTask extends StatelessWidget {
  const ListTask({
    Key? key,
    required this.nameCategori,
    required this.nameTask,
    required this.onTapCancel,
    required this.catatan,
    required this.deadline,
  }) : super(key: key);

  final Function() onTapCancel;
  final String nameCategori, catatan;
  final String nameTask;
  final Widget deadline;

  @override
  Widget build(BuildContext context) {
    
    final sucses = false.obs;
    onsucses() {
      sucses.value = !sucses.value;
    }

    

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.2),
              spreadRadius: -3,
              blurRadius: 18,
              offset: Offset(0.5, 5),
            )
          ]),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: InkWell(
                onTap: onsucses,
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: primer, width: 2),
                  ),
                  child: Obx(
                    () => AnimatedOpacity(
                      opacity: sucses.value ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      child: Icon(
                        Icons.done_outline_rounded,
                        size: 18,
                        color: primer,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          color: Colors.grey,
                          child: Text(
                            nameCategori,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          nameTask,
                          style: sucses.value == false
                              ? TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700)
                              : TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2.85,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Obx(
                        () => Text(
                          catatan,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: sucses.value == false
                              ? TextStyle(color: Colors.grey)
                              : TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2.85,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: deadline,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
                onPressed: onTapCancel,
                iconSize: 30,
                icon: Icon(Icons.cancel_rounded)),
          ),
        ],
      ),
    );
  }
}
