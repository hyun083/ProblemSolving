import Foundation

let str = readLine()!.map{String($0)}
for _ in 0..<Int(readLine()!)!{
    let line = readLine()!.split(separator: " ").map{String($0)}
    let alpha = line[0]
    let i = Int(line[1])! + 1
    let j = Int(line[2])! + 1
    var temp = 0
    var psum = [0]
    for a in str{
        if a == alpha{
            temp += 1
        }
        psum.append(temp)
    }
    print(psum[j] - psum[i-1])
}