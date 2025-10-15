import Foundation

let dep = readLine()!.split(separator: " ").filter({$0 != ":"}).map{Int($0)!}
let des = readLine()!.split(separator: " ").filter({$0 != ":"}).map{Int($0)!}

var start = (dep[0]*60*60)+(dep[1]*60)+dep[2]
var end = (des[0]*60*60)+(des[1]*60)+des[2]

var ans = start<=end ? end-start : (24*60*60)+end-start
print(ans)