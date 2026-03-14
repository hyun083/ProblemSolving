import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
let sum = arr.reduce(0, +)
let avg = sum/N
var over = 0
var under = 0

for num in arr {
    if num > avg+1 {
        over += num - (avg+1)
    } else if num < avg {
        under += avg - num
    }
}
print(max(over, under))