
class SomethingApiDTO {
  final int id;
  final String name;

  const SomethingApiDTO({
    required this.id,
    required this.name,
  });

  static SomethingApiDTO fromJson(json) {
    return SomethingApiDTO(id: json['id'], name: json['name']);
  }
}
