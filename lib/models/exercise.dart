class Exercise {
  final int id;
  final String name;
  final String? images;
  final String? description;
  final String? tips;

  Exercise({
    required this.id,
    required this.name,
    this.images,
    this.description,
    this.tips,
  });
}
