//
//  main.swift
//  3151_swift
//
//  Created by Hyun on 2022/10/11.
//

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)

func lower_idx(start:Int,end:Int,num:Int)->Int{
    var idx = -1
    var start = start
    var end = end
    while start <= end{
        let mid = (start+end)/2
        if num < arr[mid]{
            end = mid-1
        }else if num == arr[mid]{
            idx = mid
            end = mid-1
        }else{
            start = mid+1
        }
    }
    return idx
}

func upper_idx(start:Int,end:Int,num:Int)->Int{
    var idx = -1
    var start = start
    var end = end
    while start <= end{
        let mid = (start+end)/2
        if num < arr[mid]{
            end = mid-1
        }else if num == arr[mid]{
            idx = mid
            start = mid+1
        }else{
            start = mid+1
        }
    }
    return idx
}

var ans = 0
if n == 1{
    print(ans)
}else{
    for i in 0..<n-2{
        for k in i+1..<n-1{
            let target = -1*(arr[i]+arr[k])
            let l_idx = lower_idx(start: k+1, end: n-1, num: target)
            let u_idx = upper_idx(start: k+1, end: n-1, num: target)
            if l_idx + u_idx == -2{ continue}
            ans += u_idx - l_idx + 1
        }
    }
    print(ans)
}
