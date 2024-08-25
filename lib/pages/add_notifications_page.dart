import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';

class AddNotificationsPage extends StatelessWidget {
  const AddNotificationsPage({
    super.key,
    this.isG9 = false,
  });

  final bool isG9;

  @override
  Widget build(BuildContext context) {
    final TextEditingController notifTitleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: CustomColors.backgroundColor,
          title: const Text(
            'Send Notifications',
            style: TextStyle(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Title',
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: TextField(
                  cursorColor: CustomColors.buttonColor,
                  textAlign: TextAlign.center,
                  controller: notifTitleController,
                  decoration: const InputDecoration(
                    hintText: "Enter notification title",
                    hintStyle: TextStyle(
                      color: CustomColors.secondaryTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.thirdTextColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.thirdTextColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: TextField(
                  controller: descController,
                  cursorColor: CustomColors.buttonColor,
                  textAlign: TextAlign.center,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: "Notification description",
                    hintStyle: TextStyle(
                      color: CustomColors.secondaryTextColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.thirdTextColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.thirdTextColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              // make this available for G9s only
              isG9
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Who can see?',
                              style: TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: CustomColors.buttonColor,
                              value: true,
                              onChanged: (value) {},
                            ),
                            const Text(
                              "Everyone",
                              style: TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: CustomColors.buttonColor,
                              value: true,
                              onChanged: (value) {},
                            ),
                            const Text(
                              "G9",
                              style: TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: CustomColors.buttonColor,
                              value: true,
                              onChanged: (value) {},
                            ),
                            const Text(
                              "Parents",
                              style: TextStyle(
                                color: CustomColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const SizedBox(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: FilledButton(
                      onPressed: () {
                        debugPrint("Coming soons");
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          CustomColors.buttonColor,
                        ),
                        iconColor: MaterialStatePropertyAll(
                          CustomColors.buttonColor,
                        ),
                      ),
                      child: const Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
