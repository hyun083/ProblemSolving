import Foundation

let NQ = readLine()!.split(separator: " ").map{Int($0)!}
let N = NQ[0]
let Q = NQ[1]

var tree = Array(repeating: 0, count: N*4)

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
    return left+right
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

var ans = [String]()
for _ in 0..<Q{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    if line[0] == 1{
        let p = line[1]-1
        let x = line[2]
        update_tree(from: 0, to: N-1, idx: 1, target_idx: p, value: x)
    }else{
        let p = line[1]-1
        let q = line[2]-1
        ans.append("\(read_tree(from: 0, to: N-1, idx: 1, min: p, max: q))")
    }
}
print(ans.joined(separator: "\n"))