import Foundation

let N = Int(readLine()!)!
let cost = readLine()!.split(separator: " ").map{Int($0)!}
let happy = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

func btk(HP:Int, HAPPY:Int, idx:Int){
    if HP<1 { return }
    if idx == N{
        ans = max(ans,HAPPY)
        return
    }
    btk(HP: HP-cost[idx], HAPPY: HAPPY+happy[idx], idx: idx+1)
    btk(HP: HP, HAPPY: HAPPY, idx: idx+1)
}
for i in 0..<N{
    btk(HP: 100, HAPPY: 0, idx: i)
}
print(ans)