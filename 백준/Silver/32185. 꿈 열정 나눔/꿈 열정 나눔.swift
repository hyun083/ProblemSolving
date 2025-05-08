import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

let VPS = readLine()!.split(separator: " ").map{Int($0)!}
let J = (VPS[0],VPS[1],VPS[2],0)
let target = VPS.reduce(0, +)
var arr = [(V:Int, P:Int, S:Int, num:Int)]()
var ans = [Int]()
ans.append(0)

for num in 0..<N{
    let VPS = readLine()!.split(separator: " ").map{Int($0)!}
    let V = VPS[0]
    let P = VPS[1]
    let S = VPS[2]
    arr.append((V,P,S,num+1))
}
arr.sort(by:{$0.V+$0.P+$0.S > $1.V+$1.P+$1.S})

for i in 0..<N{
    if ans.count == M { break }
    let sum = arr[i].P + arr[i].S + arr[i].V
    if sum > target{
        continue
    }else{
        ans.append(arr[i].num)
    }
}
for num in ans.sorted(by:<){
    print(num,terminator: " ")
}