//
//  main.swift
//  11658_swift
//
//  Created by Hyun on 2023/03/03.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = [[Int]]()
var tree = Array(repeating: Array(repeating: 0, count: N*4), count: N*4)

func update_tree(xmin:Int, xmax:Int, x:Int, target_x:Int, ymin:Int, ymax:Int, y:Int, target_y:Int, value:Int){
    if target_y < ymin || ymax < target_y || target_x < xmin || xmax < target_x{
        return
    }
    tree[x][y] += value
    if ymin == ymax{
        if xmin == xmax{
            return
        }
        let xmid = (xmin+xmax)/2
        update_tree(xmin: xmin, xmax: xmid, x: x*2, target_x: target_x, ymin: 0, ymax: N-1, y: 1, target_y: target_y, value: value)
        update_tree(xmin: xmid+1, xmax: xmax, x: x*2+1, target_x: target_x, ymin: 0, ymax: N-1, y: 1, target_y: target_y, value: value)
        return
    }
    let mid = (ymin+ymax)/2
    update_tree(xmin: xmin, xmax: xmax, x: x, target_x: target_x, ymin: ymin, ymax: mid, y: y*2, target_y: target_y, value: value)
    update_tree(xmin: xmin, xmax: xmax, x: x, target_x: target_x, ymin: mid+1, ymax: ymax, y: y*2+1, target_y: target_y, value: value)
}

func read_tree(xfrom:Int, xto:Int, x:Int, yfrom:Int, yto:Int, y:Int, xmin:Int, xmax:Int, ymin:Int, ymax:Int) -> Int{
    if xto < xmin || xmax < xfrom || yto < ymin || ymax < yfrom{
        return 0
    }
    if xmin <= xfrom && xto <= xmax{
        if ymin <= yfrom && yto <= ymax{
            return tree[x][y]
        }
        let ymid = (yfrom + yto)/2
        let left = read_tree(xfrom: xfrom, xto: xto, x: x, yfrom: yfrom, yto: ymid, y: y*2, xmin: xmin, xmax: xmax, ymin: ymin, ymax: ymax)
        let right = read_tree(xfrom: xfrom, xto: xto, x: x, yfrom: ymid+1, yto: yto, y: y*2+1, xmin: xmin, xmax: xmax, ymin: ymin, ymax: ymax)
        return left + right
    }
    let xmid = (xfrom+xto)/2
    let left = read_tree(xfrom: xfrom, xto: xmid, x: x*2, yfrom: yfrom, yto: yto, y: y, xmin: xmin, xmax: xmax, ymin: ymin, ymax: ymax)
    let right = read_tree(xfrom: xmid+1, xto: xto, x: x*2+1, yfrom: yfrom, yto: yto, y: y, xmin: xmin, xmax: xmax, ymin: ymin, ymax: ymax)
    return left + right
}

for i in 0..<N{
    arr.append(readLine()!.split(separator: " ").map{Int($0)!})
    for k in 0..<N{
        update_tree(xmin: 0, xmax: N-1, x: 1, target_x: i, ymin: 0, ymax: N-1, y: 1, target_y: k, value: arr[i][k])
    }
}

var ans = [String]()
for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    if line[0] < 1{
        let x = line[1]-1
        let y = line[2]-1
        let c = line[3]
        update_tree(xmin: 0, xmax: N-1, x: 1, target_x: x, ymin: 0, ymax: N-1, y: 1, target_y: y, value: c-arr[x][y])
        arr[x][y] = c
    }else{
        let x1 = line[1]-1
        let y1 = line[2]-1
        let x2 = line[3]-1
        let y2 = line[4]-1
        ans.append("\(read_tree(xfrom: 0, xto: N-1, x: 1, yfrom: 0, yto: N-1, y: 1, xmin: x1, xmax: x2, ymin: y1, ymax: y2))")
    }
}
print(ans.joined(separator: "\n"))
