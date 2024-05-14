import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var book = [[Int]]()
var ans = "Yes"
var flag = true
for _ in 0..<M{
    let K = Int(readLine()!)!
    let stk = readLine()!.split(separator: " ").map{Int($0)!}
    for i in 0..<K-1{
        flag = stk[i+1]>stk[i] ? false:flag
    }
}
print(flag ? "Yes":"No")