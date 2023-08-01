import Foundation

let date = readLine()!
let cars = readLine()!.split(separator: " ").filter({$0 == date})
print(cars.count)