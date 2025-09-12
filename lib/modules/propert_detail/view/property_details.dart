import 'package:flutter/material.dart';

import 'package:housing_flutter_app/app/constants/color_res.dart';
import 'package:housing_flutter_app/app/constants/size_manager.dart';

import 'package:housing_flutter_app/modules/propert_detail/view/widget/property_card_widget.dart';

class PropertyDetail extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [
    {
      'title': 'The White Abode',
      'imageUrl': 'https://picsum.photos/400/200',
      'location': '33, Laxmi Palace, S V Road, Near...',
      'role': ' Developer',
      'price': 'Rs. 8,00,000',
      'apartments': [
        {'bhk': '2 BHK Apartment', 'priceRange': '50 L - 1.2 Cr'},
        {'bhk': '4 BHK Apartment', 'priceRange': '92 L - 1.5 Cr'},
        {'bhk': '5 BHK Apartment', 'priceRange': '2.5 Cr - 3.2 Cr'},
      ],
      'beds': 4,
      'baths': 4,
      'area': 874,
      'ownerName': 'James Aldeio',
      'ownerAvatar': 'https://i.pravatar.cc/150?img=3',
      'images': [
        'https://picsum.photos/seed/white1/600/400',
        'https://picsum.photos/seed/white2/600/400',
        'https://picsum.photos/seed/white3/600/400',
      ],
    },
    {
      'title': 'Sunset Villa',
      'imageUrl': 'https://picsum.photos/401/200',
      'location': 'Palm Street, Ocean View',
      'price': 'Rs. 12,50,000',
      'role': ' Agents',
      'beds': 5,
      'apartments': [
        {'bhk': '2 BHK Apartment', 'priceRange': '50 L - 1.2 Cr'},
        {'bhk': '4 BHK Apartment', 'priceRange': '92 L - 1.5 Cr'},
      ],
      'baths': 3,
      'area': 1200,
      'ownerName': 'Sophia Turner',
      'ownerAvatar': 'https://i.pravatar.cc/150?img=5',
      'images': [
        'https://picsum.photos/seed/villa1/600/400',
        'https://picsum.photos/seed/villa2/600/400',
        'https://picsum.photos/seed/villa3/600/400',
        'https://picsum.photos/seed/villa4/600/400',
      ],
    },
    {
      'title': 'City Heights',
      'imageUrl': 'https://picsum.photos/402/200',
      'location': 'Metro Plaza, Downtown',
      'price': 'Rs. 6,75,000',
      'beds': 3,
      'baths': 2,
      'role': ' Owner',
      'area': 690,
      'apartments': [
        {'bhk': '2 BHK Apartment', 'priceRange': '50 L - 1.2 Cr'},
      ],
      'ownerName': 'David Smith',
      'ownerAvatar': 'https://i.pravatar.cc/150?img=7',
      'images': [
        'https://picsum.photos/seed/city1/600/400',
        'https://picsum.photos/seed/city2/600/400',
        'https://picsum.photos/seed/city3/600/400',
      ],
    },
  ];
  final List<String> propertyFeatures = [
    "Ready to Move",
    "0.0 INR",
    "0 of 2",
    "5800.0 sq.ft.",
    "2 BHK",
    "Semi-Furnished",
  ];

  PropertyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorRes.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorRes.white,
        title: const Text(
          "Property List",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorRes.textColor,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.small,
          horizontal: AppPadding.small,
        ),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return PropertyCardWidget(
            imageUrl: property['imageUrl'],
            features: propertyFeatures,
            apartments: property['apartments'],
            images: property['images'],
            title: property['title'],
            location: property['location'],
            price: 'Ready To Move',
            ownerName: property['ownerName'],
            ownerAvatar: property['ownerAvatar'],
            role: property['role'],
            beds: '2 BHK Apartment',
          );
        },
      ),
    );
  }
}
