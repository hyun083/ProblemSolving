import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
for i in stride(from: N-1, through: 1, by: -1){
    if arr[i] < arr[i-1]{
        arr[i-1] = arr[i]
    }else{
        continue
    }
}
print(arr.reduce(0, +))