import Foundation

let N = Int(readLine()!)!
let T = Int(readLine()!)!
var queue = readLine()!.split(separator: " ").map{Int($0)!}
let arr = readLine()!.split(separator: " ").map{Int($0)!-1}
var ans = [Int]()

for target in arr {
    for _ in 0..<target%(2*N){
        queue.append(queue.removeFirst())
    }
    ans.append(queue.first!)
}
for ans in ans {
    print(ans, terminator: " ")
}