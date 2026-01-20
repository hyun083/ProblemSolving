import Foundation

let N = Int(readLine()!)!
var line = readLine()!.map{String($0)}
var idx = 0

var dict = Dictionary<String,String>()
dict["000000"] = "A"
dict["001111"] = "B"
dict["010011"] = "C"
dict["011100"] = "D"
dict["100110"] = "E"
dict["101001"] = "F"
dict["110101"] = "G"
dict["111010"] = "H"

var ans = [String]()
func getResult() -> Bool{
    for cnt in 1...N{
        let str = Array(line[idx..<idx+6])
        if let value = dict[str.joined()] {
            ans.append(value)
        }else{
            var tmp = str
            for i in 0..<6{
                tmp[i] = tmp[i]=="0" ? "1":"0"
                if let value = dict[tmp.joined()] {
                    ans.append(value)
                }else{
                    tmp[i] = tmp[i]=="0" ? "1":"0"
                }
            }
            if ans.count != cnt{
                return false
            }
        }
        idx += 6
    }
    return true
}

if getResult(){
    print(ans.joined())
}else{
    print(ans.count+1)
}