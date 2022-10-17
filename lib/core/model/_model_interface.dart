import 'package:m_hany_store/core/model/category_model.dart';
import 'package:m_hany_store/core/model/item_model.dart';

class ModelClass {
  final String collection;
  final Function factory;

  const ModelClass({
    required this.collection,
    required this.factory,
  });
}

class ModelInterface {

  static ModelClass? getModelClass(Type type) {
    return _models.entries.firstWhere((element) => element.key == type).value;
  }

  static const Map<Type, ModelClass> _models = {
    ItemModel:     ModelClass(collection: 'items', factory: ItemModel.formJson),
    CategoryModel: ModelClass(collection: 'categories', factory: CategoryModel.fromJson),
  };
}