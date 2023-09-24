import Foundation

let (N,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var chapter = [(time:Int, score:Int)]()
var ans = Array(repeating: Array(repeating: 0, count: N), count: T+1)

for _ in 0..<N{
    chapter.append([readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0])
}

for time in 0...T{
    if time >= chapter[0].time{
        ans[time][0] = chapter[0].score
    }
}

for i in 1..<N{
    for time in 1...T{
        if time < chapter[i].time{
            ans[time][i] = ans[time][i-1]
        }else{
            ans[time][i] = max(ans[time][i-1], ans[time-chapter[i].time][i-1] + chapter[i].score)
        }
    }
}

print(ans[T][N-1])