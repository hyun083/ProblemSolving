import Foundation

var (R,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let N = Int(readLine()!)!
var row = Array(repeating: true, count: R-1)
var colm = Array(repeating: true, count: C-1)

for _ in 0..<N{
    let (cmd,num) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1]-1)}[0]
    if cmd == 0{
        colm[num] = false
    }else{
        row[num] = false
    }
}

var ans = 0
var rowLength = [Int]()
var colmLength = [Int]()

var tmp = 1
for i in 0..<R-1{
    if !row[i]{
        rowLength.append(tmp)
        tmp = 1
    }else{
        tmp += 1
    }
}
rowLength.append(tmp)
tmp = 1

for i in 0..<C-1{
    if !colm[i]{
        colmLength.append(tmp)
        tmp = 1
    }else{
        tmp += 1
    }
}
colmLength.append(tmp)

for r in rowLength{
    for c in colmLength{
        ans = max(ans, r*c)
    }
}
print(ans)