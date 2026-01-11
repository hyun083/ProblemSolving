import Foundation

var info = readLine()!.split(separator: "+").map{String($0)}
let M1 = info[0]
info = info[1].split(separator: "=").map{String($0)}
let M2 = info[0]
let M3 = info[1]

func getComponent(of str: String) -> Dictionary<String,Int>{
    let arr = str.map{String($0)}
    var res = Dictionary<String,Int>()
    for i in 0..<arr.count{
        if let num = Int(arr[i]){
            continue
        }else{
            let key = arr[i]
            let num = i==arr.count-1 ? 1 : Int(arr[i+1]) ?? 1
            res[key, default: 0] += num
        }
    }
    return res
}
let R1 = getComponent(of: M1)
let R2 = getComponent(of: M2)
let R3 = getComponent(of: M3)
var flag = false

for i in 1...10{
    if flag { break }
    let X1 = R1.mapValues { $0 * i }
    for k in 1...10{
        if flag { break }
        let X2 = R2.mapValues{ $0 * k }
        for p in 1...10{
            let X3 = R3.mapValues{ $0 * p }
            var res = X1
            for (key, value) in X2{
                res[key, default: 0] += value
            }
            if X3 == res{
                flag = true
                print(i,k,p)
                break
            }
        }
    }
}