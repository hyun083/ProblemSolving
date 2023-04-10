let ab = readLine()!.split(separator: " ").map{Double($0)!}
let a = ab[0]
let b = ab[1]
let bangmu = a/100*b
print(a-bangmu>=100 ? 0:1)