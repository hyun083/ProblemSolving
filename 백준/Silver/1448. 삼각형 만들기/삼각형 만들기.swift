import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
var ans = -1

for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: >)

for i in 0..<N-2{
    let A = arr[i]
    let B = arr[i+1]
    let C = arr[i+2]
    
    if A+B>C && A+C>B && B+C>A {
        ans = A+B+C
        break
    }
}
print(ans)