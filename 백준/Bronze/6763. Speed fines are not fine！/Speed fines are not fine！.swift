import Foundation

let limit = Int(readLine()!)!
let speed = Int(readLine()!)!

if speed <= limit{
    print("Congratulations, you are within the speed limit!")
}else if speed - limit <= 20{
    print("You are speeding and your fine is $100.")
}else if speed - limit <= 30{
    print("You are speeding and your fine is $270.")
}else{
    print("You are speeding and your fine is $500.")
}