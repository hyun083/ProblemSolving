import Foundation

var dic = Dictionary<String,Int>()
let S = readLine()!.map{String($0)}
var N = S.count

for i in 0..<N{
    if dic[S[i]] == nil{
        dic[S[i]] = 1
    }else{
        dic[S[i]]! += 1
    }
}

func btk(_ pre:String, cnt: Int) -> Int{
    var res = 0
    
    if cnt == N{
        return 1
    }
    
    for info in dic{
        if info.key == pre || info.value==0{ continue }
        dic[info.key]! -= 1
        res += btk(info.key, cnt: cnt+1)
        dic[info.key]! += 1
    }
    
    return res
}



if dic.count == N{
    var ans = 1
    while N>0{
        ans *= N
        N -= 1
    }
    print(ans)
}else{
    print(btk("", cnt: 0))
}