import Foundation

let KM = readLine()!.split(separator: " ").map{Int($0)!}
let K = KM[0]
let M = KM[1]

var idx = Dictionary<String,Int>()
var q = [String]()

for i in 0..<M{
    let num = readLine()!
    
    if idx[num] == nil{
        idx[num] = i
    }else{
        q[idx[num]!] = "blank"
        idx[num] = i
    }
    q.append(num)
}

var cnt = 0

for i in 0..<M{
    if q[i] == "blank"{ continue }
    if cnt == K { break }
    print(q[i])
    cnt += 1
}