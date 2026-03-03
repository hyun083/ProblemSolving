import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let id = info[0]
    let strategy = Double(info[1])
    let management = Double(info[2])
    let technology = Double(info[3])
    let sum = Int(strategy + management + technology)
    var res = "FAIL"
    if 55 <= sum && 0.35*30 <= strategy && 0.25*30 <= management && 0.40*30 <= technology{
        res = "PASS"
    }
    print(id,sum,res)
}