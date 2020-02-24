# CSUBU Flutter App

A starter project for teaching application development with flutter in computer science program at UBU #cs-ubu

See https://github.com/flutter/flutter/wiki/Desktop-shells

Modified from https://github.com/google/flutter-desktop-embedding

## Preparation

### Install flutter sdk

https://flutter.dev/docs/get-started/install

### Change channel to master

```sh
flutter channel master
```

### Linux

```sh
flutter config --enable-linux-desktop
flutter precache --linux
```

### MacOS

```sh
flutter config --enable-macos-desktop
flutter precache --macos
```

### Windows

```sh
flutter config --enable-windows-desktop
flutter precache --windows
```

## Fetching Packages

```sh
flutter packages get
```

## Starting Application

```sh
flutter run -d emulator-5554
flutter run -d Linux
```


