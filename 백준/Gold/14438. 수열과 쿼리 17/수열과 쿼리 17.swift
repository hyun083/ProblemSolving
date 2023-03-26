import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var tree = Array(repeating: 0, count: N*4)

func make_tree(from:Int, to:Int, idx:Int) -> Int{
    if from == to{
        tree[idx] = arr[from]
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = make_tree(from: from, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: to, idx: idx*2+1)
    tree[idx] = left<right ? left:right
    return tree[idx]
}

func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return 1000000001
    }
    if min <= from && to <= max{
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    return left<right ? left:right
}

func update_tree(from:Int, to:Int, node_idx:Int, target_idx:Int) -> Int{
    if target_idx < from || to < target_idx{
        return tree[node_idx]
    }
    if from == to{
        tree[node_idx] = arr[target_idx]
        return tree[node_idx]
    }
    
    let mid = (from+to)/2
    let left = update_tree(from: from, to: mid, node_idx: node_idx*2, target_idx: target_idx)
    let right = update_tree(from: mid+1, to: to, node_idx: node_idx*2+1, target_idx: target_idx)
    tree[node_idx] = left<right ? left:right
    return tree[node_idx]
}

make_tree(from: 0, to: N-1, idx: 1)
let M = Int(readLine()!)!
var ans = [String]()

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    if line[0] == 1{
        let i = line[1]-1
        let value = line[2]
        arr[i] = value
        update_tree(from: 0, to: N-1, node_idx: 1, target_idx: i)
    }else{
        let i = line[1]-1
        let j = line[2]-1
        ans.append("\(read_tree(from: 0, to: N-1, idx: 1, min: i, max: j))")
    }
}
print(ans.joined(separator: "\n"))