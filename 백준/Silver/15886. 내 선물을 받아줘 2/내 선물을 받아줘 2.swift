import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.map{String($0)}
var ans = 0
for i in 0..<N-1{
    if arr[i]=="E" && arr[i+1]=="W"{
        ans += 1
    }
}
print(ans)