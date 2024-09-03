// notification model

class NotificationModel {
  final String title;
  final String description;
  final bool isAdminViewer;
  final bool isParentViewer;
  final bool isRegularViewer;

  NotificationModel({
    required this.title,
    required this.description,
    this.isAdminViewer = false,
    this.isParentViewer = false,
    this.isRegularViewer = false,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'is_admin_viewer': isAdminViewer,
        'is_parent_viewer': isParentViewer,
        'is_regular_viewer': isRegularViewer,
      };
}
