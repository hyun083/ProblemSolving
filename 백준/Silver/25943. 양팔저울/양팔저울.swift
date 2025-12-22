import Foundation

let N = Int(readLine()!)!
var arr:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
var left = arr.removeLast()
var right = arr.removeLast()

while arr.isEmpty == false {
    if left == right {
        left += arr.removeLast()
    }else if left < right{
        left += arr.removeLast()
    }else{
        right += arr.removeLast()
    }
}

var ans = 0
let weight = [100,50,20,10,5,2,1]
var target = abs(left-right)

for w in weight{
    if target >= w{
        ans += target/w
        target %= w
    }
}
print(ans)