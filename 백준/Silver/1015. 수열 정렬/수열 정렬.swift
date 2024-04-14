import Foundation

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map{Int($0)!}
var ans = Array(repeating: 0, count: N)
var num = A.sorted(by: <)
var curr = 0
var element = 0

for _ in 0..<N{
    for i in 0..<N{
        if num[curr] == A[i]{
            ans[i] = element
            A[i] = -1
            element += 1
            break
        }
    }
    curr += 1

}
for ans in ans{
    print(ans, terminator: " ")
}