import Foundation
let T = Int(readLine()!)!

for _ in 0..<T{
    let JN = readLine()!.split(separator: " ").map{Int($0)!}
    let J = JN[0]
    let N = JN[1]
    var arr = [Int]()
    for _ in 0..<N{
        let RC = readLine()!.split(separator: " ").map{Int($0)!}
        let R = RC[0]
        let C = RC[1]
        arr.append(R*C)
    }
    arr.sort(by:<)

    var tmp = 0
    var ans = 0
    while tmp < J{
        tmp += arr.removeLast()
        ans += 1
    }
    print(ans)
}