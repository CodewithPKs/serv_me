class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? qunatity;
  bool? isExist;
  String? time;

  CartModel(
      {
        this.id,
        this.name,
        this.price,
        this.img,
        this.qunatity,
        this.isExist,
        this.time
        });

 CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    qunatity = json['qunatity'];
    isExist = json['isExist'];
    time = json['time'];
  }

}