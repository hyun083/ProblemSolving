import Foundation

let n = Int(readLine()!)!
var ans = [String]()

func makeInt(str:[String]) -> String{
    var res = ""
    var flag = false
    
    for i in 0..<str.count-1{
        if str[i] != "0"{
            flag = true
        }
        if flag{
            res.append(str[i])
        }
    }
    res.append(str.last!)
    return res
}

for _ in 0..<n{
    let line = readLine()!.map{String($0)}
    var tmp = [String]()
    for i in 0..<line.count{
        if Character(line[i]).asciiValue! >= 97{
            if !tmp.isEmpty{
                ans.append(makeInt(str: tmp))
            }
            tmp = [String]()
        }else{
            tmp.append(line[i])
        }
    }
    if !tmp.isEmpty{
        ans.append(makeInt(str: tmp))
    }
}
ans.sort(by: {
    if $0.count == $1.count{
        return $0 < $1
    }else{
        return $0.count < $1.count
    }
})
print(ans.joined(separator: "\n"))