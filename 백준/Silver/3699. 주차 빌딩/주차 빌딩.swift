import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let HL = readLine()!.split(separator: " ").map{Int($0)!}
    let H = HL[0]
    let L = HL[1]
    var people = Dictionary<Int,(x:Int, y:Int)>()
    for h in 0..<H{
        let info = readLine()!.split(separator: " ").map{Int($0)!}
        for l in 0..<L{
            let num = info[l]
            if num < 0 { continue}
            people[num] = (x:h, y:l)
        }
    }
    var position = Array(repeating: 0, count: H)
    let arr = people.sorted(by: {$0.key < $1.key})
    var ans = 0
    for i in 0..<arr.count{
        let target = arr[i].value
        var res = target.x * 10 * 2
        let curr = position[target.x]
        let tmp = abs(target.y-curr)
        let antiTmp = abs(L-tmp)
        res += min(tmp,antiTmp)*5
        position[target.x] = target.y
        ans += res
    }
    print(ans)
}