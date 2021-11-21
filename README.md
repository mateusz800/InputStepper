# SwiftUI-InputStepper

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/69794271002a4381a57b98303ba3ad16)](https://app.codacy.com/gh/mateusz800/InputStepper?utm_source=github.com&utm_medium=referral&utm_content=mateusz800/InputStepper&utm_campaign=Badge_Grade_Settings)

Swift package for creating numerical input stepper.



#### It supports long press gesture
Input stepper has option to handle long press. You can press the +/- button and hold it for few seconds. In that time the value will be changing with the adjustable speed and step.

## Instalation

In Xcode go to File -> Swift Packages -> Add Package Dependency and paste in the repo's url: https://github.com/mateusz800/InputStepper

Make sure that you have added the library in your project target.
`Target name` -> General -> Frameworks, Libraries and Embedded Content



## Usage
Import the package in the file you would like to use it: 
```swift
import SwiftUI_InputStepper
```

InputStepper library shares three components that allows you to build your fully customizable input stepper. Among them are `Value`, `PlusButton` and `MinusButton`. Each of them have to be included inside `InputStepper` view.

Basic example:


```swift
@State var value:Float = 0
...
InputStepper($value) {
    HStack {
        MinusButton()
        Value()
        PlusButton()
    }
}
```

The result of any interaction with input stepper will be available in declared `value` state variable.

#### Customization

You can modify `MinusButton` and `PlusButton` by defining how it should look like. Define some new view and pass it as a parameter

```swift
MinusButton(){
    Text("This is a minus button")
}
```

It is also possible to define how many decimal digits should be shown after dot. Simply put that number in the constructor of the `Value` view.
```swift
Value(decimalPlaces:2)
```

You can also customize your input stepper via the following modificators:
* `.withStep(step:)` - edit step value





