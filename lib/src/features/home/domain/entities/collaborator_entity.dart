class CollaboratorEntity {
  final String userName;
  final String userEmail;
  final String permissionLevel;
  final DateTime? addedAt;

  const CollaboratorEntity({
    required this.userName,
    required this.userEmail,
    required this.permissionLevel,
    this.addedAt,
  });

  CollaboratorEntity copyWith({
    String? userName,
    String? userEmail,
    String? permissionLevel,
  }) {
    return CollaboratorEntity(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      permissionLevel: permissionLevel ?? this.permissionLevel,
    );
  }
}
