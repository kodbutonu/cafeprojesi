

class menu_entity {
  final String id;
  final String isim;
  final String gorsel;
  final DateTime created;

  menu_entity({
    required this.id,
    required this.isim,
    required this.gorsel,
    required this.created
  });

  factory menu_entity.fromJson(Map<String, dynamic> json) {

    if(json['gorsel'] == "")
      json['gorsel'] = 'https://cdns.iconmonstr.com/wp-content/assets/preview/2012/240/iconmonstr-check-mark-1.png';

    return menu_entity(
      id: json['id'],
      isim: json['isim'],
      gorsel: json['gorsel'],
      created: DateTime.parse(json['created'])
    );
  }

}

class MenuResponse {
  final List<menu_entity> data;
  final int count;

  MenuResponse({
    required this.data,
    required this.count
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) {
    return MenuResponse(
      data: (json['data'] as List).map((i){
        return menu_entity.fromJson(i);
      }).toList(),
      count: json['count']
    );
  }
}