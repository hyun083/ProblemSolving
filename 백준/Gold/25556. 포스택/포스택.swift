import Foundation

let N = Int(readLine()!)!
var arr:Array<Int> = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
var stack = Array(repeating: [Int](), count: 4)

for _ in 0..<N{
    let num = arr.removeLast()
    for k in 0..<4{
        if stack[k].isEmpty || stack[k].last! < num{
            stack[k].append(num)
            break
        }
    }
}
var cnt = 0
for stack in stack{
    cnt += stack.count
}
print(cnt==N ? "YES":"NO")