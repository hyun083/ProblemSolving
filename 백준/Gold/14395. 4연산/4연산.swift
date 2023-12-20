import Foundation

let (S,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let cmd = ["*","+","-","/"]
var flag = false
let MAX = 1000000001
var visited = Set<Int>()
visited.insert(S)

var q:[(num:Int, arr:[String])] = [(S,[])]
var dq:[(num:Int, arr:[String])] = []
var ans = "-1"

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if curr.num == T{
            ans = curr.arr.isEmpty ? "0":curr.arr.joined()
            break
        }
        if curr.num > MAX{
            continue
        }
        
        if curr.num*curr.num<=MAX && !visited.contains(curr.num*curr.num){
            q.append((curr.num*curr.num, curr.arr+["*"]))
            visited.insert(curr.num*curr.num)
        }
        if curr.num+curr.num<=MAX && !visited.contains(curr.num+curr.num){
            q.append((curr.num+curr.num, curr.arr+["+"]))
            visited.insert(curr.num+curr.num)
        }
        if !visited.contains(curr.num-curr.num){
            q.append((curr.num-curr.num, curr.arr+["-"]))
            visited.insert(curr.num-curr.num)
        }
        
        if curr.num>0 && !visited.contains(curr.num/curr.num){
            q.append((curr.num/curr.num, curr.arr+["/"]))
            visited.insert(curr.num/curr.num)
        }
    }
    
    if ans != "-1"{ break }
}
print(ans)