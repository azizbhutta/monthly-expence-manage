

import 'package:flutter/cupertino.dart';

class CategoriesModel {
  final int? id;
  final String name;
  final Icon? icon;


  CategoriesModel({
    this.id,
    required this.name,
    required this.icon,

  });

  CategoriesModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        icon = res["icon"];


  Map<String, Object?> toMap() {
    return {'id':id, 'name': name, 'icon': icon};
  }
}


