import Foundation

let MMSS = readLine()!.split(separator: ":").map{Int($0)!}
let MM = MMSS[0]
let SS = MMSS[1]
var total = MM*60 + SS
var ans = 0
var isRunning = false

while total > 0{
    if total >= 600{
        ans += total/600
        total %= 600
    }else if total >= 60{
        ans += total/60
        total %= 60
    }else if total >= 30{
        ans += total/30
        total %= 30
        isRunning = true
    }else if total >= 10{
        ans += total/10
        total %= 10
    }
}
ans += isRunning ? 0:1
print(ans)