import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// controller
import '../controllers/input_controller.dart';
// widget
import '/shared/widget/text_widget.dart';

// asset
import '../../../data/utils/assets.dart';

class DeadLine extends StatelessWidget {
  const DeadLine({
    Key? key,
   
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final InputController controller = Get.find<InputController>();
    return Expanded(
      flex: 12,
      child: Container(
        height: 51,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: DateTimeField(
                style: TextStyle(color: primer),
                controller: controller.controllerTanggal,
                decoration: InputDecoration(
                  hintText: "DeadLine",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 0, vertical: 15),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Icon(
                      Icons.event,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),
                ),
                format: controller.format,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate:
                          DateTime(DateTime.now().year),
                      initialDate:
                          currentValue ?? DateTime.now(),
                      lastDate: DateTime(2025));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );

                    print(DateTimeField.combine(date, time));

                    controller.controllerTanggal.text =
                        DateTimeField.combine(date, time)
                            .toString();
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              ),
            ),
            LineWiget(),
          ],
        ),
      ),
    );
  }
}