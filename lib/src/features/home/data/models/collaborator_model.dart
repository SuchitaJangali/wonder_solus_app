import '../../domain/entities/collaborator_entity.dart';

class CollaboratorModel extends CollaboratorEntity {
  CollaboratorModel({
    required super.userName,
    required super.userEmail,
    required super.permissionLevel,
    super.addedAt,
  });

  factory CollaboratorModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CollaboratorModel(
        userName: "",
        userEmail: "",
        permissionLevel: "viewer",
        addedAt: null,
      );
    }

    return CollaboratorModel(
      userName: json['userName'] ?? "",
      userEmail: json['userEmail'] ?? "",
      permissionLevel: json['permissionLevel'] ?? "viewer",
      addedAt: json['addedAt'] != null
          ? DateTime.tryParse(json['addedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "userEmail": userEmail,
      "permissionLevel": permissionLevel,
      "addedAt": addedAt?.toIso8601String(),
    };
  }
}
