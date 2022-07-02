import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map{Int(String($0))!}
let b = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = Set<[Int:Int]>()
var res = 0

var aTree = Array(repeating: 0, count: n*4)
var bTree = Array(repeating: 0, count: n*4)

func fillATree(start:Int, end:Int, idx:Int) -> Int{
    if start == end{
        aTree[idx] = a[start]
        return aTree[idx]
    }
    let mid = (start + end)/2
    aTree[idx] = fillATree(start: start, end: mid, idx: idx*2) + fillATree(start: mid+1, end: end, idx: idx*2+1)
    return aTree[idx]
}
func fillBTree(start:Int, end:Int, idx:Int) -> Int{
    if start == end{
        bTree[idx] = b[start]
        return bTree[idx]
    }
    let mid = (start + end)/2
    bTree[idx] = fillBTree(start: start, end: mid, idx: idx*2) + fillBTree(start: mid+1, end: end, idx: idx*2+1)
    return bTree[idx]
}
fillATree(start: 0, end: n-1, idx: 1)
fillBTree(start: 0, end: n-1, idx: 1)
print(aTree)
print(bTree)
func getASum(start:Int, end:Int, idx:Int, left:Int, right:Int) -> Int{
    if left > end || right < start{
        return 0
    }
    
    if left <= start && right >= end{
        return aTree[idx]
    }
    let mid = (start + end)/2
    
    return getASum(start: start, end: mid, idx: idx*2, left: left, right: right) + getASum(start: mid+1, end: end, idx: idx*2+1, left: left, right: right)
}
func getBSum(start:Int, end:Int, idx:Int, left:Int, right:Int) -> Int{
    if left > end || right < start{
        return 0
    }
    
    if left <= start && right >= end{
        return bTree[idx]
    }
    
    let mid = (start + end)/2
    
    return getBSum(start: start, end: mid, idx: idx*2, left: left, right: right) + getBSum(start: mid+1, end: end, idx: idx*2+1, left: left, right: right)
}
var cnt = 0
for i in 0..<n{
    print("\(i)--------------")
    for k in i..<n{
        cnt += 1
        print(getASum(start: 0, end: n-1, idx: 1, left: i, right: k))
        print(getBSum(start: 0, end: n-1, idx: 1, left: i, right: k))
    }
}
print(res)
print(cnt)
