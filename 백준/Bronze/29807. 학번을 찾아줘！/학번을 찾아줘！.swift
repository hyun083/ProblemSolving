import Foundation

let T = Int(readLine()!)!
var score = Array(repeating: 0, count: 5)
let input = readLine()!.split(separator: " ").map{Int($0)!}
for i in 0..<T{
    score[i] = input[i]
}

var ans = 0
let korean = score[0]
let math = score[1]
let english = score[2]
let science = score[3]
let japanese = score[4]

if korean > english{
    let diff = korean - english
    ans += diff*508
}else{
    let diff = english - korean
    ans += diff*108
}

if math > science{
    let diff = math - science
    ans += diff*212
}else{
    let diff = science - math
    ans += diff*305
}

ans += japanese*707
print(ans*04763)