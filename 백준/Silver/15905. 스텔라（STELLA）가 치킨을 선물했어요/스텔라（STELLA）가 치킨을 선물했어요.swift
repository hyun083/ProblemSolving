import Foundation

let N = Int(readLine()!)!
var arr = [(score:Int, penalty:Int)]()
for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append( (score:info[0], penalty:info[1]) )
}
arr.sort(by: {
    $0.score == $1.score ? $0.penalty < $1.penalty : $0.score > $1.score
})

let target = arr[4].score
var ans = 0
for i in 5..<N{
    ans += arr[i].score == target ? 1:0
}
print(ans)