import Foundation

let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = ab[0]-1
let b = ab[1]-1

var arr = [Int]()
var number = 1
while arr.count < 1000{
    for _ in 1...number{
        arr.append(number)
    }
    number += 1
}

print(arr[a...b].reduce(0, +))