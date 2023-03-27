import Foundation

let N = Int(readLine()!)!
var time = Array(repeating: 0, count: N)
var map = Array(repeating: [Int](), count: N)
var result = Array(repeating: 0, count: N)
var queue = [Int]()
var check = Array(repeating: 0, count: N)

for i in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    time[i] = line[0]
    
    for k in 1..<line.count{
        if line[k] != -1{
            map[line[k]-1].append(i)
            check[i] += 1
        }
    }
}

for i in 0..<N{
    result[i] = time[i]
    if check[i] == 0{
        queue.append(i)
        check[i] = -1
    }
}

while !queue.isEmpty{
    let idx = queue.removeLast()
    for i in map[idx]{
        result[i] = max(result[i], result[idx]+time[i])
        check[i] -= 1
    }
    for i in 0..<N{
        if check[i] == 0{
            queue.append(i)
            check[i] = -1
        }
    }
}
for i in result{
    print(i)
}