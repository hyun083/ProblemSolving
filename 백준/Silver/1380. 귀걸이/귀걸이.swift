import Foundation
var T = 1
while let line = readLine(){
    if line == "0"{
        break
    }
    let n = Int(line)!
    var girls = Array(repeating: String(), count: n)
    var visited = Array(repeating: false, count: n)
    for i in 0..<n{
        girls[i] = readLine()!
    }
    for _ in 0..<2*n-1{
        let earring = readLine()!.split(separator: " ").map{String($0)}
        let number = Int(earring[0])! - 1
        visited[number] = !visited[number]
    }
    for i in 0..<n{
        if visited[i]{
            print(T,girls[i])
        }
    }
    T += 1
}