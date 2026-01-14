plugins {
    // ✅ Update Kotlin Gradle plugin (fixes Kotlin metadata 2.2.0 vs 1.8.0 issue)
    id("org.jetbrains.kotlin.android") version "2.2.0" apply false

    // ✅ Recommended: keep AGP declared here too (version depends on your project / Flutter template)
    // If you already declare AGP elsewhere, you can remove this line.
    id("com.android.application") version "8.7.0" apply false
    // Firebase / Google Services
    id("com.google.gms.google-services") version "4.4.4" apply false

    // Firebase Crashlytics (optional, only if you use it)
//    id("com.google.firebase.crashlytics") version "3.0.2" apply false

}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
