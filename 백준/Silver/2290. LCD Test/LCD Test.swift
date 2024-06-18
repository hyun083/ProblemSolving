import Foundation

let line = readLine()!.split(separator: " ").map{String($0)}
let S = Int(line[0])!
let N = line[1].map{String($0)}

var ans = Array(repeating: [String](), count: (2*S)+3)
for i in 0..<N.count{
    let num = N[i]
    
    if num == "1"{
        ans[0].append(" "+String(repeating: " ", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: " ", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: " ", count: S)+" ")
    }else if num == "2"{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: "-", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append("|"+String(repeating: " ", count: S)+" ")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: "-", count: S)+" ")
    }else if num == "3"{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: "-", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: "-", count: S)+" ")
    }else if num == "4"{
        ans[0].append(" "+String(repeating: " ", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append("|"+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: "-", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append(" " + String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: " ", count: S)+" ")
    }else if num == "5"{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append("|"+String(repeating: " ", count: S)+" ")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: "-", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append(" " + String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: "-", count: S)+" ")
    }else if num == "6"{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append("|"+String(repeating: " ", count: S)+" ")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: "-", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append("|"+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: "-", count: S)+" ")
    }else if num == "7"{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: " ", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: " ", count: S)+" ")
    }else if num == "8"{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append("|"+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: "-", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append("|"+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: "-", count: S)+" ")
    }else if num == "9"{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append("|"+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: "-", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append(" "+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: "-", count: S)+" ")
    }else{
        ans[0].append(" "+String(repeating: "-", count: S)+" ")
        for k in 1..<(2*S+3)/2{
            ans[k].append("|"+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)/2].append(" "+String(repeating: " ", count: S)+" ")
        for k in (2*S+3)/2+1..<2*S+2{
            ans[k].append("|"+String(repeating: " ", count: S)+"|")
        }
        ans[(2*S+3)-1].append(" "+String(repeating: "-", count: S)+" ")
    }
}
for ans in ans{
    print(ans.joined(separator: " "))
}