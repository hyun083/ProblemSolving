import Foundation

let N = Int(readLine()!)!
var arr = [(d:Int, t:Int)]()

for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((input[0], input[1]))
}
arr.sort(by: { $0.t < $1.t })

var last = arr.removeLast()
var curr = last.t - last.d
var ans = 0

for _ in 0..<N-1{
    last = arr.removeLast()
    
    if last.t <= curr{
        ans = max(ans, curr-last.t)
        curr = last.t - last.d
    }else{
        curr -= last.d
    }
}
print(curr)