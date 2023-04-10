import Foundation

let N = Int(readLine()!)!
var count = 0

for _ in 1...N{
    let input = readLine()!
    var stack = [Character]()
    
    for char in input{
        if stack.isEmpty || stack.last != char{
            stack.append(char)
        }else if stack.last == char{
            stack.removeLast()
        }
    }
    if stack.isEmpty{
        count += 1
    }
}

print(count)