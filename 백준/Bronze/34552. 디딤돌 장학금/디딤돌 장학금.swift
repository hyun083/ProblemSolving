import Foundation

let scholarship = readLine()!.split(separator: " ").map{Int($0)!}
var sum = 0
let N = Int(readLine()!)!
for _ in 0..<N{
    let input = readLine()!.split(separator: " ").map{String($0)}
    let income = Int(input[0])!
    let grade = Double(input[1])!
    let credit = Int(input[2])!
    
    sum += grade>=2.0 && credit>=17 ? scholarship[income] : 0
}
print(sum)