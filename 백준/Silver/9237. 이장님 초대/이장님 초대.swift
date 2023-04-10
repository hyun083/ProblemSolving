import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
var max = 0
for i in 0..<N{
    if max < arr[i]+(i+1){
        max = arr[i]+(i+1)
    }
}
print(max+1)