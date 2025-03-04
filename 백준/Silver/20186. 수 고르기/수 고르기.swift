import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var input = readLine()!.split(separator: " ").map{Int($0)!}
var tmp = [(idx:Int, value:Int)]()
for idx in 0..<N{
    let num = input[idx]
    tmp.append((idx:idx, value:num))
}
tmp.sort(by: {
    $0.value == $1.value ? $0.idx > $1.idx : $0.value < $1.value
})
var arr = [(idx:Int,value:Int)]()
var ans = [Int]()

for _ in 0..<K{
    arr.append(tmp.removeLast())
}
arr.sort(by: {$0.idx > $1.idx})
for _ in 0..<K{
    ans.append(arr.removeLast().value-ans.count)
}
print(ans.reduce(0, +))