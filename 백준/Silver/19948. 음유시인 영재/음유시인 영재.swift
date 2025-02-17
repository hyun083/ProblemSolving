import Foundation

let str = readLine()!
let title = str.split(separator: " ").map{String($0)}.map{$0.first!.uppercased()}.joined(separator: "")
var N = Int(readLine()!)!
var cnt = readLine()!.split(separator: " ").map{Int($0)!}
var flag = true

var tmp = [String]()

for target in title{
    if tmp.isEmpty{
        tmp.append(target.lowercased())
    } else{
        if tmp.last! != target.lowercased(){
            tmp.append(target.lowercased())
        }
    }
}

for target in tmp{
    let idx = Int(Character(target).asciiValue! - 97)
    if cnt[idx] == 0{
        flag = false
        break
    }else{
        cnt[idx]-=1
    }
}

tmp = [String]()

for target in str.map({String($0)}){
    if tmp.isEmpty{
        tmp.append(target)
    } else{
        if tmp.last! != target{
            tmp.append(target)
        }
    }
}

for target in tmp{
    if target == " "{
        if N == 0{
            flag = false
            break
        }else{
            N -= 1
        }
        continue
    }
    let idx = Int(Character(target.lowercased()).asciiValue! - 97)
    if cnt[idx] == 0{
        flag = false
        break
    }else{
        cnt[idx]-=1
    }
}

if flag{
    print(title)
}else{
    print(-1)
}