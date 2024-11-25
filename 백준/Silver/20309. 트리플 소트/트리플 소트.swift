import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = "YES"

for i in 1..<N-1{
    let pre = arr[i-1]
    let next = arr[i+1]
    
    if (pre%2 != (i)%2) || (next%2 != (i+2)%2){
        ans = "NO"
    }
}
print(ans)