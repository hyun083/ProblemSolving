import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}

for _ in 0..<N-3{
    if arr[0] > arr[N-1]{
        arr[0] -= 1
    }else{
        arr[N-1] -= 1
    }
}
print(max(arr[0]-1,arr[N-1]-1))