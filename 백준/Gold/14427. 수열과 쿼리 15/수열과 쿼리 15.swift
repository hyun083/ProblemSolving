import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var tree = Array(repeating: -1, count: N*4)

func make_tree(from:Int, to:Int, idx:Int) -> Int{
    if from == to{
        tree[idx] = from
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = make_tree(from: from, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: to, idx: idx*2+1)
    
    if arr[left] == arr[right]{
        tree[idx] = left<right ? left:right
    }else{
        tree[idx] = arr[left]<arr[right] ? left:right
    }
    
    return tree[idx]
}

func update_tree(from:Int, to:Int, idx:Int, target_idx:Int, value:Int) -> Int{
    if target_idx < from || to < target_idx{
        return tree[idx]
    }
    if from == to{
        arr[target_idx] = value
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = update_tree(from: from, to: mid, idx: idx*2, target_idx: target_idx, value: value)
    let right = update_tree(from: mid+1, to: to, idx: idx*2+1, target_idx: target_idx, value: value)
    
    if arr[left] == arr[right]{
        tree[idx] = left<right ? left:right
    }else{
        tree[idx] = arr[left]<arr[right] ? left:right
    }
    return tree[idx]
}

var ans = [String]()
make_tree(from: 0, to: N-1, idx: 1)
let M = Int(readLine()!)!
for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    if line[0] == 1{
        let i = line[1]-1
        let v = line[2]
        update_tree(from: 0, to: N-1, idx: 1, target_idx: i, value: v)
    }else{
        ans.append("\(tree[1]+1)")
    }
}
print(ans.joined(separator: "\n"))