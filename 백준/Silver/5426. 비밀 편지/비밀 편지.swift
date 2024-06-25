import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let S = readLine()!.map{String($0)}
    var size = 1
    while size*size < S.count{
        size += 1
    }
    
    var res = Array(repeating: Array(repeating: "", count: size), count: size)
    for i in 0..<size{
        for k in 0..<size{
            res[i][k] = S[(i*size)+k]
        }
    }
    for k in (0..<size).reversed(){
        for i in 0..<size{
            print(res[i][k],terminator: "")
        }
    }
    print()
}