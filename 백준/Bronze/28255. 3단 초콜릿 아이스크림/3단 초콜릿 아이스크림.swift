import Foundation

let T = Int(readLine()!)!

func tailed(_ s:String) -> String {
    var res = s.map{String($0)}
    res.removeFirst()
    return res.joined()
}

for _ in 0..<T {
    let S = readLine()!.map{String($0)}
    let N = S.count
    var res = 0
    for i in 0..<N/2 {
        let target = S.joined()
        let prime = S[0...i].joined()
        let rev = String(prime.reversed())
        let tailedPrime = tailed(prime)
        let tailedRev = tailed(rev)
        //print(prime,rev,tailedPrime,tailedRev)
        
        if target == prime+rev+prime {
            res = 1
            break
        } else if target == prime + tailedRev + prime {
            res = 1
            break
        } else if target == prime + rev + tailedPrime {
            res = 1
            break
        } else if target == prime + tailedRev + tailedPrime {
            res = 1
            break
        } else {
            continue
        }
    }
    print(res)
}