import Foundation

let N = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map{Int($0)!}
var arr = [(value:Int,idx:Int)]()
var tree = Array(repeating: 0, count: N*4)
var ans = 0

for i in 0..<N{
    arr.append((num[i],i))
}
arr.sort(by:{ $0.value < $1.value })

func update_tree(from:Int, to:Int, node:Int, target_idx:Int, value:Int){
    if target_idx < from || to < target_idx{
        return
    }
    tree[node] += value
    if from == to{
        return
    }
    let mid = (from+to)/2
    update_tree(from: from, to: mid, node: node*2, target_idx: target_idx, value: value)
    update_tree(from: mid+1, to: to, node: node*2+1, target_idx: target_idx, value: value)
}

func read_tree(from:Int, to:Int, node:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return 0
    }
    if min <= from && to <= max{
        return tree[node]
    }
    let mid = (from+to)/2
    let left = read_tree(from: from, to: mid, node: node*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: to, node: node*2+1, min: min, max: max)
    return left + right
}

for num in arr{
    ans += read_tree(from: 0, to: N-1, node: 1, min: num.idx, max: N-1)
    update_tree(from: 0, to: N-1, node: 1, target_idx: num.idx, value: 1)
}
print(ans)