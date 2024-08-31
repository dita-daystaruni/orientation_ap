import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/controllers/notifications_controller.dart';
import 'package:orientation_app/models/notification_model.dart';

class AddNotificationsPage extends StatefulWidget {
  const AddNotificationsPage({
    super.key,
    this.isG9 = false,
    required this.userToken,
  });

  final bool isG9;
  final String userToken;

  @override
  _AddNotificationsPageState createState() => _AddNotificationsPageState();
}

class _AddNotificationsPageState extends State<AddNotificationsPage> {
  final TextEditingController notifTitleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  late NotificationController notificationController;

  // Checkbox states
  bool isAdminViewer = false;
  bool isParentViewer = false;
  bool isRegularViewer = false;

  Future<void> send() async {

    // Create the notification model
    NotificationModel notification = NotificationModel(
      title: notifTitleController.text,
      description: descController.text,
      isAdminViewer: isAdminViewer,
      isParentViewer: isParentViewer,
      isRegularViewer: isRegularViewer,
    );

    try {
      await notificationController.addNotifications(notification);
      
    } catch (e) {
      // Handle network or other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void initState() {
    // notification controller
    notificationController = Get.find<NotificationController>();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 16.0),
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
                    borderRadius: BorderRadius.all(Radius.circular(6)),
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
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
            ),
            // Show checkboxes for G9 only
            widget.isG9
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Who can see?',
                          style: TextStyle(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                          
                            value: isRegularViewer,
                            activeColor: CustomColors.buttonColor,
                            onChanged: (value) {
                              setState(() {
                                isRegularViewer = value!;
                              });
                            },
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
                            value: isAdminViewer,
                            activeColor: CustomColors.buttonColor,
                            onChanged: (value) {
                              setState(() {
                                isAdminViewer = value!;
                              });
                            },
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
                            
                            value: isParentViewer,
                            activeColor: CustomColors.buttonColor,
                            onChanged: (value) {
                              setState(() {
                                isParentViewer = value!;
                              });
                            },
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
                    if (notifTitleController.text.isNotEmpty && descController.text.isNotEmpty){
                      send();
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill all values.')),
                      );
                      return;
                    }

                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      CustomColors.buttonColor,
                    ),
                    iconColor: WidgetStatePropertyAll(
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
