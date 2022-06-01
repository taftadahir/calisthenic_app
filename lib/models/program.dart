class Program {
  final int id;
  final String name;
  final int days;
  final String? images;
  final String? description;
  final String? tips;

  Program({
    required this.id,
    required this.name,
    required this.days,
    this.images,
    this.description,
    this.tips,
  });
}
