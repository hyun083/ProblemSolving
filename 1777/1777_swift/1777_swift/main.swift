//
//  main.swift
//  1777_swift
//
//  Created by Hyun on 2023/03/05.
//

import Foundation

let N = Int(readLine()!)!
var ans = Array(repeating: "", count: N)
let arr = readLine()!.split(separator: " ").map{Int($0)!+1}
var tree = Array(repeating: 0, count: N*4)

func init_tree(from:Int, to:Int, idx:Int) -> Int{
    if from == to{
        tree[idx] = 1
        return tree[idx]
    }
    let mid = (from+to)/2
    let left = init_tree(from: from, to: mid, idx: idx*2)
    let right = init_tree(from: mid+1, to: to, idx: idx*2+1)
    tree[idx] = left+right
    return tree[idx]
}

func read_idx(from:Int, to:Int, idx:Int, count:Int) -> Int{
    tree[idx] -= 1
    if from == to{
        return from
    }
    let mid = (from+to)/2
    let right = tree[idx*2+1]
    if count <= right{
        return read_idx(from: mid+1, to: to, idx: idx*2+1, count: count)
    }else{
        return read_idx(from: from, to: mid, idx: idx*2, count: count - right)
    }
}

init_tree(from: 0, to: N-1, idx: 1)
for i in (0..<N).reversed(){
    let count = arr[i]
    let idx = read_idx(from: 0, to: N-1, idx: 1, count: count)
    ans[idx] = "\(i+1)"
}
print(ans.joined(separator: " "))
