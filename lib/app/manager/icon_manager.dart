import 'package:flutter/material.dart';

class IconManager {
  IconManager._();

  static final Map<String, IconData> _iconMap = {
    // Lifestyle
    "infinity_pool": Icons.pool,
    "swimming_pool": Icons.pool,
    "sky_lounge": Icons.wine_bar,
    "clubhouse": Icons.groups,
    "banquet_hall": Icons.celebration,
    "garden": Icons.park,
    "jogging_track": Icons.directions_run,
    "gym": Icons.fitness_center,
    "spa": Icons.spa,
    "play_area": Icons.sports_soccer,
    "security": Icons.security,
    "smart_home": Icons.smart_toy_outlined,

    // Services
    "concierge_24x7": Icons.support_agent,
    "housekeeping": Icons.cleaning_services,
    "laundry": Icons.local_laundry_service,
    "cafeteria": Icons.local_cafe,
    "restaurant": Icons.restaurant,
    "bar": Icons.local_bar,

    // Safety & Security
    "cctv_surveillance": Icons.videocam,
    "security_24x7": Icons.security,
    "fire_safety": Icons.local_fire_department,
    "emergency_exit": Icons.exit_to_app,
    "medical_facility": Icons.local_hospital,

    // Utilities
    "private_elevator": Icons.elevator,
    "power_backup": Icons.power,
    "water_supply": Icons.water_drop,
    "gas_pipeline": Icons.local_gas_station,
    "waste_disposal": Icons.delete,

    // Smart Features
    "smart_lighting": Icons.lightbulb,
    "home_automation": Icons.settings_remote,
    "wifi": Icons.wifi,
    "intercom": Icons.call,

    // Parking & Transport
    "parking": Icons.local_parking,
    "visitor_parking": Icons.directions_car,
    "ev_charging": Icons.ev_station,
    "bike_parking": Icons.pedal_bike,
    "car_wash": Icons.local_car_wash,

    // Sports & Recreation
    "tennis_court": Icons.sports_tennis,
    "basketball_court": Icons.sports_basketball,
    "cricket_pitch": Icons.sports_cricket,
    "golf_course": Icons.sports_golf,
    "badminton_court": Icons.sports,
    "skating_rink": Icons.ice_skating,
    "amphitheatre": Icons.theater_comedy,

    // Eco-friendly
    "solar_panels": Icons.solar_power,
    "rainwater_harvesting": Icons.grass,
    "recycling": Icons.recycling,
    "green_building": Icons.eco,
    "energy_efficient": Icons.bolt,

    // Indoor
    "theater": Icons.movie,
    "library": Icons.menu_book,
    "business_center": Icons.business_center,
    "conference_room": Icons.meeting_room,
    "game_room": Icons.videogame_asset,

    // Miscellaneous
    "pet_friendly": Icons.pets,
    "temple": Icons.temple_hindu,
    "church": Icons.church,
    "mosque": Icons.mosque,
    "atm": Icons.atm,
    "shopping_center": Icons.shopping_bag,
    "salon": Icons.content_cut,
  };

  static IconData getIcon(String key) {
    print('[DEBUG]=> icons : ${key}');
    return _iconMap[key] ?? Icons.help_outline; // fallback icon
  }
}
