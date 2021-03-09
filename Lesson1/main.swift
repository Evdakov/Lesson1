//
//  main.swift
//  Lesson1
//
//  Created by  max on 09.03.2021.
//

import Foundation

// Задание 1

let example = "3(x^2) + 11x + 6 = 0"

let a : Double = 3
let b : Double = 11
let c : Double = 6

var d : Double = pow(b, 2) - 4 * a * c

print("Задание 1")
print("Решаем уравнение: \(example)")

if d > 0 {
    var x1 : Double = (-b + sqrt(d)) / (2 * a)
    var x2 : Double = (-b - sqrt(d)) / (2 * a)
    
    print("Ответ 1: \(x1)")
    print("Ответ 2: \(x2)")
} else if d == 0 {
    var x : Double = (-b + sqrt(d)) / (2 * a)
    
    print("Ответ: \(x)")
} else {
    print("Ответ: решений нет")
}


// Задание 2

let ca : Double = 6
let cb : Double = 8

var hipo : Double = sqrt(pow(ca, 2) + pow(cb, 2))
var per : Double = ca + cb + hipo
var sq : Double = ca * cb / 2

print("Задание 2")
print("Катеты треугольника равны \(ca) и \(cb)")
print("Гипотенуза треугольника равна \(hipo)")
print("Периметр треугольника равен \(per)")
print("Площадь треугольника равна \(sq)")


// Задание 3

let s0 : Double = 10000
let percents : Double = 6.5
let n : Double = 5

var s : Double = Double(round(s0 * pow((1 + percents / 100), n) * 100) / 100)
print("Задание 3")
print("Сумма через \(n) лет: \(s)")

