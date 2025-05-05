import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
var cnt = 0
var curr = N
for i in stride(from: N-1, through: 0, by: -1){
    if arr[i] == curr{
        cnt += 1
        curr -= 1
    }
}
print(N-cnt)