import Foundation

let N = Int(readLine()!)!
var arr = [(country:Int, student:Int, score:Int)]()
var dic = Dictionary<Int,Int>()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let C = info[0]
    let S = info[1]
    let score = info[2]
    
    arr.append((C,S,score))
    if dic[C] == nil{ dic[C] = 0 }
}
arr.sort(by: {$0.score > $1.score})

var prize = 1
for info in arr{
    if dic[info.country]! >= 2{
        continue
    }else{
        dic[info.country]! += 1
        print(info.country, info.student)
        prize += 1
    }
    if prize > 3{ break }
}