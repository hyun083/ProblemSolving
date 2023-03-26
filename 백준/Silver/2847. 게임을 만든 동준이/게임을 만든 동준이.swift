import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var cnt = 0
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
for i in stride(from: N-2, through: 0, by: -1){
    if arr[i+1] <= arr[i]{
        cnt += arr[i] - (arr[i+1]-1)
        arr[i] = arr[i+1]-1
    }
}
print(cnt)