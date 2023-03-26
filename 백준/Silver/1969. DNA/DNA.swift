import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var DNA = Array(repeating: [String](), count: N)
var result = [String]()
var cnt = 0

for i in 0..<N{
    DNA[i] = readLine()!.map{String($0)}
}

for i in 0..<M{ //0...8
    var dic = [String:Int]()
    for k in 0..<N{ //0...5
        let char = DNA[k][i]
        if dic[char] == nil{
            dic[char] = 1
        }else{
            dic[char]! += 1
        }
    }
    result.append(dic.sorted(by: {
        if $0.value == $1.value{
            return $0.key < $1.key
        }else{
            return $0.value > $1.value
        }
    }).first!.key)
}

for i in 0..<N{
    for k in 0..<M{
        if result[k] != DNA[i][k]{
            cnt += 1
        }
    }
}
print(result.joined())
print(cnt)