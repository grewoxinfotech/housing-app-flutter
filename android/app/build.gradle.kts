plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter plugin must come after Android/Kotlin plugins
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.housing_flutter_app" // 🔁 Update with your actual package name
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973" // ✅ FIXED: Set required NDK version

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.housing_flutter_app" // 🔁 Change if needed
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // For now, using debug keys for signing release builds
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
