

class CategoriesModel {
  final int? id;
  final String name;


  CategoriesModel({
    this.id,
    required this.name,

  });

  CategoriesModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"];


  Map<String, Object?> toMap() {
    return {'id':id, 'name': name};
  }
}


