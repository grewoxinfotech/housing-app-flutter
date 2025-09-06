// class PropertyModel {
//   bool? success;
//   PropertyMessage? message;
//   dynamic data;
//
//   PropertyModel({this.success, this.message, this.data});
//
//   PropertyModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'] != null
//         ? PropertyMessage.fromJson(json['message'])
//         : null;
//     data = json['data'];
//   }
//
//   Map<String, dynamic> toJson() => {
//     'success': success,
//     'message': message?.toJson(),
//     'data': data,
//   };
// }
//
// class PropertyMessage {
//   List<Items>? data;
//   Pagination? pagination;
//
//   PropertyMessage({this.data, this.pagination});
//
//   PropertyMessage.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = List<Items>.from(
//           (json['data'] as List).map((x) => Items.fromJson(x)));
//     }
//     pagination = json['pagination'] != null
//         ? Pagination.fromJson(json['pagination'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() => {
//     'data': data?.map((v) => v.toJson()).toList(),
//     'pagination': pagination?.toJson(),
//   };
// }
//
// class Pagination {
//   int? total;
//   int? current;
//   int? pageSize;
//   int? totalPages;
//   bool? hasMore;
//
//   Pagination({this.total, this.current, this.pageSize, this.totalPages, this.hasMore});
//
//   Pagination.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     current = json['current'] ?? json['currentPage'];
//     pageSize = json['pageSize'];
//     totalPages = json['totalPages'];
//     hasMore = json['hasMore'];
//   }
//
//   Map<String, dynamic> toJson() => {
//     'total': total,
//     'current': current,
//     'pageSize': pageSize,
//     'totalPages': totalPages,
//     'hasMore': hasMore,
//   };
// }
//
// class Items {
//   PropertyMedia? propertyMedia;
//   String? id;
//   String? createdBy;
//   String? updatedBy;
//   String? title;
//   String? type;
//   String? listingType;
//   String? propertyType;
//   String? propertyDescription;
//   List<String>? keywords;
//   List<String>? propertyImages;
//   PropertyDetails? propertyDetails;
//   String? address;
//   String? city;
//   String? state;
//   String? zipCode;
//   Location? location;
//   List<NearbyLocations>? nearbyLocations;
//   String? reraId;
//   String? propertyStatus;
//   String? builderName;
//   String? projectName;
//   String? ownerPhone;
//   String? ownerName;
//   String? ownerEmail;
//   bool? isVerified;
//   String? verifiedBy;
//   String? verifiedAt;
//   int? totalInquiries;
//   int? totalViews;
//   String? approvalStatus;
//   String? approvalComment;
//   String? approvedBy;
//   String? approvedAt;
//   int? totalFavorites;
//   int? totalShares;
//   int? totalVisits;
//   int? totalSales;
//   String? totalCommissions;
//   String? assignedTo;
//   String? assignmentDate;
//   String? assignmentExpiryDate;
//   String? potentialEarnings;
//   String? assignmentStatus;
//   String? performanceScore;
//   String? expiryDate;
//   String? lastRenewalDate;
//   int? renewalCount;
//   bool? isExpired;
//   int? totalReports;
//   bool? isHiddenDueToReports;
//   String? lastReportedAt;
//   String? createdAt;
//   String? updatedAt;
//
//   Items({
//     this.propertyMedia,
//     this.id,
//     this.createdBy,
//     this.updatedBy,
//     this.title,
//     this.type,
//     this.listingType,
//     this.propertyType,
//     this.propertyDescription,
//     this.keywords,
//     this.propertyImages,
//     this.propertyDetails,
//     this.address,
//     this.city,
//     this.state,
//     this.zipCode,
//     this.location,
//     this.nearbyLocations,
//     this.reraId,
//     this.propertyStatus,
//     this.builderName,
//     this.projectName,
//     this.ownerPhone,
//     this.ownerName,
//     this.ownerEmail,
//     this.isVerified,
//     this.verifiedBy,
//     this.verifiedAt,
//     this.totalInquiries,
//     this.totalViews,
//     this.approvalStatus,
//     this.approvalComment,
//     this.approvedBy,
//     this.approvedAt,
//     this.totalFavorites,
//     this.totalShares,
//     this.totalVisits,
//     this.totalSales,
//     this.totalCommissions,
//     this.assignedTo,
//     this.assignmentDate,
//     this.assignmentExpiryDate,
//     this.potentialEarnings,
//     this.assignmentStatus,
//     this.performanceScore,
//     this.expiryDate,
//     this.lastRenewalDate,
//     this.renewalCount,
//     this.isExpired,
//     this.totalReports,
//     this.isHiddenDueToReports,
//     this.lastReportedAt,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   Items.fromJson(Map<String, dynamic> json) {
//     propertyMedia =
//         json['propertyMedia'] != null
//             ? PropertyMedia.fromJson(json['propertyMedia'])
//             : null;
//     id = json['id'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     title = json['title'];
//     type = json['type'];
//     listingType = json['listingType'];
//     propertyType = json['propertyType'];
//     propertyDescription = json['propertyDescription'];
//     keywords =
//         json['keywords'] != null ? List<String>.from(json['keywords']) : null;
//     propertyImages =
//         json['propertyImages'] != null
//             ? List<String>.from(json['propertyImages'])
//             : null;
//     propertyDetails =
//         json['propertyDetails'] != null
//             ? PropertyDetails.fromJson(json['propertyDetails'])
//             : null;
//     address = json['address'];
//     city = json['city'];
//     state = json['state'];
//     zipCode = json['zipCode'];
//     location =
//         json['location'] != null ? Location.fromJson(json['location']) : null;
//     if (json['nearbyLocations'] != null) {
//       nearbyLocations = <NearbyLocations>[];
//       json['nearbyLocations'].forEach((v) {
//         nearbyLocations!.add(NearbyLocations.fromJson(v));
//       });
//     }
//     reraId = json['reraId'];
//     propertyStatus = json['property_status'];
//     builderName = json['builderName'];
//     projectName = json['projectName'];
//     ownerPhone = json['ownerPhone'];
//     ownerName = json['ownerName'];
//     ownerEmail = json['ownerEmail'];
//     isVerified = json['isVerified'];
//     verifiedBy = json['verifiedBy'];
//     verifiedAt = json['verifiedAt'];
//     totalInquiries = json['totalInquiries'];
//     totalViews = json['totalViews'];
//     approvalStatus = json['approval_status'];
//     approvalComment = json['approval_comment'];
//     approvedBy = json['approved_by'];
//     approvedAt = json['approved_at'];
//     totalFavorites = json['totalFavorites'];
//     totalShares = json['totalShares'];
//     totalVisits = json['totalVisits'];
//     totalSales = json['totalSales'];
//     totalCommissions = json['totalCommissions'];
//     assignedTo = json['assignedTo'];
//     assignmentDate = json['assignmentDate'];
//     assignmentExpiryDate = json['assignmentExpiryDate'];
//     potentialEarnings = json['potentialEarnings'];
//     assignmentStatus = json['assignmentStatus'];
//     performanceScore = json['performanceScore'];
//     expiryDate = json['expiryDate'];
//     lastRenewalDate = json['lastRenewalDate'];
//     renewalCount = json['renewalCount'];
//     isExpired = json['isExpired'];
//     totalReports = json['totalReports'];
//     isHiddenDueToReports = json['isHiddenDueToReports'];
//     lastReportedAt = json['lastReportedAt'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     if (propertyMedia != null) data['propertyMedia'] = propertyMedia!.toJson();
//     data['id'] = id;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     data['title'] = title;
//     data['type'] = type;
//     data['listingType'] = listingType;
//     data['propertyType'] = propertyType;
//     data['propertyDescription'] = propertyDescription;
//     data['keywords'] = keywords;
//     data['propertyImages'] = propertyImages;
//     if (propertyDetails != null)
//       data['propertyDetails'] = propertyDetails!.toJson();
//     data['address'] = address;
//     data['city'] = city;
//     data['state'] = state;
//     data['zipCode'] = zipCode;
//     if (location != null) data['location'] = location!.toJson();
//     if (nearbyLocations != null)
//       data['nearbyLocations'] =
//           nearbyLocations!.map((v) => v.toJson()).toList();
//     data['reraId'] = reraId;
//     data['property_status'] = propertyStatus;
//     data['builderName'] = builderName;
//     data['projectName'] = projectName;
//     data['ownerPhone'] = ownerPhone;
//     data['ownerName'] = ownerName;
//     data['ownerEmail'] = ownerEmail;
//     data['isVerified'] = isVerified;
//     data['verifiedBy'] = verifiedBy;
//     data['verifiedAt'] = verifiedAt;
//     data['totalInquiries'] = totalInquiries;
//     data['totalViews'] = totalViews;
//     data['approval_status'] = approvalStatus;
//     data['approval_comment'] = approvalComment;
//     data['approved_by'] = approvedBy;
//     data['approved_at'] = approvedAt;
//     data['totalFavorites'] = totalFavorites;
//     data['totalShares'] = totalShares;
//     data['totalVisits'] = totalVisits;
//     data['totalSales'] = totalSales;
//     data['totalCommissions'] = totalCommissions;
//     data['assignedTo'] = assignedTo;
//     data['assignmentDate'] = assignmentDate;
//     data['assignmentExpiryDate'] = assignmentExpiryDate;
//     data['potentialEarnings'] = potentialEarnings;
//     data['assignmentStatus'] = assignmentStatus;
//     data['performanceScore'] = performanceScore;
//     data['expiryDate'] = expiryDate;
//     data['lastRenewalDate'] = lastRenewalDate;
//     data['renewalCount'] = renewalCount;
//     data['isExpired'] = isExpired;
//     data['totalReports'] = totalReports;
//     data['isHiddenDueToReports'] = isHiddenDueToReports;
//     data['lastReportedAt'] = lastReportedAt;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     return data;
//   }
// }
//
// class PropertyMedia {
//   List<String>? images;
//   List<String>? videos;
//
//   PropertyMedia({this.images, this.videos});
//
//   PropertyMedia.fromJson(Map<String, dynamic> json) {
//     images = json['images']?.cast<String>();
//     videos = json['videos']?.cast<String>();
//   }
//
//   Map<String, dynamic> toJson() => {'images': images, 'videos': videos};
// }
//
// class PropertyDetails {
//   int? bhk;
//   int? balcony;
//   int? bathroom;
//   List<String>? amenities;
//   String? zoneType;
//   FloorInfo? floorInfo;
//   FurnishInfo? furnishInfo;
//   ParkingInfo? parkingInfo;
//   FinancialInfo? financialInfo;
//   PossessionInfo? possessionInfo;
//   String? propertyFacing;
//   String? propertyCondition;
//   double? propertyCarpetArea;
//   double? propertyBuiltUpArea;
//
//   PropertyDetails({
//     this.bhk,
//     this.balcony,
//     this.bathroom,
//     this.amenities,
//     this.zoneType,
//     this.floorInfo,
//     this.furnishInfo,
//     this.parkingInfo,
//     this.financialInfo,
//     this.possessionInfo,
//     this.propertyFacing,
//     this.propertyCondition,
//     this.propertyCarpetArea,
//     this.propertyBuiltUpArea,
//   });
//
//   PropertyDetails.fromJson(Map<String, dynamic> json) {
//     bhk = json['bhk'] is int ? json['bhk'] : int.tryParse(json['bhk']?.toString() ?? '0');
//     balcony = json['balcony'] is int ? json['balcony'] : int.tryParse(json['balcony']?.toString() ?? '0');
//     bathroom = json['bathroom'] is int ? json['bathroom'] : int.tryParse(json['bathroom']?.toString() ?? '0');
//     amenities = json['amenities']?.cast<String>();
//     zoneType = json['zone_type'];
//     floorInfo =
//         json['floor_info'] != null
//             ? FloorInfo.fromJson(json['floor_info'])
//             : null;
//     furnishInfo =
//         json['furnish_info'] != null
//             ? FurnishInfo.fromJson(json['furnish_info'])
//             : null;
//     parkingInfo =
//         json['parking_info'] != null
//             ? ParkingInfo.fromJson(json['parking_info'])
//             : null;
//     financialInfo =
//         json['financial_info'] != null
//             ? FinancialInfo.fromJson(json['financial_info'])
//             : null;
//     possessionInfo =
//         json['possession_info'] != null
//             ? PossessionInfo.fromJson(json['possession_info'])
//             : null;
//     propertyFacing = json['property_facing'];
//     propertyCondition = json['property_condition'];
//     propertyCarpetArea = TypeConverter.parseDouble(json['property_carpet_area'] );
//     propertyBuiltUpArea = TypeConverter.parseDouble(json['property_built_up_area'] );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['bhk'] = bhk;
//     data['balcony'] = balcony;
//     data['bathroom'] = bathroom;
//     data['amenities'] = amenities;
//     data['zone_type'] = zoneType;
//     if (floorInfo != null) data['floor_info'] = floorInfo!.toJson();
//     if (furnishInfo != null) data['furnish_info'] = furnishInfo!.toJson();
//     if (parkingInfo != null) data['parking_info'] = parkingInfo!.toJson();
//     if (financialInfo != null) data['financial_info'] = financialInfo!.toJson();
//     if (possessionInfo != null)
//       data['possession_info'] = possessionInfo!.toJson();
//     data['property_facing'] = propertyFacing;
//     data['property_condition'] = propertyCondition;
//     data['property_carpet_area'] = propertyCarpetArea;
//     data['property_built_up_area'] = propertyBuiltUpArea;
//     return data;
//   }
//
// }
//
// class FloorInfo {
//   int? floorNumber;
//   int? totalFloors;
//
//   FloorInfo({this.floorNumber, this.totalFloors});
//
//   FloorInfo.fromJson(Map<String, dynamic> json) {
//     floorNumber = json['floor_number'];
//     totalFloors = json['total_floors'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['floor_number'] = this.floorNumber;
//     data['total_floors'] = this.totalFloors;
//     return data;
//   }
// }
//
// class FurnishInfo {
//   String? furnishType;
//   FurnishDetails? furnishDetails;
//
//   FurnishInfo({this.furnishType, this.furnishDetails});
//
//   FurnishInfo.fromJson(Map<String, dynamic> json) {
//     furnishType = json['furnish_type'];
//     furnishDetails =
//         json['furnish_details'] != null
//             ? new FurnishDetails.fromJson(json['furnish_details'])
//             : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['furnish_type'] = this.furnishType;
//     if (this.furnishDetails != null) {
//       data['furnish_details'] = this.furnishDetails!.toJson();
//     }
//     return data;
//   }
// }
//
// class FurnishDetails {
//   int? bed;
//   int? fan;
//   String? other;
//   bool? balcony;
//   bool? kitchen;
//   bool? bathroom;
//
//   FurnishDetails({
//     this.bed,
//     this.fan,
//     this.other,
//     this.balcony,
//     this.kitchen,
//     this.bathroom,
//   });
//
//   FurnishDetails.fromJson(Map<String, dynamic> json) {
//     bed = json['bed'];
//     fan = json['fan'];
//     other = json['other'];
//     balcony = json['balcony'];
//     kitchen = json['kitchen'];
//     bathroom = json['bathroom'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['bed'] = this.bed;
//     data['fan'] = this.fan;
//     data['other'] = this.other;
//     data['balcony'] = this.balcony;
//     data['kitchen'] = this.kitchen;
//     data['bathroom'] = this.bathroom;
//     return data;
//   }
// }
//
// class ParkingInfo {
//   bool? openParking;
//   bool? coveredParking;
//
//   ParkingInfo({this.openParking, this.coveredParking});
//
//   ParkingInfo.fromJson(Map<String, dynamic> json) {
//     openParking = json['open_parking'];
//     coveredParking = json['covered_parking'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['open_parking'] = this.openParking;
//     data['covered_parking'] = this.coveredParking;
//     return data;
//   }
// }
//
//
// class FinancialInfo {
//   bool? negotiable;
//   double? propertyPrice;
//   double? brokerCommission;
//
//   FinancialInfo({this.negotiable, this.propertyPrice, this.brokerCommission});
//
//   FinancialInfo.fromJson(Map<String, dynamic> json) {
//     negotiable = json['negotiable'];
//     propertyPrice = TypeConverter.parseDouble(json['property_price']);
//     brokerCommission = TypeConverter.parseDouble(json['broker_commission'] );
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['negotiable'] = this.negotiable;
//     data['property_price'] = this.propertyPrice;
//     data['broker_commission'] = this.brokerCommission;
//     return data;
//   }
// }
//
// class PossessionInfo {
//   String? possessionStatus;
//   int? propertyAgeInYears;
//
//   PossessionInfo({this.possessionStatus, this.propertyAgeInYears});
//
//   PossessionInfo.fromJson(Map<String, dynamic> json) {
//     possessionStatus = json['possession_status'];
//     propertyAgeInYears = json['property_age_in_years'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['possession_status'] = this.possessionStatus;
//     data['property_age_in_years'] = this.propertyAgeInYears;
//     return data;
//   }
// }
//
// class Location {
//   double? latitude;
//   double? longitude;
//
//   Location({this.latitude, this.longitude});
//
//
//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       latitude: TypeConverter.parseDouble(json['latitude']),
//       longitude: TypeConverter.parseDouble(json['longitude']),
//     );
//   }
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     return data;
//   }
// }
//
// class NearbyLocations {
//   String? name;
//   String? distance;
//
//   NearbyLocations({this.name, this.distance});
//
//   NearbyLocations.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     distance = json['distance'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['distance'] = this.distance;
//     return data;
//   }
//
//
//
// }
//
// class TypeConverter{
//   static int? parseInt(dynamic value) {
//     if (value == null) return null;
//     if (value is int) return value;
//     if (value is double) return value.toInt();
//     if (value is String) return int.tryParse(value);
//     return null;
//   }
//
//   static double? parseDouble(dynamic value) {
//     if (value == null) return null;
//     if (value is double) return value;
//     if (value is int) return value.toDouble();
//     if (value is String) return double.tryParse(value);
//     return null;
//   }
//
// }
class PropertyModel {
  bool? success;
  PropertyMessage? message;
  dynamic data;

