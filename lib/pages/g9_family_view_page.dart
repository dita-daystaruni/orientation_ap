import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/models/parent_contact.dart';
import 'package:orientation_app/models/user_contact.dart';
import 'package:orientation_app/pages/student_details_page.dart';
import 'package:orientation_app/services/contacts_service.dart';
import 'package:orientation_app/utils/custom_url_launchers.dart';
import 'package:orientation_app/widgets/contact_tile.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class G9FamilyViewPage extends StatelessWidget {
  const G9FamilyViewPage(
      {super.key, required this.parent, required this.token});

  final UserContact parent;
  final String token;

  Future<List> setContacts() async {
    List<String> encodedContacts = [];
    List<dynamic> decodedContacts = [];

    var response = await getUserContacts(
      parent.userId,
      token,
    );
    if (response[0] == 200) {
      for (var contact in response[1]) {
        encodedContacts.add(jsonEncode(contact));
      }
      for (var element in encodedContacts) {
        decodedContacts.add(
          ParentContact.fromJson(
            jsonDecode(element),
          ),
        );
      }
      return decodedContacts;
    } else {
      throw Exception("Error Fetching Contacts");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        title: Text(
          "Family For ${parent.firstName}",
          style: const TextStyle(
            color: CustomColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
          left: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${parent.firstName} ${parent.lastName}",
              style: const TextStyle(
                color: CustomColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                  label: Text(
                    parent.phoneNo,
                    style: const TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  trailingIcon: IconButton(
                    onPressed: () {
                      makePhoneCall(parent.phoneNo);
                    },
                    icon: const Icon(
                      Icons.phone,
                      color: CustomColors.buttonColor,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                label: Text(
                  parent.email,
                  style: const TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                trailingIcon: IconButton(
                  onPressed: () {
                    sendEmail(parent.email);
                  },
                  icon: const Icon(
                    Icons.email,
                    color: CustomColors.buttonColor,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 32.0,
                bottom: 8.0,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 32.0,
                  ),
                  child: Text(
                    'Family members',
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder(
                future: setContacts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: CustomColors.buttonColor,
                    ));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final contacts = snapshot.data!;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 24,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          itemBuilder: (context, idx) {
                            return ContactTile(
                              label:
                                  '${contacts[idx].firstName[0]}${contacts[idx].lastName[0]}',
                              idx: idx,
                              sizes: 30,
                              redirectionPage: StudentDetailsPage(
                                student: contacts[idx],
                              ),
                            );
                          },
                          itemCount: contacts.length,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Lottie.asset(
                            "assets/lotties/error.json",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          "No Family found",
                          style: TextStyle(
                            color: CustomColors.secondaryTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
