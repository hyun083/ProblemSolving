import Foundation

let N = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map.append(info)
}

func falling(size:Int){
    if size == 1{
        return
    }
    var res = [[Int]]()
    for i in stride(from: 0, to: size, by: +2){
        var num = [Int]()
        for k in stride(from: 0, to: size, by: +2){
            var tmp = [Int]()
            for x in i..<i+2{
                for y in k..<k+2{
                    tmp.append(map[x][y])
                }
            }
            num.append(tmp.sorted(by: >)[1])
        }
        res.append(num)
    }
    map = res
    falling(size: size/2)
}

falling(size: N)
print(map[0][0])