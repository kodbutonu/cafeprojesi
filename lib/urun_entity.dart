class UrunEntity {
  final String id;
  final String isim;
  final String gorsel;
  final double fiyat;
  final bool aktif;
  final String menuId;
  final DateTime created;

  UrunEntity(
      {required this.id,
      required this.isim,
      required this.gorsel,
      required this.fiyat,
      required this.aktif,
      required this.menuId,
      required this.created});

  factory UrunEntity.fromJson(Map<String, dynamic> json) {
    if (json['gorsel'] == null || json['gorsel'] == "")
      json['gorsel'] =
          'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-check-mark-1.png';

    return UrunEntity(
        id: json['id'],
        isim: json['isim'],
        gorsel: json['gorsel'],
        fiyat: double.parse(json['fiyat']),
        aktif: json['aktif'] == "1",
        menuId: json['menu_id'],
        created: DateTime.parse(json['created']));
  }
}
