enum EIncomeType {
  business("Business"),
  salary("Salary"),
  dividends("Dividends"),
  investment("Investment"),
  rent("Rent"),
  freelance("Freelance"),
  royalty("Royalty"),
  passive("Passive"),
  ;

  const EIncomeType(this.text);
  final String text;
}

class IncomeItem {
  String? description;
  EIncomeType? type;
  double? cost;
  DateTime? date;

  IncomeItem({this.description, this.cost, this.type, this.date});

  factory IncomeItem.fromJson(Map<String, dynamic> parsedJson) {
    return IncomeItem(
        description: parsedJson['description'] ?? "",
        cost: parsedJson['cost'] ?? "",
        type: EIncomeType.values.byName(parsedJson['type']),
        date: DateTime.tryParse(parsedJson['date']));
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "cost": cost,
      "type": type!.name,
      "date": date.toString(),
    };
  }
}
