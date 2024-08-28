import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:orientation_app/constants/custom_colors.dart';
import 'package:orientation_app/constants/custom_icons/custom_icons.dart';
import 'package:orientation_app/controllers/faqs_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orientation_app/controllers/document_controller.dart';
import 'package:orientation_app/widgets/documents_tile.dart';
import 'package:orientation_app/widgets/faqtile.dart';
import 'package:orientation_app/widgets/text_icon.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({
    super.key,
    this.isParent = false,
    required this.userToken,
  });

  final bool isParent;
  final String userToken;

  static const List<Tab> myTabs = <Tab>[
    Tab(text: "FAQ"),
    Tab(text: 'Documents'),
  ];

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> with SingleTickerProviderStateMixin {
  late FaqController faqController;
  late TabController tabController;

  @override
  void initState() {
    // faq controller
    faqController = Get.find<FaqController>();
    // tab controller
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(
      () {
        // TODO invoke silent updates for FAQS and Documnets, a way to restrict to many changes
        debugPrint("Changing Page");
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DocumentController documentController =
        Get.put(DocumentController(widget.userToken));

    // putting routines and sessions controllers
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundColor,
        title: const Center(
          child: Text(
            "Routines & Sessions",
            style: TextStyle(
              color: CustomColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          padding: const EdgeInsets.all(8.0),
          indicatorColor: CustomColors.buttonColor,
          dividerColor: CustomColors.indicatorColor,
          labelColor: CustomColors.buttonColor,
          labelStyle: const TextStyle(
            color: CustomColors.textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          overlayColor: const WidgetStatePropertyAll(
            CustomColors.hoverColor,
          ),
          tabs: FaqPage.myTabs,
        ),
        automaticallyImplyLeading: false,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // faq tab view
          Column(
            children: [
              Obx(
                () => faqController.faqs.isNotEmpty
                    ?
                    // list of faqs
                    Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaqTile(
                                question: faqController.faqs[index].question,
                                answer: faqController.faqs[index].answer,
                              ),
                            );
                          },
                          itemCount: faqController.faqs.length,
                        ),
                      )
                    : Column(
                        children: [
                          Lottie.asset(
                            "assets/lotties/error.json",
                          ),
                          const Text(
                            "NO FAQS YET",
                            style: TextStyle(
                              color: CustomColors.secondaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
          // Documents Page
          Column(
            children: [
              // if user is a parent gives functionality to upload
              widget.isParent
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: CustomTextIcon(
                        leadingIcon: IconButton(
                          onPressed: () => uploadImportantDocumentDialog(
                              context, documentController),
                          icon: const Icon(
                            CustomIcons.docAdd,
                            color: CustomColors.buttonColor,
                          ),
                        ),
                        label: const Text(
                          "Upload documents",
                          style: TextStyle(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              // list of documents
              Expanded(
                child: Obx(() {
                  if (documentController.documents.isEmpty) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: CustomColors.buttonColor,
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: documentController.documents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DocumentsTile(
                            documentName: documentController.documents[index]
                                ['title'],
                            documentUrl: documentController.documents[index]
                                ['file'],
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function for showing the dialog box
  Future<dynamic> uploadImportantDocumentDialog(
      BuildContext context, DocumentController documentController) {
    final ImagePicker picker = ImagePicker();
    TextEditingController docTitleController = TextEditingController();

    // Function to handle image picking and uploading
    Future<void> pickAndUploadImage() async {
      String documentTitle = docTitleController.text;

      if (documentTitle.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a document name.')),
        );
        return;
      }

      // Pick an image from the gallery
      XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        Get.snackbar('No image selected.', 'Try again');
        return;
      }

      try {
        await documentController.addDocument(documentTitle, imageFile);
      } catch (e) {
        Get.snackbar(
          'Something Went Wrong!🥲',
          'Retry Or Contact dita@daystar.ac.ke To Report Incidence If Issue Persists',
        );
      }
    }

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: CustomColors.backgroundColor,
            title: const Text(
              "Upload important document",
              style: TextStyle(
                color: CustomColors.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            content: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Document name",
                    style: TextStyle(
                      color: CustomColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      bottom: 18.0,
                    ),
                    child: TextField(
                      cursorColor: CustomColors.buttonColor,
                      textAlign: TextAlign.center,
                      controller: docTitleController,
                      decoration: const InputDecoration(
                        hintText: "Enter document name",
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
                  CustomTextIcon(
                      trailingIcon: IconButton(
                        onPressed: () => pickAndUploadImage(),
                        icon: const Icon(
                          CustomIcons.docAdd,
                          color: CustomColors.buttonColor,
                        ),
                      ),
                      label: const Text(
                        "Attachment",
                        style: TextStyle(
                          color: CustomColors.textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
