import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
let Q = Int(readLine()!)!
for _ in 0..<Q{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    if input[0] == 1{
        let u = input[1]-1
        let v = input[2]-1
        let target = input[3]
        var output = 0
        for i in u...v{
            output += arr[i]==target ? 1:0
        }
        print(output)
    }else{
        let u = input[1]-1
        let v = input[2]-1
        for i in u...v{
            arr[i] = 0
        }
    }
}