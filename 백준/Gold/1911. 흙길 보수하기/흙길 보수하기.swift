import Foundation

let (N,L) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [(s:Int, e:Int, cnt:Int)]()

for _ in 0..<N{
    let (S,E) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    let cnt = (E-S)/L + ((E-S)%L==0 ? 0:1)
    arr.append((S,E,cnt))
}
arr.sort(by: {$0.s < $1.s})

var ans = arr[0].cnt
var start = arr[0].s
var end = start + (arr[0].cnt*L)

for i in 1..<N{
    let next = arr[i]
    if next.s <= end{
        if next.e <= end{ continue }
        let diff = next.e - end
        let cnt = diff/L + (diff%L==0 ? 0:1)
        ans += cnt
        end += cnt*L
    }else{
        ans += next.cnt
        start = next.s
        end = start + (next.cnt*L)
    }
}
print(ans)