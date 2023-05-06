import 'package:essai/models/essay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../services/delete_essay.dart';
import '../../widgets/snack_message.dart';
import '../all_essays.dart';
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
  final delEssay = EssayDelete();

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: Theme.of(context).textTheme.headlineLarge),
            content: Text(
                'Do you want to Delete this Essay?\nYou will lose this essay.',
                style: Theme.of(context).textTheme.labelMedium),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child:
                    Text('No', style: Theme.of(context).textTheme.labelSmall),
              ),
              TextButton(
                onPressed: deleteEssay, // <-- SEE HERE
                child:
                    Text('Yes', style: Theme.of(context).textTheme.labelSmall),
              ),
            ],
          ),
        )) ??
        false;
  }

  deleteEssay() async {
    var essay = EssayModel(id: widget.essay.id);
    var res = await delEssay.deleteEssay(essay);
    SnackMessage(
      state: 'Loading',
      context: context,
    ).snackMessage();
    if (res.runtimeType == PostgrestException) {
      final PostgrestException resp = res;
      SnackMessage(
        state: 'Message',
        context: context,
        color: Colors.red,
        message: resp.message,
      ).snackMessage();
    } else {
      SnackMessage(
        state: 'Message',
        context: context,
        color: Colors.red,
        message: "Essay Deleted",
      ).snackMessage();
      Get.to(const AllEssays());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
          )),
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
          )),
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
          )),
      const SizedBox(width: 10),

      //Exit Essay Button
      OutlinedButton(
          onPressed: () {
            Get.back();
          },
          style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
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
          )),
    ]);
  }
}
