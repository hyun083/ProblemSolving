import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    var arr = [String]()
    let input = readLine()!.map{String($0)}
    for data in input{
        if arr.isEmpty || arr.last! != data{
            arr.append(data)
        }else{
            continue
        }
    }
    print(arr.joined())
}