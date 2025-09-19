import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]-1

var arr = readLine()!.split(separator: " ").map{Int($0)!-1}

var q = [Int]()
var idx = 0
q.append(M)

while idx < q.count {
    let curr = q[idx]
    
    let next = arr[curr]
    if next == M{
        break
    }else{
        q.append(next)
    }
    
    idx += 1
}
print(M==arr[M] ? 0:q.count)