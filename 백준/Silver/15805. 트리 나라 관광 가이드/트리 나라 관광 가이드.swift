import Foundation

let N = Int(readLine()!)!/2+1
let cities = readLine()!.split(separator: " ").map{Int(String($0))!}
var tree = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

var p = 0
var c = 1

while p < cities.count-1{
    tree[cities[p]].append(cities[c])
    p += 1
    c += 1
}

print(N)
let root = cities.first!
for i in tree.indices{
    if i == root{
        print(-1,terminator: " ")
    }else{
        print(tree[i].last!,terminator: " ")
    }
}