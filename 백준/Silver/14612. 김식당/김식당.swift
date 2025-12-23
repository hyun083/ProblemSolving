import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var table = Array<(num:Int, time:Int)>()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let CMD = info[0]
    if CMD == "order"{
        let num = Int(info[1])!
        let time = Int(info[2])!
        table.append((num,time))
        for order in table{
            print(order.num, terminator: " ")
        }
        print()
    }else if CMD == "sort"{
        table.sort(by: { $0.time == $1.time ? $0.num<$1.num : $0.time<$1.time })
        if table.isEmpty{
            print("sleep")
        }else{
            for order in table{
                print(order.num, terminator: " ")
            }
            print()
        }
    }else if CMD == "complete"{
        let target = Int(info[1])!
        var targetIdx = -1
        
        for i in 0..<table.count{
            let order = table[i]
            if order.num == target{
                targetIdx = i
                break
            }
        }
        if targetIdx>=0{ table.remove(at: targetIdx) }
        
        if table.isEmpty{
            print("sleep")
        }else{
            for order in table{
                print(order.num, terminator: " ")
            }
            print()
        }
    }else{
        continue
    }
}