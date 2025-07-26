import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:housing_flutter_app/data/network/home/models/home_model.dart';
import 'package:housing_flutter_app/data/network/home/services/home_service.dart';



class HomeController extends GetxController {
  final PropertyService _propertyService = PropertyService();

  List<PropertyModel> _featuredProperties = [];
  List<PropertyModel> _recommendedProperties = [];
  Map<String, List<PropertyModel>> _propertiesByCategory = {};
  bool _isLoading = false;
  String? _error;

  // Getters
  List<PropertyModel> get featuredProperties => _featuredProperties;
  List<PropertyModel> get recommendedProperties => _recommendedProperties;
  Map<String, List<PropertyModel>> get propertiesByCategory => _propertiesByCategory;
  bool get isLoading => _isLoading;
  String? get error => _error;



  @override
  void onInit() {
    _initializeData();
    super.onInit();
  }

  Future<void> _initializeData() async {
    await getFeaturedProperties();
    await getRecommendedProperties();
    await getPropertiesByCategory('Apartment');
  }

  Future<void> getFeaturedProperties() async {
    _isLoading = true;
    _error = null;
  //  notifyListeners();

    try {
      // For demo, use sample data
      _featuredProperties = _getSampleProperties().take(5).toList();
    } catch (e) {
      _error = "Error loading featured properties: ${e.toString()}";
    } finally {
      _isLoading = false;
    //  notifyListeners();
    }
  }

  Future<void> getRecommendedProperties() async {
    _isLoading = true;
    _error = null;
   // notifyListeners();

    try {
      // For demo, use sample data
      _recommendedProperties = _getSampleProperties().skip(5).take(5).toList();
    } catch (e) {
      _error = "Error loading recommended properties: ${e.toString()}";
    } finally {
      _isLoading = false;
   ////   notifyListeners();
    }
  }

  Future<void> getPropertiesByCategory(String category) async {
    _isLoading = true;
    _error = null;
   // notifyListeners();

    try {
      // For demo, use sample data
      if (!_propertiesByCategory.containsKey(category)) {
        _propertiesByCategory[category] = _getSampleProperties().take(3).toList();
      }
    } catch (e) {
      _error = "Error loading $category properties: ${e.toString()}";
    } finally {
      _isLoading = false;
     // notifyListeners();
    }
  }

  // Sample data for demo purposes
  List<PropertyModel> _getSampleProperties() {
    return [
      PropertyModel(
        id: '1',
        title: 'Modern Apartment in Downtown',
        description: 'Beautiful and spacious apartment in the heart of downtown.',
        price: 2500,
        bedrooms: 2,
        bathrooms: 2,
        area: 1200,
        location: 'Downtown, City Center',
        imageUrl: 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
        isFeatured: true,
        category: 'Apartment',
        rating: 4.8,
      ),
      PropertyModel(
        id: '2',
        title: 'Cozy Studio near Park',
        description: 'Perfect studio for singles or couples near the city park.',
        price: 1200,
        bedrooms: 1,
        bathrooms: 1,
        area: 650,
        location: 'Park Avenue, Green Zone',
        imageUrl: 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688',
        isFeatured: false,
        category: 'Studio',
        rating: 4.5,
      ),
      PropertyModel(
        id: '3',
        title: 'Luxury Villa with Pool',
        description: 'Stunning villa with private pool and garden in exclusive area.',
        price: 6000,
        bedrooms: 4,
        bathrooms: 3,
        area: 3200,
        location: 'Beverly Hills, Luxury Zone',
        imageUrl: 'https://images.unsplash.com/photo-1580587771525-78b9dba3b914',
        isFeatured: true,
        category: 'Villa',
        rating: 4.9,
      ),
      PropertyModel(
        id: '4',
        title: 'Penthouse with City View',
        description: 'Luxurious penthouse with breathtaking views of the city skyline.',
        price: 4500,
        bedrooms: 3,
        bathrooms: 2,
        area: 1800,
        location: 'Skyline Avenue, Heights',
        imageUrl: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750',
        isFeatured: true,
        category: 'Penthouse',
        rating: 4.7,
      ),
      PropertyModel(
        id: '5',
        title: 'Family Home with Garden',
        description: 'Spacious family home with beautiful garden and play area.',
        price: 3200,
        bedrooms: 4,
        bathrooms: 3,
        area: 2400,
        location: 'Suburbia, Family District',
        imageUrl: 'https://images.unsplash.com/photo-1564013799919-ab600027ffc6',
        isFeatured: false,
        category: 'House',
        rating: 4.6,
      ),
      PropertyModel(
        id: '6',
        title: 'Modern Loft in Arts District',
        description: 'Stylish loft apartment in the vibrant arts district.',
        price: 2800,
        bedrooms: 1,
        bathrooms: 1,
        area: 1100,
        location: 'Arts District, Downtown',
        imageUrl: 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2',
        isFeatured: false,
        category: 'Loft',
        rating: 4.4,
      ),
      PropertyModel(
        id: '7',
        title: 'Beachfront Condo',
        description: 'Beautiful condo with direct access to the beach.',
        price: 5000,
        bedrooms: 2,
        bathrooms: 2,
        area: 1500,
        location: 'Beachfront, Ocean Drive',
        imageUrl: 'https://images.unsplash.com/photo-1518780664697-55e3ad937233',
        isFeatured: true,
        category: 'Condo',
        rating: 4.8,
      ),
      PropertyModel(
        id: '8',
        title: 'Mountain Cabin Retreat',
        description: 'Cozy cabin with stunning mountain views and fireplace.',
        price: 2200,
        bedrooms: 2,
        bathrooms: 1,
        area: 950,
        location: 'Mountain View, Nature Reserve',
        imageUrl: 'https://images.unsplash.com/photo-1542718610-a1d656d1884c',
        isFeatured: false,
        category: 'Cabin',
        rating: 4.6,
      ),
      PropertyModel(
        id: '9',
        title: 'Downtown Office Space',
        description: 'Modern office space in prime downtown location.',
        price: 3800,
        bedrooms: 0,
        bathrooms: 2,
        area: 1800,
        location: 'Business District, Downtown',
        imageUrl: 'https://images.unsplash.com/photo-1497366754035-f200968a6e72',
        isFeatured: false,
        category: 'Commercial',
        rating: 4.3,
      ),
      PropertyModel(
        id: '10',
        title: 'Renovated Historic Brownstone',
        description: 'Beautifully renovated historic brownstone with modern amenities.',
        price: 4200,
        bedrooms: 3,
        bathrooms: 2,
        area: 2200,
        location: 'Historic District, Oldtown',
        imageUrl: 'https://images.unsplash.com/photo-1494526585095-c41746248156',
        isFeatured: true,
        category: 'Townhouse',
        rating: 4.7,
      ),
    ];
  }
} 