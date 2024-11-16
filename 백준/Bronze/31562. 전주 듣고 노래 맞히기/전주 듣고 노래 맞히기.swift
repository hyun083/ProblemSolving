import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var dic = Dictionary<[String], String>()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let key = Array(info[2...4])
    let value = info[1]
    
    if dic[key] == nil{
        dic[key] = value
    }else{
        dic[key] = "?"
    }
}

for _ in 0..<M{
    let input = readLine()!.split(separator: " ").map{String($0)}
    if dic[input] == nil{
        print("!")
    }else{
        print(dic[input]!)
    }
}