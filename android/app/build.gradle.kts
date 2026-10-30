
import java.util.Properties

plugins {
    id("com.android.application")
    // Configuración de Firebase
    id("com.google.gms.google-services")
    // Plugin de Flutter
    id("dev.flutter.flutter-gradle-plugin")
}

// Leer variables del archivo .env
val envProperties = Properties()
val envFile = rootProject.file("../.env")

if (envFile.exists()) {
    envFile.inputStream().use { input ->
        envProperties.load(input)
    }
}

val mapsApiKey = envProperties.getProperty("GOOGLE_MAPS_API_KEY")
    ?: error("No se encontró GOOGLE_MAPS_API_KEY en el archivo .env")

android {
    namespace = "com.example.flutter_application_1"
    compileSdk = flutter.compileSdkVersion
    //compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.example.flutter_application_1"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        manifestPlaceholders["GOOGLE_MAPS_API_KEY"] = mapsApiKey
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
