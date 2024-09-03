import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orientation_app/services/document_service.dart';

class DocumentController extends GetxController {
  var documents = <dynamic>[].obs;

  final String userToken;

  DocumentController(this.userToken);

  @override
  void onInit() {
    super.onInit();
    fetchDocuments();
  }

  // Function to fetch documents from the server
  Future<void> fetchDocuments() async {
    try {
      var response = await getDocuments(userToken);
      documents.assignAll(response);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load documents');
    }
  }

  // Function to upload a new document
  Future<void> addDocument(String documentTitle, XFile imageFile) async {
    try {
      await uploadDocument(userToken, documentTitle, imageFile);
      await fetchDocuments();
      Get.snackbar('Success', 'Document uploaded successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload document');
    }
  }
}
