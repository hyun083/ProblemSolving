import Foundation

let (S,E,Q) = [readLine()!.split(separator: " ").map{String($0)}].map{($0[0], $0[1], $0[2])}[0]
let start = [S.split(separator: ":").map{Int($0)!}].map{$0[0]*60 + $0[1]}[0]
let end = [E.split(separator: ":").map{Int($0)!}].map{$0[0]*60 + $0[1]}[0]
let quick = [Q.split(separator: ":").map{Int($0)!}].map{$0[0]*60 + $0[1]}[0]
var arr = Set<String>()
var ans = Set<String>()

while let line = readLine(){
    let info = line.split(separator: " ").map{String($0)}
    let time = [info[0].split(separator: ":").map{Int($0)!}].map{($0[0]*60 + $0[1])}[0]
    let name = info[1]
    
    if time <= start{
        arr.insert(name)
    }else if end <= time && time <= quick && arr.contains(name){
        ans.insert(name)
    }
}

print(ans.count)