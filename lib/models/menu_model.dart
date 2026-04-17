class MenuModel {
  String urlImage;
  String title;
  String subtitle;
  double price;

  MenuModel({
    required this.urlImage,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}

List<MenuModel> listMenuModel = [
  MenuModel(
    urlImage:
        "https://images.pexels.com/photos/28503582/pexels-photo-28503582.jpeg",
    title: "Menú 1",
    subtitle: "Lun - Mar - Mier",
    price: 5.0,
  ),
  MenuModel(
    urlImage:
        "https://images.pexels.com/photos/28490807/pexels-photo-28490807.jpeg",
    title: "Menú 2",
    subtitle: "Mar - Mier",
    price: 8.2,
  ),
  MenuModel(
    urlImage:
        "https://images.pexels.com/photos/28490842/pexels-photo-28490842.jpeg",
    title: "Menú 3",
    subtitle: "Vier - Sáb - Dom",
    price: 10.5,
  ),
  MenuModel(
    urlImage:
        "https://images.pexels.com/photos/16811678/pexels-photo-16811678.jpeg",
    title: "Menú 4",
    subtitle: "Dom",
    price: 15.5,
  ),
];
