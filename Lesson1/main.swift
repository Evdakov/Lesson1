//
//  main.swift
//  Swift Lessons
//
//  Created by  max on 09.03.2021.
//

import Foundation

// MARK: - Lesson 5

enum EngineStatus: String {
    case started = "запущен", stoped = "выключен"
}

enum WindowStatus: String {
    case opened = "открыты", closed = "закрыты"
}

protocol Car: class {
    var name: String { get }
    var year: Int { get }
    
    var windowStatus: WindowStatus { get set }
    var engineStatus: EngineStatus { get set }
    
    func openWindows()
    func closeWindows()
    func changeEngineStatus(status: EngineStatus)
}

extension Car {
    func openWindows() {
        self.windowStatus = .opened
    }
    
    func closeWindows() {
        self.windowStatus = .closed
    }
    
    func changeEngineStatus(status: EngineStatus) {
        self.engineStatus = status
    }
}

class SportCar: Car {
    var name: String
    var year: Int
    var windowStatus: WindowStatus
    var engineStatus: EngineStatus
    var isNOSInstalled: Bool
    
    init(name: String, year: Int, isNOSInstalled: Bool = false, windowStatus: WindowStatus = .closed, engineStatus: EngineStatus = .stoped) {
        self.name = name
        self.year = year
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
        self.isNOSInstalled = isNOSInstalled
    }
    
    func installNOS() {
        self.isNOSInstalled = true
    }
    
    func useNOS() {
        self.isNOSInstalled = false
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return String("""
                _______________________
                Спортивный автомобиль \(self.name) \(self.year) года
                Окна \(self.windowStatus.rawValue)
                Двигатель \(self.engineStatus.rawValue)
                NOS \(self.isNOSInstalled ? "установлен" : "использован")
                """)
    }
}

class TrunkCar: Car {
    var name: String
    var year: Int
    var windowStatus: WindowStatus
    var engineStatus: EngineStatus
    var sleepPlacesCount: Int
    var fuelTrankSize: Double
    
    init(name: String, year: Int, sleepPlacesCount: Int, fuelTrankSize: Double, windowStatus: WindowStatus = .closed, engineStatus: EngineStatus = .stoped) {
        self.name = name
        self.year = year
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
        self.sleepPlacesCount = sleepPlacesCount
        self.fuelTrankSize = fuelTrankSize
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return String("""
                _______________________
                Грузовой автомобиль \(self.name) \(self.year) года
                Окна \(self.windowStatus.rawValue)
                Двигатель \(self.engineStatus.rawValue)
                Спальных мест \(self.sleepPlacesCount)
                Объем топливных баков \(self.fuelTrankSize) литров
                """)
    }
}

let sportCar = SportCar(name: "Lamborghini Aventador", year: 2021)
let sportCarOKonnor = SportCar(name: "Nissan Skyline GT-R", year: 1999)

let trunkCar = TrunkCar(name: "Volvo FH16", year: 2020, sleepPlacesCount: 2, fuelTrankSize: 700)
let trunkCarMan = TrunkCar(name: "MAN TGX", year: 2019, sleepPlacesCount: 2, fuelTrankSize: 1340)

sportCar.installNOS()
sportCarOKonnor.openWindows()

trunkCar.changeEngineStatus(status: .started)
trunkCarMan.openWindows()

print(sportCar)
print(sportCarOKonnor)
print(trunkCar)
print(trunkCarMan)