  PropertyModel({this.success, this.message, this.data});

  PropertyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] != null
        ? PropertyMessage.fromJson(json['message'] as Map<String, dynamic>)
        : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message?.toJson(),
    'data': data,
  };
}

class PropertyMessage {
  List<Items>? data;
  Pagination? pagination;

  PropertyMessage({this.data, this.pagination});

  PropertyMessage.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((x) => Items.fromJson(x as Map<String, dynamic>))
          .toList();
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() => {
    'data': data?.map((v) => v.toJson()).toList(),
    'pagination': pagination?.toJson(),
  };
}

class Pagination {
  int? total;
  int? current;
  int? pageSize;
  int? totalPages;
  bool? hasMore;

  Pagination(
      {this.total, this.current, this.pageSize, this.totalPages, this.hasMore});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = TypeConverter.parseInt(json['total']);
    current = TypeConverter.parseInt(json['current'] ?? json['currentPage']);
    pageSize = TypeConverter.parseInt(json['pageSize']);
    totalPages = TypeConverter.parseInt(json['totalPages']);
    hasMore = json['hasMore'] as bool?;
  }

  Map<String, dynamic> toJson() => {
    'total': total,
    'current': current,
    'pageSize': pageSize,
    'totalPages': totalPages,
    'hasMore': hasMore,
  };
}

