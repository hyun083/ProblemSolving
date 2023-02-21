//
//  main.swift
//  18436_swift
//
//  Created by Hyun on 2023/02/21.
//

import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var tree = Array(repeating: (0,0), count: N*4)

func make_tree(from:Int, to:Int, idx:Int)->(Int,Int){
    if from == to{
        if arr[from]%2==0{
            tree[idx].0 += 1
        }else{
            tree[idx].1 += 1
        }
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = make_tree(from: from, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: to, idx: idx*2+1)
    tree[idx].0 = left.0 + right.0
    tree[idx].1 = left.1 + right.1
    return tree[idx]
}

func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> (Int,Int){
    if to < min || max < from{
        return (0,0)
    }
    if min <= from && to <= max{
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    return (left.0+right.0, left.1+right.1)
}

func update_tree(from:Int, to:Int, node_idx:Int, target_idx:Int, even:Bool){
    if target_idx < from || to < target_idx{
        return
    }
    if even{
        tree[node_idx].0 += 1
        tree[node_idx].1 -= 1
    }else{
        tree[node_idx].0 -= 1
        tree[node_idx].1 += 1
    }
    if from == to{
        return
    }
    let mid = (from+to)/2
    update_tree(from: from, to: mid, node_idx: node_idx*2, target_idx: target_idx, even: even)
    update_tree(from: mid+1, to: to, node_idx: node_idx*2+1, target_idx: target_idx, even: even)
}

make_tree(from: 0, to: N-1, idx: 1)
let M = Int(readLine()!)!
var ans = [String]()

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let cmd = line[0]
    if cmd==1{
        let i = line[1]-1
        let value = line[2]
        
        if value%2 != arr[i]%2{
            update_tree(from: 0, to: N-1, node_idx: 1, target_idx: i, even: value%2==0)
        }
        arr[i] = value
    }else{
        let l = line[1]-1
        let r = line[2]-1
        let res = read_tree(from: 0, to: N-1, idx: 1, min: l, max: r)
        if cmd == 2{
            ans.append("\(res.0)")
        }else{
            ans.append("\(res.1)")
        }
    }
}
print(ans.joined(separator: "\n"))
