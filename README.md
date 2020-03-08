# 100-days-of-SwiftUI Notes

## Project List:

### Project 1 : [BillSplit](https://github.com/iiqrah/100-days-of-swift/tree/master/BillSplit)
### Project 2 : [Mass Conversion](https://github.com/iiqrah/100-days-of-swift/tree/master/mass-conversion)

## Notes:

### Xcode Single View App Files:

- AppDelegate.swift :  contains code for managing your app. It used to be common to add code here, but these days it’s quite rare.

- SceneDelegate.swift contains code for launching one window in your app. This doesn’t do much on iPhone, but on iPad – where users can have multiple instances of your app open at the same time – this is important.

- ContentView.swift contains the initial user interface (UI) for your program, and is where we’ll be doing all the work in this project.

- Assets.xcassets is an asset catalog – a collection of pictures that you want to use in your app. You can also add colors here, along with app icons, iMessage stickers, and more.

- LaunchScreen.storyboard is a visual editor for creating a small piece of UI to show when your app is launching.

- Info.plist is a collection of special values that describe to the system how your app works – which version it is, which device orientations you support, and more. Things that aren’t code, but are still important.

- Preview Content is a yellow group, with Preview Assets.xcassets inside – this is another asset catalog, this time specifically for example images you want to use when you’re designing your user interfaces, to give you an idea of how they might look when the program is running.


### Views

- Form {}
- Group {}
- Section {}
- NavigationView {}
  - Modifier:
    - .navigationBarTitle(Text("SwiftUI"))
    - .navigationBarTitle("SwiftUI", displayMode: .inline)

- Picker View syntax:
```
    Picker("title", selection: $selectedValue) {
                  ForEach(0 ..< values.count) {
                      Text(self.values[$0])
                  }
              }
```
  - Modifier:
    - .pickerStyle(SegmentedPickerStyle())

- Text() syntax
```
  Text("$\(doubleVariable, specifier: "%.2f")")
```

- TextField("message", text: $messageVariable)
  - Modifier:
    - .keyboardType(.decimalPad)
    - .keyboardType(.numberPad)


### Shortcuts

- Option + Cmd + P : Resume Automatic Preview
- Cmd + R: Run app in emulator