class Items {
  PropertyMedia? propertyMedia;
  String? id;
  String? createdBy;
  String? updatedBy;
  String? title;
  String? type;
  String? listingType;
  String? propertyType;
  String? propertyDescription;
  List<String>? keywords;
  List<String>? propertyImages;
  PropertyDetails? propertyDetails;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  Location? location;
  List<NearbyLocations>? nearbyLocations;
  String? reraId;
  String? propertyStatus;
  String? builderName;
  String? projectName;
  String? ownerPhone;
  String? ownerName;
  String? ownerEmail;
  bool? isVerified;
  String? verifiedBy;
  String? verifiedAt;
  int? totalInquiries;
  int? totalViews;
  String? approvalStatus;
  String? approvalComment;
  String? approvedBy;
  String? approvedAt;
  int? totalFavorites;
  int? totalShares;
  int? totalVisits;
  int? totalSales;
  String? totalCommissions;
  String? assignedTo;
  String? assignmentDate;
  String? assignmentExpiryDate;
  String? potentialEarnings;
  String? assignmentStatus;
  String? performanceScore;
  String? expiryDate;
  String? lastRenewalDate;
  int? renewalCount;
  bool? isExpired;
  int? totalReports;
  bool? isHiddenDueToReports;
  String? lastReportedAt;
  String? createdAt;
  String? updatedAt;

