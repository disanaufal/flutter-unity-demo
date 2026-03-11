# Example: Default Flutter × Unity Integration

This guide explains how to connect a Unity project with a Flutter project using the provided example setup. The Flutter project is already configured to work with the latest Flutter version and includes fixes for common integration issues.

---

## 1. Create the Unity Library Folder

Inside your Flutter project, create a new folder:

```
your_flutter_project/
 └─ android/
     └─ unityLibrary/
```

This folder will contain the Unity Android module exported from the Unity project.

---

## 2. Install Unity

Install **Unity 2022.3 LTS**.

This version is recommended because the example Unity project was built and tested using Unity 2022.3 LTS.

---

## 3. Download the Example Unity Project

Download or clone the Unity project from the following repository:

```
https://github.com/learntoflutter/flutter_embed_unity/tree/main/example_unity_2022_3_project
```

Open this project using Unity.

---

## 4. Export the Unity Project to Flutter

Inside Unity:

1. Open the project you downloaded.
2. Navigate to:

```
Flutter Embed → Export project to Flutter app
```

3. Select the target platform:

   * Android
   * iOS

Unity will export the required files into the `unityLibrary` folder inside your Flutter project.

---

## 5. Verify Folder Structure

After exporting, your project structure should look like this:

```
your_flutter_project
 ├─ lib
 ├─ android
 │   ├─ app
 │   └─ unityLibrary
 └─ pubspec.yaml
```

---

## 6. Run the Flutter Project

From the root of the Flutter project:

```
flutter pub get
flutter run
```

The Flutter app should now successfully load the Unity module.

---

## Notes

* This Flutter project is already configured to work with the latest Flutter version.
* Several common integration issues between Flutter and Unity have already been resolved in this project.
* If you modify the Unity project later, simply export the project again to update the `unityLibrary` module.
