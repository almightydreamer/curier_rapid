class SomethingLocalDTO {
  final int id;
  final String name;

  const SomethingLocalDTO({
    required this.id,
    required this.name,
  });

  static SomethingLocalDTO fromJson(json) => SomethingLocalDTO(
        id: json['id'],
        name: json['name'],
      );
}
