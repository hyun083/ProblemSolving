import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let NM = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NM[0]
    let _ = NM[1]
    var prize = [(award:Int, sticker:[Int])]()
    for _ in 0..<N{
        var info = readLine()!.split(separator: " ").map{Int($0)!}
        let award = info.removeLast()
        let _ = info.removeFirst()
        prize.append((award,info))
    }
    let arr = readLine()!.split(separator: " ").map{Int($0)!}
    var sum = 0
    for i in 0..<N{
        let curr = prize[i]
        var count = 101
        for num in curr.sticker{
            count = min(count, arr[num-1])
        }
        sum += count * curr.award
    }
    print(sum)
}