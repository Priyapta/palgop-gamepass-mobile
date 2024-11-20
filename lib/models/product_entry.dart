import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
    json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String model;
  String pk;
  Fields fields;

  ProductEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String itemName;
  String itemDescription;
  String itemPrice;
  // Add this if it exists in the JSON

  Fields({
    required this.user,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        itemName: json["item_name"],
        itemDescription: json["item_description"],
        itemPrice: json["item_price"],
        // Provide default if missing
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "item_name": itemName,
        "item_description": itemDescription,
        "item_price": itemPrice,
      };
}
