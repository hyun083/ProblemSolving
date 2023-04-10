import Foundation

var N = Int(readLine()!)!
var people = Array(repeating: Array(repeating: 0, count: 2), count: N)
var cnt = Array<Int>()

for idx in 0..<N{
    let person = readLine()!.split(separator: " ").map{Int(String($0))!}
    people[idx] = person
}

for person1 in people{
    var temp = 0
    for person2 in people{
        if(person1[0] < person2[0] && person1[1] < person2[1]){
            temp += 1
        }
    }
    cnt.append(temp+1)
}

for c in cnt{
    print(c,terminator: " ")
}