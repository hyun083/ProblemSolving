import Foundation

let NQ = readLine()!.split(separator: " ").map{Int($0)!}
let N = NQ[0]
let Q = NQ[1]

var S = readLine()!.map{Character(String($0)).asciiValue!}
for _ in 0..<Q{
    let line = readLine()!.split(separator: " ").map{Int($0)!-1}
    let CMD = line[0]
    let L = line[1]
    let R = line[2]
    if CMD == 0{
        var res = 1
        for idx in stride(from: L, through: R-1, by: +1){
            if S[idx] != S[idx+1]{
                res += 1
            }else{
                continue
            }
        }
        print(res)
    }else{
        for idx in L...R{
            S[idx] = S[idx]+1>90 ? 65:S[idx]+1
        }
    }
}