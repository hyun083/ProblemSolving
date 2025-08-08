import Foundation

let weight = Double(readLine()!)!
let height = Double(readLine()!)!
let BMI = weight / (height * height)
if BMI < 18.5 {
    print("Underweight")
} else if BMI <= 25 {
    print("Normal weight")
} else{
    print("Overweight")
}