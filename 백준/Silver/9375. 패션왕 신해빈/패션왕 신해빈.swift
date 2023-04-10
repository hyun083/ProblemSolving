import Foundation

let T = Int(readLine()!)!
var txt = [String]()
for _ in 1...T{
    let N = Int(readLine()!)!
    var clothes:[String:Int] = [:]
    var ans = 1
    if N == 0{
        txt.append(String(0))
        continue
    }
    for _ in 1...N{
        let inputs = readLine()!.split(separator: " ").map{String($0)}
        if clothes[inputs[1]] == nil {
            clothes[inputs[1]] = 1
        }else{
            clothes[inputs[1]]! += 1
        }
    }
    for c in clothes {
        ans *= c.value + 1
    }
    txt.append(String(ans-1))
}
print(txt.joined(separator: "\n"))