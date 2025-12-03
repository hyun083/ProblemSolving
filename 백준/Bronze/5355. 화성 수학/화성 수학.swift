import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let line = readLine()!.split(separator: " ").map{String($0)}
    var num = Double(line[0])!
    for i in 1..<line.count{
        let op = line[i]
        if op == "@"{
            num *= 3
        }else if op == "%"{
            num += 5
        }else if op == "#"{
            num -= 7
        }else{
            continue
        }
    }
    print(String(format: "%.2f", num))
}