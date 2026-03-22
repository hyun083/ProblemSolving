import Foundation


while let line = readLine(){
    let A = line.map{String($0)}
    let B = readLine()!.map{String($0)}
    
    var tmpA = Dictionary<String,Int>()
    var tmpB = Dictionary<String,Int>()
    A.forEach {tmpA[$0, default: 0] += 1}
    B.forEach {tmpB[$0, default: 0] += 1}

    var res = ""
    for a in tmpA.sorted(by: { $0.key < $1.key }){
        if tmpB[a.key]==nil {continue}
        res += String(repeating: a.key, count: min(a.value, tmpB[a.key]!))
    }
    print(res)
}