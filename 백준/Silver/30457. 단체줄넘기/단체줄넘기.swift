import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by:<)
var left = [Int]()
var right = [Int]()

for _ in 0..<N{
    let curr = arr.removeLast()
    if left.isEmpty{
        left.append(curr)
    }else{
        if left.last! > curr{
            left.append(curr)
        }else if right.isEmpty{
            right.append(curr)
        }else if right.last! > curr{
            right.append(curr)
        }
    }
}
print(left.count + right.count)