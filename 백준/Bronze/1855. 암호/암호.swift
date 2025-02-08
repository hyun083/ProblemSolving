import Foundation

let K = Int(readLine()!)!
let arr = readLine()!.map{String($0)}
var map = Array(repeating: Array(repeating: "", count: K), count: arr.count/K)

for i in 0..<arr.count{
    let row = (i)/K
    let col = (i)%K
    map[row][col] += arr[i]
}

for i in stride(from: 1, to: arr.count/K, by: +2){
    map[i] = Array(map[i].reversed())
}

for i in 0..<K{
    for k in 0..<arr.count/K{
        print(map[k][i],terminator: "")
    }
}