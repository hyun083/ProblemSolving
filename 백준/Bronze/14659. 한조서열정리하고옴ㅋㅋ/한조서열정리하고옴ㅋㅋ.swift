import Foundation

let N = Int(readLine()!)!
let mountains = readLine()!.split(separator: " ").map{Int(String($0))!}
var res = [Int]()
var temp = mountains[0]
var cnt = 0

for i in 0..<N{
    if temp > mountains[i]{
        cnt += 1
    }else{
        res.append(cnt)
        cnt = 0
        temp = mountains[i]
    }
}
if res.isEmpty{
    print(cnt)
}else{
    print(max(cnt, res.max()!))
}