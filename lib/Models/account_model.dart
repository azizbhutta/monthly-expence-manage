

class AccountModel {
  final int? id;
  final String name;
  final int amount;

  AccountModel({
    this.id,
    required this.name,
    required this.amount,
  });

  AccountModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        amount = res["amount"];

  Map<String, Object?> toMap() {
    return {'id':id, 'name': name, 'amount': amount};
  }
}


