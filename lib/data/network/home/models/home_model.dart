class PropertyModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String location;
  final String imageUrl;
  final bool isFeatured;
  final String category;
  final double rating;

  PropertyModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.location,
    required this.imageUrl,
    this.isFeatured = false,
    required this.category,
    this.rating = 0.0,
  });

  // Convert JSON to PropertyModel
  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      area: (json['area'] ?? 0).toDouble(),
      location: json['location'] ?? '',
      imageUrl: json['image_url'] ?? '',
      isFeatured: json['is_featured'] ?? false,
      category: json['category'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
    );
  }

  // Convert PropertyModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'area': area,
      'location': location,
      'image_url': imageUrl,
      'is_featured': isFeatured,
      'category': category,
      'rating': rating,
    };
  }

  // Create a copy of this PropertyModel with optional new values
  PropertyModel copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    int? bedrooms,
    int? bathrooms,
    double? area,
    String? location,
    String? imageUrl,
    bool? isFeatured,
    String? category,
    double? rating,
  }) {
    return PropertyModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      area: area ?? this.area,
      location: location ?? this.location,
      imageUrl: imageUrl ?? this.imageUrl,
      isFeatured: isFeatured ?? this.isFeatured,
      category: category ?? this.category,
      rating: rating ?? this.rating,
    );
  }
} 