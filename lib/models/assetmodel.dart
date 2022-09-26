import 'dart:convert';

class AssetModel {
  String name;
  String balance;
  String imageURL;
  String symbol;
  AssetModel({
    required this.name,
    required this.balance,
    required this.imageURL,
    required this.symbol,
  });

  AssetModel copyWith({
    String? name,
    String? balance,
    String? imageURL,
    String? symbol,
  }) {
    return AssetModel(
      name: name ?? this.name,
      balance: balance ?? this.balance,
      imageURL: imageURL ?? this.imageURL,
      symbol: symbol ?? this.symbol,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'balance': balance,
      'imageURL': imageURL,
      'symbol': symbol,
    };
  }

  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      name: map['name'] ?? '',
      balance: map['balance'] ?? '',
      imageURL: map['imageURL'] ?? '',
      symbol: map['symbol'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AssetModel.fromJson(String source) =>
      AssetModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AssetModel(name: $name, balance: $balance, imageURL: $imageURL, symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AssetModel &&
        other.name == name &&
        other.balance == balance &&
        other.imageURL == imageURL &&
        other.symbol == symbol;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        balance.hashCode ^
        imageURL.hashCode ^
        symbol.hashCode;
  }
}
