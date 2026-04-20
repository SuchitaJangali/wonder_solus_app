

class PlaceModel {
  final String description;
  final String placeId;
  final StructuredFormatting structuredFormatting;

  PlaceModel({
    required this.description,
    required this.placeId,
    required this.structuredFormatting,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      description: json['description'],
      placeId: json['place_id'],
      structuredFormatting: StructuredFormatting.fromJson(
        json['structured_formatting'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'place_id': placeId,
      'structured_formatting': structuredFormatting.toJson(),
    };
  }
}

class StructuredFormatting {
  final String mainText;
  final String secondaryText;

  StructuredFormatting({required this.mainText, required this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'],
      secondaryText: json['secondary_text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'main_text': mainText, 'secondary_text': secondaryText};
  }
}
