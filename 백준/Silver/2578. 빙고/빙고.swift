import Foundation

var bingo = Array(repeating: 5, count: 12)
var numbers = Array(repeating: [Int](), count: 26)
var tp = (Int(),[Int]())
var check = 0

for i in 0..<5{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<5{
        let num = line[k]
        numbers[num].append(i)
        numbers[num].append(k+5)
        if i==k{
            numbers[num].append(10)
        }
        if 4-i == k{
            numbers[num].append(11)
        }
    }
}

var cnt = 0
var flag = true
var answers = [Int]()

for _ in 0..<5{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<5{
        answers.append(line[k])
    }
}

for num in answers{
    if !flag { continue }
    cnt += 1
    for line in numbers[num]{
        bingo[line] -= 1
        if bingo[line] == 0{
            check += 1
        }
        if check==3{
            print(cnt)
            flag = false
            break
        }
    }
}