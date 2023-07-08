import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let name = readLine()!.map{String($0).lowercased()}
    print(name.joined())
}