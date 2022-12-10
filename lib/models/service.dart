class Service {
  late String isAggregated;
  late String serviceID;
  late String serviceName;

  Service(
      {required this.isAggregated,
      required this.serviceID,
      required this.serviceName});

 static String selectedService = "";
  static setSelectedService(String value){
    selectedService = value;
  }

  // factory Service.from(List<Map<String, dynamic>> json) {
  //   List<String> serviceList = List.empty(growable: true);
  //   json.map((e) => serviceList.add(e["serviceName"]));
  //
  //   return serviceList;
  // }

  static List<String> serviceList(List<Map<String, dynamic>> json) {
    List<String> serviceList = List.empty(growable: true);
    json.map((e) => serviceList.add(e["serviceName"] as String));

    return serviceList;
  }
}
