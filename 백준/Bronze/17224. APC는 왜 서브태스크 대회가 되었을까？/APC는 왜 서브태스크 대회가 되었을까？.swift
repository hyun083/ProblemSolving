import Foundation

let NLK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NLK[0]
let L = NLK[1]
let K = NLK[2]
var sum = 0
var cnt = 0
var arr = [(sub1:Int, sub2:Int)]()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let sub1 = info[0]
    let sub2 = info[1]
    arr.append((sub1,sub2))
}

arr = arr.sorted(by: {
    if ($0.sub1<=L && $0.sub2<=L) && !($1.sub1<=L && $1.sub2<=L) {
        return true
    }else if !($0.sub1<=L && $0.sub2<=L) && ($1.sub1<=L && $1.sub2<=L) {
        return false
    } else {
        return $0.sub1 < $1.sub1
    }
})

for (sub1, sub2) in arr{
    if cnt >= K { break }
    
    if sub2 <= L {
        sum += 140
        cnt += 1
    } else if sub1 <= L {
        sum += 100
        cnt += 1
    } else {
        continue
    }
}

print(sum)