  Items({
    this.propertyMedia,
    this.id,
    this.createdBy,
    this.updatedBy,
    this.title,
    this.type,
    this.listingType,
    this.propertyType,
    this.propertyDescription,
    this.keywords,
    this.propertyImages,
    this.propertyDetails,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.location,
    this.nearbyLocations,
    this.reraId,
    this.propertyStatus,
    this.builderName,
    this.projectName,
    this.ownerPhone,
    this.ownerName,
    this.ownerEmail,
    this.isVerified,
    this.verifiedBy,
    this.verifiedAt,
    this.totalInquiries,
    this.totalViews,
    this.approvalStatus,
    this.approvalComment,
    this.approvedBy,
    this.approvedAt,
    this.totalFavorites,
    this.totalShares,
    this.totalVisits,
    this.totalSales,
    this.totalCommissions,
    this.assignedTo,
    this.assignmentDate,
    this.assignmentExpiryDate,
    this.potentialEarnings,
    this.assignmentStatus,
    this.performanceScore,
    this.expiryDate,
    this.lastRenewalDate,
    this.renewalCount,
    this.isExpired,
    this.totalReports,
    this.isHiddenDueToReports,
    this.lastReportedAt,
    this.createdAt,
    this.updatedAt,
  });

  Items.fromJson(Map<String, dynamic> json) {
    propertyMedia = json['propertyMedia'] != null
        ? PropertyMedia.fromJson(json['propertyMedia'] as Map<String, dynamic>)
        : null;
    id = json['id'] as String?;
    createdBy = json['created_by'] as String?;
    updatedBy = json['updated_by'] as String?;
    title = json['title'] as String?;
    type = json['type'] as String?;
    listingType = json['listingType'] as String?;
    propertyType = json['propertyType'] as String?;
    propertyDescription = json['propertyDescription'] as String?;
    keywords = (json['keywords'] as List?)?.map((e) => e as String).toList();
    propertyImages =
        (json['propertyImages'] as List?)?.map((e) => e as String).toList();
    propertyDetails = json['propertyDetails'] != null
        ? PropertyDetails.fromJson(json['propertyDetails'] as Map<String, dynamic>)
        : null;
    address = json['address'] as String?;
    city = json['city'] as String?;
    state = json['state'] as String?;
    zipCode = json['zipCode'] as String?;
    location = json['location'] != null
        ? Location.fromJson(json['location'] as Map<String, dynamic>)
        : null;
    nearbyLocations = json['nearbyLocations'] != null
        ? (json['nearbyLocations'] as List)
        .map((v) => NearbyLocations.fromJson(v as Map<String, dynamic>))
        .toList()
        : null;
    reraId = json['reraId'] as String?;
    propertyStatus = json['property_status'] as String?;
    builderName = json['builderName'] as String?;
    projectName = json['projectName'] as String?;
    ownerPhone = json['ownerPhone'] as String?;
    ownerName = json['ownerName'] as String?;
    ownerEmail = json['ownerEmail'] as String?;
    isVerified = json['isVerified'] as bool?;
    verifiedBy = json['verifiedBy'] as String?;
    verifiedAt = json['verifiedAt'] as String?;
    totalInquiries = TypeConverter.parseInt(json['totalInquiries']);
    totalViews = TypeConverter.parseInt(json['totalViews']);
    approvalStatus = json['approval_status'] as String?;
    approvalComment = json['approval_comment'] as String?;
    approvedBy = json['approved_by'] as String?;
    approvedAt = json['approved_at'] as String?;
    totalFavorites = TypeConverter.parseInt(json['totalFavorites']);
    totalShares = TypeConverter.parseInt(json['totalShares']);
    totalVisits = TypeConverter.parseInt(json['totalVisits']);
    totalSales = TypeConverter.parseInt(json['totalSales']);
    totalCommissions = json['totalCommissions'] as String?;
    assignedTo = json['assignedTo'] as String?;
    assignmentDate = json['assignmentDate'] as String?;
    assignmentExpiryDate = json['assignmentExpiryDate'] as String?;
    potentialEarnings = json['potentialEarnings'] as String?;
    assignmentStatus = json['assignmentStatus'] as String?;
    performanceScore = json['performanceScore'] as String?;
    expiryDate = json['expiryDate'] as String?;
    lastRenewalDate = json['lastRenewalDate'] as String?;
    renewalCount = TypeConverter.parseInt(json['renewalCount']);
    isExpired = json['isExpired'] as bool?;
    totalReports = TypeConverter.parseInt(json['totalReports']);
    isHiddenDueToReports = json['isHiddenDueToReports'] as bool?;
    lastReportedAt = json['lastReportedAt'] as String?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (propertyMedia != null) data['propertyMedia'] = propertyMedia!.toJson();
    data['id'] = id;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['title'] = title;
    data['type'] = type;
    data['listingType'] = listingType;
    data['propertyType'] = propertyType;
    data['propertyDescription'] = propertyDescription;
    data['keywords'] = keywords;
    data['propertyImages'] = propertyImages;
    if (propertyDetails != null) data['propertyDetails'] = propertyDetails!.toJson();
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['zipCode'] = zipCode;
    if (location != null) data['location'] = location!.toJson();
    if (nearbyLocations != null)
      data['nearbyLocations'] = nearbyLocations!.map((v) => v.toJson()).toList();
    data['reraId'] = reraId;
    data['property_status'] = propertyStatus;
    data['builderName'] = builderName;
    data['projectName'] = projectName;
    data['ownerPhone'] = ownerPhone;
    data['ownerName'] = ownerName;
    data['ownerEmail'] = ownerEmail;
    data['isVerified'] = isVerified;
    data['verifiedBy'] = verifiedBy;
    data['verifiedAt'] = verifiedAt;
    data['totalInquiries'] = totalInquiries;
    data['totalViews'] = totalViews;
    data['approval_status'] = approvalStatus;
    data['approval_comment'] = approvalComment;
    data['approved_by'] = approvedBy;
    data['approved_at'] = approvedAt;
    data['totalFavorites'] = totalFavorites;
    data['totalShares'] = totalShares;
    data['totalVisits'] = totalVisits;
    data['totalSales'] = totalSales;
    data['totalCommissions'] = totalCommissions;
    data['assignedTo'] = assignedTo;
    data['assignmentDate'] = assignmentDate;
    data['assignmentExpiryDate'] = assignmentExpiryDate;
    data['potentialEarnings'] = potentialEarnings;
    data['assignmentStatus'] = assignmentStatus;
    data['performanceScore'] = performanceScore;
    data['expiryDate'] = expiryDate;
    data['lastRenewalDate'] = lastRenewalDate;
    data['renewalCount'] = renewalCount;
    data['isExpired'] = isExpired;
    data['totalReports'] = totalReports;
    data['isHiddenDueToReports'] = isHiddenDueToReports;
    data['lastReportedAt'] = lastReportedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class PropertyMedia {
  List<String>? images;
  List<String>? videos;

  PropertyMedia({this.images, this.videos});

  PropertyMedia.fromJson(Map<String, dynamic> json) {
    images = (json['images'] as List?)?.map((e) => e as String).toList();
    videos = (json['videos'] as List?)?.map((e) => e as String).toList();
  }

  Map<String, dynamic> toJson() => {'images': images, 'videos': videos};
}

class PropertyDetails {
  int? bhk;
  int? balcony;
  int? bathroom;
  List<String>? amenities;
  String? zoneType;
  FloorInfo? floorInfo;
  FurnishInfo? furnishInfo;
  ParkingInfo? parkingInfo;
  FinancialInfo? financialInfo;
  PossessionInfo? possessionInfo;
  String? propertyFacing;
  String? propertyCondition;
  double? propertyCarpetArea;
  double? propertyBuiltUpArea;

  PropertyDetails({
    this.bhk,
    this.balcony,
    this.bathroom,
    this.amenities,
    this.zoneType,
    this.floorInfo,
    this.furnishInfo,
    this.parkingInfo,
    this.financialInfo,
    this.possessionInfo,
    this.propertyFacing,
    this.propertyCondition,
    this.propertyCarpetArea,
    this.propertyBuiltUpArea,
  });

  PropertyDetails.fromJson(Map<String, dynamic> json) {
    bhk = TypeConverter.parseInt(json['bhk']);
    balcony = TypeConverter.parseInt(json['balcony']);
    bathroom = TypeConverter.parseInt(json['bathroom']);
    amenities = (json['amenities'] as List?)?.map((e) => e as String).toList();
    zoneType = json['zone_type'] as String?;
    floorInfo = json['floor_info'] != null
        ? FloorInfo.fromJson(json['floor_info'] as Map<String, dynamic>)
        : null;
    furnishInfo = json['furnish_info'] != null
        ? FurnishInfo.fromJson(json['furnish_info'] as Map<String, dynamic>)
        : null;
    parkingInfo = json['parking_info'] != null
        ? ParkingInfo.fromJson(json['parking_info'] as Map<String, dynamic>)
        : null;
    financialInfo = json['financial_info'] != null
        ? FinancialInfo.fromJson(json['financial_info'] as Map<String, dynamic>)
        : null;
    possessionInfo = json['possession_info'] != null
        ? PossessionInfo.fromJson(json['possession_info'] as Map<String, dynamic>)
        : null;
    propertyFacing = json['property_facing'] as String?;
    propertyCondition = json['property_condition'] as String?;
    propertyCarpetArea = TypeConverter.parseDouble(json['property_carpet_area']);
    propertyBuiltUpArea =
        TypeConverter.parseDouble(json['property_built_up_area']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['bhk'] = bhk;
    data['balcony'] = balcony;
    data['bathroom'] = bathroom;
    data['amenities'] = amenities;
    data['zone_type'] = zoneType;
    if (floorInfo != null) data['floor_info'] = floorInfo!.toJson();
    if (furnishInfo != null) data['furnish_info'] = furnishInfo!.toJson();
    if (parkingInfo != null) data['parking_info'] = parkingInfo!.toJson();
    if (financialInfo != null) data['financial_info'] = financialInfo!.toJson();
    if (possessionInfo != null) data['possession_info'] = possessionInfo!.toJson();
    data['property_facing'] = propertyFacing;
    data['property_condition'] = propertyCondition;
    data['property_carpet_area'] = propertyCarpetArea;
    data['property_built_up_area'] = propertyBuiltUpArea;
    return data;
  }
}

class FloorInfo {
  int? floorNumber;
  int? totalFloors;

  FloorInfo({this.floorNumber, this.totalFloors});

  FloorInfo.fromJson(Map<String, dynamic> json) {
    floorNumber = TypeConverter.parseInt(json['floor_number']);
    totalFloors = TypeConverter.parseInt(json['total_floors']);
  }

  Map<String, dynamic> toJson() => {
    'floor_number': floorNumber,
    'total_floors': totalFloors,
  };
}

class FurnishInfo {
  String? furnishType;
  FurnishDetails? furnishDetails;

  FurnishInfo({this.furnishType, this.furnishDetails});

  FurnishInfo.fromJson(Map<String, dynamic> json) {
    furnishType = json['furnish_type'] as String?;
    furnishDetails = json['furnish_details'] != null
        ? FurnishDetails.fromJson(json['furnish_details'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() => {
    'furnish_type': furnishType,
    'furnish_details': furnishDetails?.toJson(),
  };
}

class FurnishDetails {
  bool? modularKitchen;
  bool? wardrobes;
  bool? acInstalled;

  FurnishDetails({this.modularKitchen, this.wardrobes, this.acInstalled});

  FurnishDetails.fromJson(Map<String, dynamic> json) {
    modularKitchen = json['modular_kitchen'] as bool?;
    wardrobes = json['wardrobes'] as bool?;
    acInstalled = json['ac_installed'] as bool?;
  }

  Map<String, dynamic> toJson() => {
    'modular_kitchen': modularKitchen,
    'wardrobes': wardrobes,
    'ac_installed': acInstalled,
  };
}

class ParkingInfo {
  int? covered;
  int? open;

  ParkingInfo({this.covered, this.open});

  ParkingInfo.fromJson(Map<String, dynamic> json) {
    covered = TypeConverter.parseInt(json['covered']);
    open = TypeConverter.parseInt(json['open']);
  }

  Map<String, dynamic> toJson() => {'covered': covered, 'open': open};
}

class FinancialInfo {
  double? price;
  double? maintenance;

  FinancialInfo({this.price, this.maintenance});

  FinancialInfo.fromJson(Map<String, dynamic> json) {
    price = TypeConverter.parseDouble(json['price']) ?? 0;
    maintenance = TypeConverter.parseDouble(json['maintenance']) ?? 0;
  }

  Map<String, dynamic> toJson() => {'price': price, 'maintenance': maintenance};
}

class PossessionInfo {
  String? possessionStatus;
  String? possessionDate;

  PossessionInfo({this.possessionStatus, this.possessionDate});

  PossessionInfo.fromJson(Map<String, dynamic> json) {
    possessionStatus = json['possession_status'] as String?;
    possessionDate = json['possession_date'] as String?;
  }

  Map<String, dynamic> toJson() =>
      {'possession_status': possessionStatus, 'possession_date': possessionDate};
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = TypeConverter.parseDouble(json['latitude']);
    longitude = TypeConverter.parseDouble(json['longitude']);
  }

  Map<String, dynamic> toJson() => {'latitude': latitude, 'longitude': longitude};
}

class NearbyLocations {
  String? name;
  double? distance;

  NearbyLocations({this.name, this.distance});

  NearbyLocations.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    distance = TypeConverter.parseDouble(json['distance']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'distance': distance};
}

class TypeConverter {
  static int? parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  static double? parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }
}
