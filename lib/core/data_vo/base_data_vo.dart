abstract class IDataVO {
  Map<String, dynamic> toJson();
}

abstract class DataVO implements IDataVO {
  final String? id;

  DataVO({
    this.id,
  });
}
