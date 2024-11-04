import Foundation

let N = Int(readLine()!)!
var color = Array(repeating: [Int](), count: N+1)
var arr = [(x:Int, color:Int)]()
var line = Dictionary<Int,Int>()

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let X = info[0]
    let Y = info[1]
    arr.append((X,Y))
    line[X] = 1000000000
}

arr.sort{$0.x < $1.x}

for point in arr{
    color[point.color].append(point.x)
}

for i in 1...N{
    if color[i].count == 1{
        let point = color[i][0]
        line[point]! = 0
    }
    
    for k in stride(from: 0, to: color[i].count-1, by: +1){
        let curr = color[i][k]
        let next = color[i][k+1]
        let length = next-curr
        
        line[curr]! = min(line[curr]!,length)
        line[next]! = min(line[next]!,length)
    }
}
var total = line.values.reduce(0){$0+$1}
print(total)