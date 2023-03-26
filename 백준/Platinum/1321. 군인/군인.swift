import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var tree = Array(repeating: 0, count: N*4)

func make_tree(from:Int, to:Int, idx:Int) -> Int{
    if from == to{
        tree[idx] = arr[from]
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = make_tree(from: from, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: to, idx: idx*2+1)
    tree[idx] = left+right
    return tree[idx]
}

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

func soldier_num(from:Int, to:Int, idx:Int, num:Int) -> Int{
    if from == to{
        return from
    }
    let mid = (from+to)/2
    let left = tree[idx*2]
    if left >= num{
        return soldier_num(from: from, to: mid, idx: idx*2, num: num)
    }else{
        return soldier_num(from: mid+1, to: to, idx: idx*2+1, num: num-left)
    }
}

make_tree(from: 0, to: N-1, idx: 1)
var ans = [String]()

let M = Int(readLine()!)!
for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let cmd = line[0]
    
    if cmd == 1{
        let i = line[1]-1
        let v = line[2]
        update_tree(from: 0, to: N-1, idx: 1, target_idx: i, value: v)
    }else{
        let i = line[1]
        ans.append("\(soldier_num(from: 0, to: N-1, idx: 1, num: i)+1)")
    }
}
print(ans.joined(separator: "\n"))