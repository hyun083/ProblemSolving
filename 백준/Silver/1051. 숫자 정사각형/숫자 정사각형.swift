import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [Int](), count: N)

for i in 0..<N{
    let numbers = readLine()!
    for number in numbers{
        map[i].append(Int(String(number))!)
    }
}

if N==1 || M==1{
    print("1")
}else{
    let range = N < M ? N : M
    var max = 1
    for r in 2...range{
        var size = 1
        for i in 0...N-r{
            for k in 0...M-r{
                let leftUp = map[i][k]
                let rightUp = map[i][k+r-1]
                let leftDown = map[i+r-1][k]
                let rightDown = map[i+r-1][k+r-1]
                if (leftUp==rightUp) && (rightUp==leftDown) && (leftDown==rightDown){
                    size = r*r
                }
            }
        }
        max = max < size ? size : max
    }
    print(max)
}