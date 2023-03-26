import Foundation

let N = Int(readLine()!)!
var ans = Array(repeating: "", count: N)
var arr = [Int]()
var tree = Array(repeating: 0, count: N*4)

for _ in 0..<N{
    arr.append(Int(readLine()!)!+1)
}

func init_tree(from:Int, to:Int, idx:Int) ->Int{
    if from == to{
        tree[idx] = 1
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = init_tree(from: from, to: mid, idx: idx*2)
    let right = init_tree(from: mid+1, to: to, idx: idx*2+1)
    tree[idx] = left + right
    return tree[idx]
}
init_tree(from: 0, to: N-1, idx: 1)

func read_idx(from:Int, to:Int, idx:Int, count:Int) -> Int{
    tree[idx] -= 1
    if from == to{
        return from
    }
    
    let mid = (from+to)/2
    let left = tree[idx*2]
    
    if left >= count{
        return read_idx(from: from, to: mid, idx: idx*2, count: count)
    }else{
        return read_idx(from: mid+1, to: to, idx: idx*2+1, count: count-left)
    }
}

for i in 0..<N{
    let count = arr[i]
    let idx = read_idx(from: 0, to: N-1, idx: 1, count: count)
    ans[idx] = "\(i+1)"
}
print(ans.joined(separator: "\n"))