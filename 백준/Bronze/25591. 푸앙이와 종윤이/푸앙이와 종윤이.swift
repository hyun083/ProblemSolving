import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

let a = 100-n
let b = 100-m
let c = 100-(a+b)
let d = a*b
let q = d/100
let r = d%100
print(a,b,c,d,q,r)
print(c+q,r)