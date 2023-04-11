class SortBar {
  String title;
  String value;

  SortBar({required this.title, required this.value});

  SortBar.fromJson(Map<String, dynamic> json)
      : value = json["value"],
        title = json["title"];
}
