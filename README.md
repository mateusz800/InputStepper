# SwiftUI-InputStepper

Swift package for creating numerical input stepper.



#### It supports long press gesture
Input stepper has option to handle long press. You can press the +/- button and hold it for few seconds. In that time the value will be changing with the adjustable speed and step.


## Usage

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

You can customize your input stepper via the following modificators:
* `.withStep(step:)` - edit step value





