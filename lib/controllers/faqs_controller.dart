import 'dart:convert';
import 'package:get/get.dart';
import 'package:orientation_app/models/faq_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaqController extends GetxController {
  RxList<FaqModel> faqs = <FaqModel>[].obs;

  @override
  void onInit() async {
    // set faqs
    await getFaqsFromSP();
    super.onInit();
  }

  // caches faqs
  Future<void> addFaqToSP(List<String> faqs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("faqs", faqs);
  }

  // gets users contacts from SP
  Future getFaqsFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? faqsString = prefs.getStringList("faqs");
    if (faqsString != null) {
      // clear contacts before adding new ones
      faqs.clear();
      // adding new contacts
      for (var element in faqsString) {
        faqs.add(
          FaqModel.fromJson(
            jsonDecode(element),
          ),
        );
      }
      return faqs;
    }
    return null;
  }
}
