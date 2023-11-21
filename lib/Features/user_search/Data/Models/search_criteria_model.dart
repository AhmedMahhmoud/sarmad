class SearchCriteriaModel {
  String? fName;
  String? mName;
  String? nat;
  SearchCriteriaModel({this.fName, this.mName, this.nat});
  toJson() {
    return {'fname': fName, 'mname': mName, 'nat': nat};
  }
}
