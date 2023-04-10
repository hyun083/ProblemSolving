import Foundation

struct Student{
    var name:String
    var dd:Int
    var mm:Int
    var yy:Int
    init(_ n:String, _ d:Int, _ m:Int, _ y:Int){
        name = n
        dd = d
        mm = m
        yy = y
    }
}
var students = [Student]()
for _ in 0..<Int(readLine()!)!{
    let info = readLine()!.split(separator: " ").map{String($0)}
    students.append(Student(info[0], Int(info[1])!, Int(info[2])!, Int(info[3])!))
}
students.sort(by: {
    if $0.yy == $1.yy{
        if $0.mm == $1.mm{
            return $0.dd < $0.dd
        }else{
            return $0.mm < $1.mm
        }
    }else{
        return $0.yy < $1.yy
    }
})
print(students.last!.name)
print(students.first!.name)