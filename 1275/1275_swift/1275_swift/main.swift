//
//  main.swift
//  1275_swift
//
//  Created by Hyun on 2023/02/22.
//

import Foundation

let NQ = readLine()!.split(separator: " ").map{Int($0)!}
let N = NQ[0]
let Q = NQ[1]

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
    tree[idx] = left+right
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
    return left + right
}

func update_tree(from:Int, to:Int, node_idx:Int, target_idx:Int, value:Int){
    if target_idx < from || to < target_idx{
        return
    }
    
    tree[node_idx] += value
    if from == to{
        arr[target_idx] += value
        return
    }
    
    let mid = (from+to)/2
    update_tree(from: from, to: mid, node_idx: node_idx*2, target_idx: target_idx, value: value)
    update_tree(from: mid+1, to: to, node_idx: node_idx*2+1, target_idx: target_idx, value: value)
}

make_tree(from: 0, to: N-1, idx: 1)
var ans = [String]()

for _ in 0..<Q{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let x = line[0]-1
    let y = line[1]-1
    let a = line[2]-1
    let value = line[3] - arr[a]
    
    ans.append("\(read_tree(from: 0, to: N-1, idx: 1, min: x<y ? x:y, max: x>y ? x:y))")
    update_tree(from: 0, to: N-1, node_idx: 1, target_idx: a, value: value)
}
print(ans.joined(separator: "\n"))
