import Foundation

let T = Int(readLine()!)!
for t in 1...T{
    let N = Int(readLine()!)!
    let arr:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
    var tmp = Dictionary<Int,Int>()
    for i in 0..<N*2{
        let price = arr[i]
        if tmp[price]==nil{
            tmp[price] = 1
        }else{
            tmp[price]! += 1
        }
    }
    var ans = [Int]()
    for price in tmp.keys.sorted(by: >){
        let cnt = tmp[price]!
        if cnt == 0 { continue }
        
        let discount = price/4*3
        if tmp[discount] != nil{
            tmp[discount]! -= cnt
            for _ in 0..<cnt{
                ans.append(discount)
            }
        }
    }
    print("Case #\(t):",terminator: " ")
    for price in ans.sorted(by: <){
        print(price,terminator: " ")
    }
}