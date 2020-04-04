# 100-days-of-SwiftUI Notes

## Project List:

### Project 1 : [BillSplit](https://github.com/iiqrah/100-days-of-swift/tree/master/BillSplit)
### Project 2 : [Mass Conversion](https://github.com/iiqrah/100-days-of-swift/tree/master/mass-conversion)
### Project 3 : [Guess The Flag](https://github.com/iiqrah/100-days-of-swift/tree/master/GuessTheFlag)

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

- HStack {}
- VStack {}
- ZStack {}
  - Parameters:
    - alignment: .leading, .trailing, .top
    - spacing: 30
    
- Spacer()

- Color(red: 1, green: 0.8, blue: 0)
  - Modifier:
    - .frame(width: 200, height: 200)
    - .edgesIgnoringSafeArea(.all)

- Gradient Views
  - LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
  - RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
  - AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

- Button("button label") { //trigger action }

- Advance Button syntax :

```
Button(action: {
    // trigger action
}) { 
    Image(systemName: "pencil")
}
```

  - Modifier:
    - .renderingMode(.original)

- Types of images
  - Image("pencil") will load an image called “Pencil” that you have added to your project
  - Image(decorative: "pencil") will load the same image, but won’t read it out
  - Image(systemName: "pencil") will load the pencil icon that is built into iOS
  
  -Modifier:
    - .clipShape(Capsule()) [Capsule(), Rectangle(), Circle(), RoundedRectangle()](https://developer.apple.com/documentation/swiftui/shape)
    - .overlay()
    - .stroke(Color.black, lineWidth: 1)
    - .shadow(color: .black, radius: 2)
  
- Alert syntax

```
Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))

```

- Alert with button

```
struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}
```

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
  - Modifier:
    - .frame(maxWidth: .infinity, maxHeight: .infinity)
    - .background(Color.red)
    - .foregroundColor(Color.red)
    - .font(.largeTitle)
    - .fontWeight(.black)

- TextField("message", text: $messageVariable)
  - Modifier:
    - .keyboardType(.decimalPad)
    - .keyboardType(.numberPad)


### Shortcuts

- Option + Cmd + P : Resume Automatic Preview
- Cmd + R: Run app in emulator
