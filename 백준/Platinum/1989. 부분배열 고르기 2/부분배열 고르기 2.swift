import Foundation

let N = Int(readLine()!)!
let arr = [0]+readLine()!.split(separator: " ").map{Int($0)!}
var sum_tree = Array(repeating: 0, count: N*4)
var idx_tree = Array(repeating: 0, count: N*4)
var ans = 0
var range = ["1","1"]

func init_sum_tree(start:Int, end:Int, node:Int) -> Int{
    if start == end{
        sum_tree[node] = arr[start]
        return sum_tree[node]
    }
    
    let mid = (start+end)/2
    let left = init_sum_tree(start: start, end: mid, node: node*2)
    let right = init_sum_tree(start: mid+1, end: end, node: node*2+1)
    sum_tree[node] = left+right
    return sum_tree[node]
}

func init_idx_tree(start:Int, end:Int, node:Int) -> Int{
    if start == end{
        idx_tree[node] = start
        return idx_tree[node]
    }
    
    let mid = (start+end)/2
    let left = init_idx_tree(start: start, end: mid, node: node*2)
    let right = init_idx_tree(start: mid+1, end: end, node: node*2+1)
    if arr[left] == arr[right]{
        idx_tree[node] = left<right ? left:right
    }else{
        idx_tree[node] = arr[left]<arr[right] ? left:right
    }
    return idx_tree[node]
}

func read_sum(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
    if end < from || to < start{
        return 0
    }
    if from <= start && end <= to{
        return sum_tree[node]
    }
    
    let mid = (start+end)/2
    let left = read_sum(start: start, end: mid, node: node*2, from: from, to: to)
    let right = read_sum(start: mid+1, end: end, node: node*2+1, from: from, to: to)
    return left + right
}

func read_idx(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
    if end < from || to < start{
        return -1
    }
    if from <= start && end <= to{
        return idx_tree[node]
    }
    
    let mid = (start+end)/2
    let left = read_idx(start: start, end: mid, node: node*2, from: from, to: to)
    let right = read_idx(start: mid+1, end: end, node: node*2+1, from: from, to: to)
    if left < 0 {
        return right
    }else if right < 0{
        return left
    }else{
        if arr[left] == arr[right]{
            return left<right ? left:right
        }else{
            return arr[left]<arr[right] ? left:right
        }
    }
}

func update_ans(from:Int, to:Int){
    let idx = read_idx(start: 1, end: N, node: 1, from: from, to: to)
    let sum = read_sum(start: 1, end: N, node: 1, from: from, to: to)
    
    if ans < sum*arr[idx]{
        ans = sum*arr[idx]
        range[0] = "\(from)"
        range[1] = "\(to)"
    }
    if from == to{ return }
    if from < idx{ update_ans(from: from, to: idx-1) }
    if idx < to{ update_ans(from: idx+1, to: to) }
}

init_idx_tree(start: 1, end: N, node: 1)
init_sum_tree(start: 1, end: N, node: 1)
update_ans(from: 1, to: N)
print(ans)
print(range.joined(separator: " "))