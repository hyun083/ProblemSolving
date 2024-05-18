import Foundation

let N = Int(readLine()!)!
var score = [0,0]
var ans = [0,0]
var pre_time = 0
var time = 0

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{String($0)}
    let num = Int(info[0])!-1
    let miniute = info[1].split(separator: ":").map{Int($0)!}[0]*60
    let second = info[1].split(separator: ":").map{Int($0)!}[1]
    time = miniute+second
    
    if score[0] < score[1]{
        ans[1] += time-pre_time
    }else if score[0] > score[1]{
        ans[0] += time-pre_time
    }
    
    score[num] += 1
    pre_time = time
}
time = 48*60
if score[0] < score[1]{
    ans[1] += time-pre_time
}else if score[0] > score[1]{
    ans[0] += time-pre_time
}

for score in ans{
    let MM = score/60<10 ? "0\(score/60)":"\(score/60)"
    let SS = score%60<10 ? "0\(score%60)":"\(score%60)"
    print(MM+":"+SS)
}