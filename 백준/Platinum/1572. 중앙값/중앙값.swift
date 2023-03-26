import Foundation
let max = 65537

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var ans = 0
var arr = [Int]()
var tree = Array(repeating: 0, count: max*4)

func update_tree(from:Int, to:Int, idx:Int, target_idx:Int, value:Int){
    if target_idx < from || to < target_idx{
        return
    }
    
    tree[idx] += value
    if from == to{
        return
    }
    
    let mid = (from+to)/2
    update_tree(from: from, to: mid, idx: idx*2, target_idx: target_idx, value: value)
    update_tree(from: mid+1, to: to, idx: idx*2+1, target_idx: target_idx, value: value)
}

func read_tree(from:Int, to:Int, idx:Int, num:Int) -> Int{
    if from == to{
        return from
    }
    
    let mid = (from+to)/2
    let left = tree[idx*2]
    
    if left >= num{
        return read_tree(from: from, to: mid, idx: idx*2, num: num)
    }else{
        return read_tree(from: mid+1, to: to, idx: idx*2+1, num: num-left)
    }
}

var pre = 0
for i in 1...N{
    let num = Int(readLine()!)!
    arr.append(num)
    update_tree(from: 0, to: max-1, idx: 1, target_idx: num, value: 1)
    if i >= K{
        ans += read_tree(from: 0, to: max-1, idx: 1, num: (K+1)/2)
        update_tree(from: 0, to: max-1, idx: 1, target_idx: arr[pre], value: -1)
        pre += 1
    }
}
print(ans)