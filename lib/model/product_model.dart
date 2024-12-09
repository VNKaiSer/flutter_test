class ProductModel {
  final int id;
  final String image;
  final String timePosted;
  final double price;
  final String address;
  final int numberOfBeds;
  final int numberOfBaths;
  final String sqf;
  final String type;
  final bool isReserved;

  ProductModel({
    required this.id,
    required this.image,
    required this.timePosted,
    required this.price,
    required this.address,
    required this.numberOfBeds,
    required this.numberOfBaths,
    required this.sqf,
    required this.type,
    required this.isReserved,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['image'],
      timePosted: json['timePosted'],
      price: json['price'],
      address: json['address'],
      numberOfBeds: json['nunberOfBeds'],
      numberOfBaths: json['numberOfBaths'],
      sqf: json['sqf'],
      type: json['type'],
      isReserved: json['isReserved'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'timePosted': timePosted,
      'price': price,
      'address': address,
      'nunberOfBeds': numberOfBeds,
      'numberOfBaths': numberOfBaths,
      'sqf': sqf,
      'type': type,
      'isReserved': isReserved,
    };
  }
}
