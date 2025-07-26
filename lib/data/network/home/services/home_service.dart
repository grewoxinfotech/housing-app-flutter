import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:housing_flutter_app/app/constants/api_constants.dart';
import 'package:housing_flutter_app/data/database/secure_storage_service.dart';
import 'package:housing_flutter_app/data/network/home/models/home_model.dart';

class PropertyService {
  final http.Client _client = http.Client();
  final SecureStorage _secureStorage = SecureStorage();

   static Future<Map<String, String>> headers() async {
    return await ApiConstants.getHeaders();
  }

  // Get featured properties
  Future<List<PropertyModel>> getFeaturedProperties() async {
    try {
      final token = await SecureStorage.getToken();
      final response = await _client.get(
        Uri.parse('${ApiConstants.baseURL}${ApiConstants.featuredPropertiesEndpoint}'), 
          headers: await headers(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final properties = (data['properties'] as List)
            .map((property) => PropertyModel.fromJson(property))
            .toList();
        return properties;
      } else {
        throw Exception('Failed to load featured properties');
      }
    } catch (e) {
      // For demo purposes, return empty list instead of throwing
      return [];
    }
  }

  // Get recommended properties
  Future<List<PropertyModel>> getRecommendedProperties() async {
    try {
      final token = await SecureStorage.getToken();
      final response = await _client.get(
        Uri.parse('${ApiConstants.baseURL}${ApiConstants.recommendedPropertiesEndpoint}'),
        headers: await headers(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final properties = (data['properties'] as List)
            .map((property) => PropertyModel.fromJson(property))
            .toList();
        return properties;
      } else {
        throw Exception('Failed to load recommended properties');
      }
    } catch (e) {
      // For demo purposes, return empty list instead of throwing
      return [];
    }
  }

  // Get properties by category
  Future<List<PropertyModel>> getPropertiesByCategory(String category) async {
    try {
      final token = await SecureStorage.getToken();
      final response = await _client.get(
        Uri.parse('${ApiConstants.baseURL}${ApiConstants.propertiesByCategoryEndpoint}/$category'),
        headers: await headers(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final properties = (data['properties'] as List)
            .map((property) => PropertyModel.fromJson(property))
            .toList();
        return properties;
      } else {
        throw Exception('Failed to load properties by category');
      }
    } catch (e) {
      // For demo purposes, return empty list instead of throwing
      return [];
    }
  }

  // Get home details
  Future<PropertyModel> getPropertyDetails(String id) async {
    try {
      final token = await SecureStorage.getToken();
      final response = await _client.get(
        Uri.parse('${ApiConstants.baseURL}${ApiConstants.propertiesEndpoint}/$id'),
        headers: await headers(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return PropertyModel.fromJson(data['home']);
      } else {
        throw Exception('Failed to load home details');
      }
    } catch (e) {
      // For demo purposes, return a dummy home
      return PropertyModel(
        id: id,
        title: 'Property Not Found',
        description: 'Unable to load home details',
        price: 0,
        bedrooms: 0,
        bathrooms: 0,
        area: 0,
        location: 'Unknown',
        imageUrl: '',
        category: 'Unknown',
      );
    }
  }
} 