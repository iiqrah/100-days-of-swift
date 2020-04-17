# 100-days-of-SwiftUI Notes

## Project List:

### Project 1 : [BillSplit](https://github.com/iiqrah/100-days-of-swift/tree/master/BillSplit)
### Project 2 : [Mass Conversion](https://github.com/iiqrah/100-days-of-swift/tree/master/mass-conversion)
### Project 3 : [Guess The Flag](https://github.com/iiqrah/100-days-of-swift/tree/master/GuessTheFlag)
### Project 4 : [Brain Training Game: Rock, Paper, Scissors](https://github.com/iiqrah/100-days-of-swift/tree/master/BrainTrainRPS)
### Project 5 : [BetterRest](https://github.com/iiqrah/100-days-of-swift/tree/master/BetterRest)

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
    

- Stepper(
    - value: $value, [bind it to a variable]
    - in: 4...12, [range of values to increment or decrement]
    - step: 0.25 [the step at which values increment or decrement]
    ) {
    Text("\(value) hours")
    }
    
    
### Dates

- DatePicker(
    - "Please enter a date", [label for display/screen readers]
    - selection: $wakeUpTime, [bind it to a variable with Date() type]
    - in: Date()... [range of date, can be one sided range as well]
    - displayedComponents: .hourAndMinute [.date for month, day, and year or .hourAndMinute]
    
    )

    - Modifier:
        - .labelsHidden()
        
- Date range

```
// when you create a new Date instance it will be set to the current date and time
let now = Date()

// create a second Date instance set to one day in seconds from now
let tomorrow = Date().addingTimeInterval(86400) 

// create a range from those two
let range = now ... tomorrow

```

- DateComponents()

```
# provide a specific hour and minute to the user 
var dateComponent = DateComponents()
dateComponent.hour = 8
dateComponent.minute = 0

let date = Calendar.current.date(from: components) ?? Date()

```

```
# recieve a specific hour and minute from the DatePicker 
let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
let hour = components.hour ?? 0
let minute = components.minute ?? 0

```

- DateFormatter

```
let formatter = DateFormatter()
formatter.timeStyle = .short
let dateString = formatter.string(from: Date())

```


### Shortcuts

- Option + Cmd + P : Resume Automatic Preview
- Cmd + R: Run app in emulator


### Machine Learning 

1. CoreML iOS 11 2017
2. CreateML 2018
3. CreateML app 2019 : Xcode Menu > Open Developer Tool > Create ML > New Document > Choose A Template

- Tabular Regression

1. Provide with some raw training data 
    - Under data inputs > Training Data > Choose file [maybe a .csv file]
2. Select target (value we want the computer to learn to predict)
3. Select features (values we want the computer to inspect in order to predict the target)
4. Pick Algorithm 
    - Automatic
    - Linear Regression: to be able to draw one straight line through all your data points, where the average distance between the line and each data point is as small as possible
    - Decision Tree: form a natural tree structure letting us organize information as a series of choices like 20 questions, until eventually there’s a definitive answer.
    - Boosted Tree: a series of decision trees, where each tree is designed to correct any errors in the previous tree.
    - Random Forest: similar to boosted trees, but each tree has access to only a subset of data. Each decision tree has its own view of your data that’s different to other trees, and by combining all their predictions together to make an average you stand a great chance of getting a strong result
5. Data Training
        - Click the play button at the top left corner
6. Drag the trained output file to desired location for it to be saved [file with .mlmodel extension]
7. Connecting SwiftUI app to CoreML
    - Rename .mlmodel file to a suitable class name 
    - Drag the .mlmodel file to suitable SwiftUI project navigator, below plist is fine
    - Create instance of class
    - Feed in the values to the instance

