import Foundation

let N = Int(readLine()!)!
var arr:[(s:[String], c:Int, sum:Int)] = [([String], Int, Int)]()

for _ in 0..<N{
    let s = readLine()!.map{String($0)}
    var sum = 0
    
    for i in 0..<s.count{
        if let num = Int(s[i]){
            sum += num
        }
    }
    arr.append((s,s.count,sum))
}
arr.sort(by: {
    if $0.c == $1.c{
        if $0.sum == $1.sum{
            return $0.s.joined() < $1.s.joined()
        }else{
            return $0.sum < $1.sum
        }
    }else{
        return $0.c < $1.c
    }
})

for ans in arr{
    print(ans.s.joined())
}