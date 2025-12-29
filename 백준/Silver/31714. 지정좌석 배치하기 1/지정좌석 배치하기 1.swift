import Foundation

let NMD = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMD[0]
let M = NMD[1]
let D = NMD[2]
var arr = [[Int]]()
var flag = true

for floor in 1...N{
    let line = readLine()!.split(separator: " ").map{Int($0)! + (floor*D)}.sorted()
    arr.append(line)
}

for idx in 0..<M{
    for floor in 1..<N{
        let curr = arr[floor][idx]
        let pre = arr[floor-1][idx]
        if pre >= curr{
            flag = false
            break
        }
    }
    if flag == false{ break }
}
print(flag ? "YES":"NO")