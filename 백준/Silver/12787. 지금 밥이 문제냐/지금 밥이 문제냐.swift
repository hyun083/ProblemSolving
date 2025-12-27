import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let line = readLine()!.split(separator: " ").map{String($0)}
    let CMD = line[0]
    if CMD == "1"{
        let address = line[1]
            .split(separator: ".")
            .map{Int($0)!}
            .map{String($0,radix: 2)}
            .map{String(repeating: "0", count: 8-$0.count) + $0}
        let res = UInt(address.joined(), radix: 2)!
        print(String(res,radix: 10))
    }else{
        let address = UInt(line[1])!
        var tmp = String(address,radix: 2)
        tmp = String(repeating: "0", count: 64 - tmp.count) + tmp
        var res = [String]()
        for i in stride(from: 0, to: 64, by: +8){
            let start = tmp.index(tmp.startIndex, offsetBy: i)
            let end = tmp.index(start, offsetBy: 8)
            let slice = Int(String(tmp[start..<end]),radix: 2)!
            res.append(String(slice,radix: 10))
        }
        print(res.joined(separator: "."))
    }
}