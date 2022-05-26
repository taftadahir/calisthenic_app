class Program {
  final int id;
  final String name;
  final int days;
  final String? images;

  Program({
    required this.id,
    required this.name,
    required this.days,
    this.images,
  });
}