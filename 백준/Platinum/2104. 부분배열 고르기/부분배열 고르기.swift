import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var sumTree = Array(repeating: 0, count: N*4)
var idxTree = Array(repeating: 0, count: N*4)
var ans = 0

func init_sumTree(from:Int, to:Int, idx:Int) -> Int{
    if from == to{
        sumTree[idx] = arr[from]
        return sumTree[idx]
    }
    let mid = (from+to)/2
    let left = init_sumTree(from: from, to: mid, idx: idx*2)
    let right = init_sumTree(from: mid+1, to: to, idx: idx*2+1)
    sumTree[idx] = left+right
    return sumTree[idx]
}

func init_idxTree(from:Int, to:Int, idx:Int) -> Int{
    if from == to{
        idxTree[idx] = from
        return idxTree[idx]
    }
    let mid = (from+to)/2
    let left = init_idxTree(from: from, to: mid, idx: idx*2)
    let right = init_idxTree(from: mid+1, to: to, idx: idx*2+1)
    idxTree[idx] = arr[left]<arr[right] ? left:right
    return idxTree[idx]
}

func readSum(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return 0
    }
    if min <= from && to <= max{
        return sumTree[idx]
    }
    let mid = (from+to)/2
    let left = readSum(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = readSum(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    return left + right
}

func readIdx(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return -1
    }
    if min <= from && to <= max{
        return idxTree[idx]
    }
    let mid = (from+to)/2
    let left = readIdx(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = readIdx(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    if left < 0{
        return right
    }else if right < 0{
        return left
    }
    return arr[left]<arr[right] ? left:right
}

func update_ans(min:Int, max:Int){
    let point = readIdx(from: 0, to: N-1, idx: 1, min: min, max: max)
    let mymin = arr[point]
    let sum = readSum(from: 0, to: N-1, idx: 1, min: min, max: max)
    let result = sum * mymin
    ans = ans<result ? result:ans
    
    if min==max{ return }
    if min < point{
        update_ans(min: min, max: point-1)
    }
    if point < max{
        update_ans(min: point+1, max: max)
    }
}

init_sumTree(from: 0, to: N-1, idx: 1)
init_idxTree(from: 0, to: N-1, idx: 1)
update_ans(min: 0, max: N-1)
print(ans)