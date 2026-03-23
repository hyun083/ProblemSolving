let AB = readLine()!.split(separator: " ").map{Int($0)!}
let CD = readLine()!.split(separator: " ").map{Int($0)!}
let A = AB[0]
let B = AB[1]
let C = CD[0]
let D = CD[1]

if A+C < B+D {
    print("Hanyang Univ.")
} else if A+C > B+D {
    print("Yongdap")
} else {
    print("Either")
}