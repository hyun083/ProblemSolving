import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let line = readLine()!.split(separator: " ").map{String($0)}
    let len = max(line[0].count, line[1].count)
    let A = Array(repeating: "0", count: len-line[0].count) + line[0].map{String($0)}
    let B = Array(repeating: "0", count: len-line[1].count) + line[1].map{String($0)}
    var temp = "0"
    var res = [String]()
    
    for i in stride(from: len-1, through: 0, by: -1) {
        let a = A[i]
        let b = B[i]
        if a=="0" && b=="0" {
            res.append(temp)
            temp = "0"
        } else if a == "1" && b == "1"{
            res.append(temp)
            temp = "1"
        } else {
            res.append(temp=="1" ? "0":"1")
        }
    }
    
    res.append(temp)
    while res.last=="0"{
        _ = res.removeLast()
    }
    
    if res.isEmpty{
        print("0")
    }else{
        print(res.reversed().joined())
    }
}