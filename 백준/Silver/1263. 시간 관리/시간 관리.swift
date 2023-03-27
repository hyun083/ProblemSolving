import Foundation

let n = Int(readLine()!)!
var time = 1000001
var tasks = [(Int,Int)]()

for _ in 0..<n{
    let task = readLine()!.split(separator: " ").map{Int($0)!}
    tasks.append((task[0],task[1]))
}
tasks.sort{$0.1 > $1.1 }

for task in tasks {
    if time > task.1{
        time = task.1-task.0
    }else{
        time -= task.0
    }
}
print(time<0 ? -1:time)