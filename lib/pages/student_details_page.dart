import 'package:flutter/material.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/widgets/text_icon.dart';
import 'package:url_launcher/url_launcher.dart';


class StudentDetailsPage extends StatelessWidget {
  const StudentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        automaticallyImplyLeading: true,
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          left: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                maxRadius: 75,
                backgroundColor: CustomColors.iconColorTwo,
                child: Text(
                  'KO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  bottom: 8.0,
                ),
                child: Text(
                  "Name",
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                  bottom: 32.0,
                ),
                child: Text(
                  "Admission Number",
                  style: TextStyle(
                    color: CustomColors.thirdTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Personal Details",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Course",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Nairobi Campus",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                "Contacts:",
                style: TextStyle(
                  color: CustomColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                label: Text(
                  '+ 254 712 345 678',
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                trailingIcon: Icon(
                  Icons.phone_callback,
                  color: CustomColors.buttonColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 0.0,
              ),
              child: CustomTextIcon(
                label: Text(
                  'ko@daystar.ac.ke',
                  style: TextStyle(
                    color: CustomColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                trailingIcon: IconButton(
                 icon:Icon(Icons.email,
                  color: CustomColors.buttonColor,),
                  onPressed:_launchUrl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _launchUrl()async{
   final Uri url = Uri.parse('https://www.google.com');
  
  if (!await canLaunchUrl(url)) {
   //await launchUrl((emailLaunchUri));
  
    throw Exception('Could not launch $url');
  }
  }