import Foundation

let ns = readLine()!.split(separator: " ").map{Int($0)!}
let numbers = readLine()!.split(separator: " ").map{Int($0)!}
var map = Dictionary<Int,Int>()
let n = ns[0]
let s = ns[1]
var cnt = 0

let mid = n/2
func dfsLeft(from curr:Int, sum:Int){
    if curr == mid{
        if map[sum] == nil{
            map[sum] = 1
        }else{
            map[sum]! += 1
        }
        return
    }
    dfsLeft(from: curr+1, sum: sum)
    dfsLeft(from: curr+1, sum: sum+numbers[curr])
}
func dfsRight(from curr:Int, sum:Int){
    if curr == n {
        if map[s-sum] != nil{
            cnt += map[s-sum]!
        }
        return
    }
    dfsRight(from: curr+1, sum: sum)
    dfsRight(from: curr+1, sum: sum+numbers[curr])
}
dfsLeft(from: 0, sum: 0)
dfsRight(from: mid, sum: 0)
print(s == 0 ? cnt-1:cnt)