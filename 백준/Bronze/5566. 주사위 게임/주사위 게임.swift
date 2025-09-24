import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var arr = [Int]()
var curr = 0

for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}

for ans in 1...M{
    let num = Int(readLine()!)!
    curr += num
    if curr >= N-1{
        print(ans)
        break
    }
    curr += arr[curr]
    if curr >= N-1{
       print(ans)
        break
    }
}