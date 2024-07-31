class BeautyModal {
  List<ProductModal> product = [];

  BeautyModal({required this.product});

  factory BeautyModal.fromJson(Map m1) {
    return BeautyModal(
        product: (m1['products'] as List)
            .map(
              (e) => ProductModal.fromJson(e),
            )
            .toList());
  }
}

class ProductModal {
  String title, description, category;
  String? brand;
  dynamic price, discountPercentage, rating;
  List tags = [], images = [];
  List<ReviewModal> reviews = [];

  ProductModal(
      {required this.title,
      required this.description,
      required this.category,
      this.brand,
      required this.price,
      required this.rating,
      required this.discountPercentage,
      required this.tags,
      required this.images,
      required this.reviews});

  factory ProductModal.fromJson(Map m1) {
    return ProductModal(
      title: m1['title'],
      description: m1['description'],
      category: m1['category'],
      brand: m1['brand'] ?? 'Essence',
      price: m1['price'],
      rating: m1['rating'],
      discountPercentage: m1['discountPercentage'],
      tags: m1['tags'],
      images: m1['images'],
      reviews:
          (m1['reviews'] as List).map((e) => ReviewModal.fromJson(e)).toList(),
    );
  }

  dynamic operator [](String key) {
    switch (key) {
      case 'title':
        return title;
      case 'price':
        return price;
      case 'discountPercentage':
        return discountPercentage;
      case 'images':
        return images;
      default:
        throw ArgumentError('Property $key not found');
    }
  }
}

class ReviewModal {
  late int rating;
  late String comment, date, reviewerName, reviewerEmail;

  ReviewModal(
      {required this.rating,
      required this.comment,
      required this.date,
      required this.reviewerName,
      required this.reviewerEmail});

  factory ReviewModal.fromJson(Map m1) {
    return ReviewModal(
        rating: m1['rating'],
        comment: m1['comment'],
        date: m1['date'],
        reviewerName: m1['reviewerName'],
        reviewerEmail: m1['reviewerEmail']);
  }
}
