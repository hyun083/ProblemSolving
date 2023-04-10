import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)

var flag = false
var target = 3000000001
var result = ""

for k in 0..<n-2{
    var start = k+1
    var end = n-1
    while start<end{
        let temp = arr[k]+arr[start]+arr[end]
        if abs(temp) < target{
            target = abs(temp)
            result = "\(arr[k]) \(arr[start]) \(arr[end])"
        }
        if temp < 0{ start += 1 }
        if temp == 0{
            result = "\(arr[k]) \(arr[start]) \(arr[end])"
            flag = true
            break
        }
        if temp > 0{ end -= 1 }
    }
    if flag {break}
}
print(result)