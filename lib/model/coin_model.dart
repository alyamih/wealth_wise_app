import 'dart:convert';

List<Coin> coinFromJson(String str) =>
    List<Coin>.from(json.decode(str).map((x) => Coin.fromJson(x)));

String coinToJson(List<Coin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coin {
  Coin({
    required this.id,
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
  });

  String id;
  String symbol;
  String name;
  double currentPrice;
  double priceChange24H;
  double priceChangePercentage24H;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        currentPrice: json["current_price"]?.toDouble(),
        priceChange24H: json["price_change_24h"]?.toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "current_price": currentPrice,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
      };
}
