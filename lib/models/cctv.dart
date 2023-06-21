class ResponseResult {
  int status;
  List<Cctv> data;
  
  ResponseResult({
    required this.status,
    required this.data,
  });
  
  factory ResponseResult.fromJson(Map<String, dynamic> json) => ResponseResult(
    status: json["status"],
    data: List<Cctv>.from(json["data"].map((x) => Cctv.fromJson(x))),
  );
}


class Cctv {
  final String cctvName;
  final String cctvLocation;
  final String latitude;
  final String longitude;
  final String thumbnail;
  final String linkRtmp;
  
  Cctv({
    required this.cctvName,
    required this.cctvLocation,
    required this.latitude,
    required this.longitude,
    required this.thumbnail,
    required this.linkRtmp,
  });
  
  factory Cctv.fromJson(Map<String, dynamic> json) => Cctv(
    cctvName: json["nama_cctv"],
    cctvLocation: json["lokasi_cctv"],
    latitude: json["lat"],
    longitude: json["lng"],
    thumbnail: json["thumbnail"],
    linkRtmp: json["link_rtmp"],
  );
  
  factory Cctv.dummy() {
    return Cctv(
      cctvName: "CCTV Asia Toserba",
      cctvLocation: "ciwalen",
      latitude: "lat",
      longitude: "lng",
      thumbnail: "http://garutkab.go.id/admin/",
      linkRtmp: "http://103.134.85.81/r7c97OBE4VgqEnfRa5DSVDsPMjULCf/mp4/diskominfo/NkR1JvftY0/s.mp4",
    );
  }
}
