import Foundation

let number = readLine()!
var arr = Array(repeating: 0, count: 10)
for n in number{
    var index = Int(String(n))!
    if n=="6" || n=="9"{
        index = arr[6] <= arr[9] ? 6:9
    }
    arr[index] += 1
}
print(arr.max()!)