import Foundation

let N = Int(readLine()!)!
var arr = [(value:Int,idx:Int)]()
let num = readLine()!.split(separator: " ").map{Int($0)!}
var tree = Array(repeating: 0, count: N*4)

for i in 0..<N{
    arr.append((num[i],i))
}
arr.sort(by: {$0.value<$1.value})

func update_tree(from:Int, to:Int, idx:Int, target_idx:Int, value:Int) -> Int{
    if target_idx < from || to < target_idx{
        return tree[idx]
    }
    if from == to{
        tree[idx] = value
        return tree[idx]
    }
    let mid = (from+to)/2
    let left = update_tree(from: from, to: mid, idx: idx*2, target_idx: target_idx, value: value)
    let right = update_tree(from: mid+1, to: to, idx: idx*2+1, target_idx: target_idx, value: value)
    tree[idx] = left<right ? right:left
    return tree[idx]
}

func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return 0
    }
    if min <= from && to <= max{
        return tree[idx]
    }
    let mid = (from+to)/2
    let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    return left<right ? right:left
}

for i in 0..<N{
    let idx = arr[i].idx
    let length = read_tree(from: 0, to: N-1, idx: 1, min: 0, max: idx)
    update_tree(from: 0, to: N-1, idx: 1, target_idx: idx, value: length+1)
}
print(N-tree[1])