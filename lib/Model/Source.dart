/// id : "bbc-sport"
/// name : "BBC Sport"
/// description : "The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games."
/// url : "http://www.bbc.co.uk/sport"
/// category : "sports"
/// language : "en"
/// country : "gb"

class Source {
  Source({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _url = url;
    _category = category;
    _language = language;
    _country = country;
  }

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _url = json['url'];
    _category = json['category'];
    _language = json['language'];
    _country = json['country'];
  }
  String? _id;
  String? _name;
  String? _description;
  String? _url;
  String? _category;
  String? _language;
  String? _country;
  Source copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) =>
      Source(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        url: url ?? _url,
        category: category ?? _category,
        language: language ?? _language,
        country: country ?? _country,
      );
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get url => _url;
  String? get category => _category;
  String? get language => _language;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['url'] = _url;
    map['category'] = _category;
    map['language'] = _language;
    map['country'] = _country;
    return map;
  }
}
