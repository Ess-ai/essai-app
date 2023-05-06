import 'package:essai/controllers/essay_buttons_controller.dart';
import 'package:essai/models/essay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../essay_edit.dart';

// ignore: must_be_immutable
class EssayActionButtons extends StatefulWidget {
  EssayActionButtons({Key? key, required this.essay, this.markessay})
      : super(key: key);
  EssayModel essay;
  dynamic markessay;

  @override
  EssayActionButtonsState createState() => EssayActionButtonsState();
}

class EssayActionButtonsState extends State<EssayActionButtons> {
  final controller = EssayButtonsController();

  Future<bool> _onWillPop() async {
    var dialog = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?',
            style: Theme.of(context).textTheme.headlineLarge),
        content: Text(
            'Do you want to Delete this Essay?\nYou will lose this essay.',
            style: Theme.of(context).textTheme.labelMedium),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: Text('No', style: Theme.of(context).textTheme.labelSmall),
          ),
          TextButton(
            onPressed: controller.deleteEssay(
              context,
              widget.essay,
            ), // <-- SEE HERE
            child: Text('Yes', style: Theme.of(context).textTheme.labelSmall),
          ),
        ],
      ),
    );
    return dialog ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          //Edit Essay Button
          OutlinedButton(
            onPressed: () {
              Get.to(EditEssay(essay: widget.essay));
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Edit'),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Iconsax.edit,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(width: 10),

          //Submit Essay Button
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: Colors.green),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Submit'),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Iconsax.document_upload,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(width: 10),

          //Delete Essay Button
          OutlinedButton(
            onPressed: _onWillPop,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Delete'),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Iconsax.trash,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(width: 10),

          //Exit Essay Button
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Exit'),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Iconsax.back_square,
                  size: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
