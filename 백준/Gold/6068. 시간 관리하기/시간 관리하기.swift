import Foundation

let N = Int(readLine()!)!
var arr = [(T:Int, S:Int)]()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let (t, s) = (info[0], info[1])
    arr.append((t,s))
}
arr.sort(by: {$0.S < $1.S})
var last = arr.removeLast()
var curr = last.S-last.T

while arr.isEmpty == false{
    last = arr.removeLast()
    if curr <= last.S {
        curr -= last.T
    }else{
        curr = last.S-last.T
    }
}
print(curr<0 ? -1:curr)