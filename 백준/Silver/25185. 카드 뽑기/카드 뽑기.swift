import Foundation

let T = Int(readLine()!)!

func checkOne(arr:[String])->Bool{
    for i in 0..<2{
        for k in i+1..<3{
            for p in k+1..<4{
                if arr[i].last == arr[k].last && arr[k].last == arr[p].last{
                    let tmp = [arr[i].first!,arr[k].first!,arr[p].first!].map{Int(String($0))!}.sorted(by: <)
                    if tmp[2]==tmp[0]+2 && tmp[1]==tmp[0]+1{ return true }
                }
            }
        }
    }
    return false
}

func checkTwo(arr:[String])->Bool{
    var tmp = Dictionary<String,Int>()
    for card in arr{
        if tmp[card]==nil{
            tmp[card] = 1
        }else{
            tmp[card]! += 1
        }
    }
    for data in tmp{
        if data.value >= 3{
            return true
        }
    }
    return false
}

func checkThree(arr:[String])->Bool{
    var tmp = Dictionary<String,Int>()
    for card in arr{
        if tmp[card]==nil{
            tmp[card] = 1
        }else{
            tmp[card]! += 1
        }
    }
    if tmp.count==2{
        let res = tmp.sorted(by: <)
        if res[0].value == 2 && res[1].value == 2{
            return true
        }
    }
    return false
}

for _ in 0..<T{
    let info = readLine()!.split(separator: " ").map{String($0)}.sorted(by: <)
    if checkOne(arr: info) || checkTwo(arr: info) || checkThree(arr: info){
        print(":)")
    }else{
        print(":(")
    }
}