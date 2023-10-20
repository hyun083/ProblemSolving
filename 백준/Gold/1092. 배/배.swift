import Foundation

let N = Int(readLine()!)!
var cranes = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: {$0 > $1})
let M = Int(readLine()!)!
var boxes = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: {$0 > $1})
var ans = 0

if cranes[0] < boxes[0]{
    ans -= 1
}else{
    while !boxes.isEmpty{
        for crane in cranes {
            for i in 0..<boxes.count{
                if crane >= boxes[i]{
                    boxes.remove(at: i)
                    break
                }
            }
        }
        ans += 1
    }
}
print(ans)