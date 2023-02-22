//
//  main.swift
//  5676_swift
//
//  Created by Hyun on 2023/02/22.
//

import Foundation

var ans = [String]()
while let line = readLine(){
    var res = ""
    
    let NK = line.split(separator: " ").map{Int($0)!}
    let N = NK[0]
    let K = NK[1]
    
    var arr = readLine()!.split(separator: " ").map{Int($0)!}
    var tree = Array(repeating: 1, count: N*4)
    
    func make_tree(from:Int, to:Int, idx:Int)->Int{
        if from == to{
            arr[from] = arr[from]<0 ? -1: arr[from]>0 ? 1:0
            tree[idx] = arr[from]
            return tree[idx]
        }
        let mid = (from+to)/2
        let left = make_tree(from: from, to: mid, idx: idx*2)
        let right = make_tree(from: mid+1, to: to, idx: idx*2+1)
        tree[idx] = left*right
        return tree[idx]
    }
    
    func update_tree(from:Int, to:Int, node_idx:Int, target_idx:Int, value:Int) -> Int{
        if target_idx < from || to < target_idx{
            return tree[node_idx]
        }
        if from == to{
            arr[target_idx] = value
            tree[node_idx] = value
            return tree[node_idx]
        }
        
        let mid = (from+to)/2
        let left = update_tree(from: from, to: mid, node_idx: node_idx*2, target_idx: target_idx, value: value)
        let right = update_tree(from: mid+1, to: to, node_idx: node_idx*2+1, target_idx: target_idx, value: value)
        tree[node_idx] = left*right
        return tree[node_idx]
    }
    
    func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
        if to < min || max < from{
            return 1
        }
        if min <= from && to <= max{
            return tree[idx]
        }
        
        let mid = (from+to)/2
        let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
        let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
        return left*right
    }
    
    make_tree(from: 0, to: N-1, idx: 1)
    for _ in 0..<K{
        let line = readLine()!.split(separator: " ").map{String($0)}
        let cmd = line[0]
        if cmd == "C"{
            let i = Int(line[1])!-1
            var v = Int(line[2])!

            update_tree(from: 0, to: N-1, node_idx: 1, target_idx: i, value: v<0 ? -1:v>0 ? 1:0)
        }else{
            let i = Int(line[1])!-1
            let j = Int(line[2])!-1
            let tmp = read_tree(from: 0, to: N-1, idx: 1, min: i, max: j)
            
            if tmp < 0{
                res+="-"
            }else if tmp == 0{
                res+="0"
            }else{
                res+="+"
            }
        }
    }
    ans.append(res)
}
print(ans.joined(separator: "\n"))
