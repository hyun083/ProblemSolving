import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let N = Int(readLine()!)!
    var winner = [Int](0..<N)
    var map = [[String]]()
    for _ in 0..<N{
        let info = readLine()!.map{String($0)}
        map.append(info)
    }
    
    for i in 0..<map[0].count{
        var res = Dictionary<String,[Int]>()
        for num in winner{
            if res[map[num][i]] == nil{
                res[map[num][i]] = [num]
            }else{
                res[map[num][i]]?.append(num)
            }
        }
        if res.keys.count == 2{
            if res["R"] == nil{
                winner = res["S"]!
            }else if res["S"] == nil{
                winner = res["P"]!
            }else{
                winner = res["R"]!
            }
        }else{
            continue
        }
        if winner.count == 1{ break }
    }
    if winner.count == 1{
        print(winner.first!+1)
    }else{
        print(0)
    }
}