
# tellme_color_picker
Semi customizable color picker for flutter.

<p float="left">
<img src="https://raw.githubusercontent.com/TellMeCorp/tellme_color_picker/master/example/images/Screenshot_1620659030.png" width = 150>
</p>


## Install

### 1. Depend on it
Add this to your package's pubspec.yaml file:

```yaml
dependencies:
    tellme_color_picker:: <CurrentVersion>
```

### 2. Install it

You can install packages from the command line:  

with Flutter:
```shell
$ flutter pub get
```

Alternatively, your editor might support `flutter pub get`. Check the docs for your editor to learn more.

### 3. Import it

Now in your Dart code, you can use:

```dart
import  'package:tellme_color_picker/tellme_color_picker.dart';
```

## Example

  
```dart
 TextButton(
    onPressed: () => TellMeColorPicker(
    context: context,
    colors: TellMeColors.labelColors,// color array
    onSelected: (Color color) {
        setState(() {
        selectedColor = color;
        });
    },
    ),
    child: Row(
    children: [
        Icon(Icons.label, color: selectedColor),
        SizedBox(width: 10),
        Text('Select a color'),
    ],
    ),
),

```
