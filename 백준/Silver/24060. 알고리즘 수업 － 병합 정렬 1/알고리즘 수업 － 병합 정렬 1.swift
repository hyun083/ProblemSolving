import Foundation

var ans = [Int]()
let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]

var arr = readLine()!.split(separator: " ").map{Int($0)!}

func mergeSort(p:Int, r:Int){
    if p < r{
        let q = (p+r)/2
        mergeSort(p: p, r: q)
        mergeSort(p: q+1, r: r)
        merge(p: p, q: q, r: r)
    }
}

func merge(p:Int, q:Int, r:Int){
    var tmp = [Int]()
    var i = p
    var k = q+1
    
    while i<=q && k<=r{
        if arr[i] <= arr[k]{
            tmp.append(arr[i])
            i += 1
        }else{
            tmp.append(arr[k])
            k += 1
        }
    }
    
    while i <= q{
        tmp.append(arr[i])
        i += 1
    }
    
    while k <= r{
        tmp.append(arr[k])
        k += 1
    }
    
    var t = 0
    for idx in p...r{
        ans.append(tmp[t])
        arr[idx] = tmp[t]
        t += 1
    }
}

mergeSort(p: 0, r: arr.count-1)
print(K>ans.count ? -1:ans[K-1])