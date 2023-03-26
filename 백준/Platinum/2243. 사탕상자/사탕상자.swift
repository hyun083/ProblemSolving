import Foundation

var ans = [String]()
let max = 1000000
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

func pop_candy(from:Int, to:Int, idx:Int, cnt:Int) -> Int{
    tree[idx] -= 1
    if from == to{
        return from
    }
    let mid = (from+to)/2
    let left = tree[idx*2]
    
    if left >= cnt{
        return pop_candy(from: from, to: mid, idx: idx*2, cnt: cnt)
    }else{
        return pop_candy(from: mid+1, to: to, idx: idx*2+1, cnt: cnt-left)
    }
}

let N = Int(readLine()!)!
for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    if line[0] == 1{
        let cnt = line[1]
        let res = pop_candy(from: 0, to: max-1, idx: 1, cnt: cnt)
        ans.append("\(res+1)")
    }else{
        let idx = line[1]-1
        let v = line[2]
        update_tree(from: 0, to: max-1, idx: 1, target_idx: idx, value: v)
    }
}
print(ans.joined(separator: "\n"))