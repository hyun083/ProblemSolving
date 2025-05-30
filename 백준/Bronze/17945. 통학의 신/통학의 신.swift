import Foundation

let AB = readLine()!.split(separator: " ").map{Double($0)!}
let A = AB[0]
let B = AB[1]
let ans1 = Int((-1*A)+sqrt((A*A)-B))
let ans2 = Int((-1*A)-sqrt((A*A)-B))
if ans1==ans2{
    print(ans1)
}else{
    print(min(ans1,ans2),max(ans1,ans2))
}
