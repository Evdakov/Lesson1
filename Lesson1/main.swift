//
//  main.swift
//  Swift Lessons
//
//  Created by  max on 09.03.2021.
//

import Foundation

// Урок 4 - Введение в ООП
enum EngineStatus {
    case started, stoped
}

enum WindowsStatus {
    case opened, closed
}

enum Actions {
    case openWindow, closeWindow, startEngine, stopEngine, installNOS, useNOS, completelyLoad, unloadBaggage
}

class Car {
    let name: String
    let year: Int
    let baggageVolume: Double
    var windowStatus: WindowsStatus
    var engineStatus: EngineStatus
    var filledVolume: Double
    
    
    init(name: String, year: Int, baggageVolume: Double, windowStatus: WindowsStatus = .closed, engineStatus: EngineStatus = .stoped, filledVolume: Double = 0) {
        self.name = name
        self.year = year
        self.baggageVolume = baggageVolume
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
        self.filledVolume = filledVolume
    }
    
    func printInfo() {
        
    }
    
    func doAction(action: Actions) {
        switch action {
        case .closeWindow:
            self.windowStatus = .closed
        case .openWindow:
            self.windowStatus = .opened
        case .stopEngine:
            self.engineStatus = .stoped
        case .startEngine:
            self.engineStatus = .started
        default: break
        }
    }
}

class SportCar: Car {
    let acceleration100: Double
    let speedMax: Int
    var lapTime: Double
    var isNOSInstalled: Bool
    
    init(acceleration100: Double, speedMax: Int, lapTime: Double, isNOSInstalled: Bool, name: String, year: Int, baggageVolume: Double, windowStatus: WindowsStatus = .closed, engineStatus: EngineStatus = .stoped, filledVolume: Double = 0) {
        self.acceleration100 = acceleration100
        self.speedMax = speedMax
        self.lapTime = lapTime
        self.isNOSInstalled = isNOSInstalled
        
        super.init(name: name, year: year, baggageVolume: baggageVolume, windowStatus: windowStatus, engineStatus: engineStatus, filledVolume: filledVolume)
    }
    
    override func doAction(action: Actions) {
        switch action {
        case .installNOS:
            self.isNOSInstalled = true
        case .useNOS:
            self.isNOSInstalled = false
        default:
            super.doAction(action: action)
        }
    }
    
    override func printInfo() {
        print("""
            ______________________________
            Спортивный автомобиль \(name)
            Год выпуска \(year)
            Разгон до 100км/ч \(acceleration100) сек.
            Закись азота \(isNOSInstalled ? "установлена" : "использована")
            Лучшее время прохождения круга \(lapTime) сек.
            Двигатель \(engineStatus == .started ? "запущен" : "заглушен")
            Окна \(windowStatus == .opened ? "открыты" : "закрыты")
            """)
    }
}

class TrunkCar: Car {
    let fuelTankSize: Double
    let sleepPlacesCount: Int
    
    init(fuelTankSize: Double, sleepPlacesCount: Int, name: String, year: Int, baggageVolume: Double, windowStatus: WindowsStatus = .closed, engineStatus: EngineStatus = .stoped, filledVolume: Double = 0) {
        self.fuelTankSize = fuelTankSize
        self.sleepPlacesCount = sleepPlacesCount
        
        super.init(name: name, year: year, baggageVolume: baggageVolume, windowStatus: windowStatus, engineStatus: engineStatus, filledVolume: filledVolume)
    }
    
    override func doAction(action: Actions) {
        switch action {
        case .completelyLoad:
            self.filledVolume = self.baggageVolume
        case .unloadBaggage:
            self.filledVolume = 0
        default:
            super.doAction(action: action)
        }
    }
    
    override func printInfo() {
        print("""
            ______________________________
            Грузовой автомобиль \(name)
            Год выпуска \(year)
            Размер бензобака \(fuelTankSize) литров
            Количество спальных мест \(sleepPlacesCount)
            Двигатель \(engineStatus == .started ? "запущен" : "заглушен")
            Окна \(windowStatus == .opened ? "открыты" : "закрыты")
            Объем кузова \(baggageVolume) литров
            Объем груза \(filledVolume) литров
            """)
    }
}

let sportCar = SportCar(acceleration100: 5.7, speedMax: 248, lapTime: 59, isNOSInstalled: true, name: "Nissan 350Z", year: 2003, baggageVolume: 300)
let sportCarOKonnor = SportCar(acceleration100: 4.7, speedMax: 320, lapTime: 48, isNOSInstalled: true, name: "Nissan Skyline GT-R", year: 1999, baggageVolume: 330)

let trunkCar = TrunkCar(fuelTankSize: 700, sleepPlacesCount: 2, name: "Volvo FH16", year: 2020, baggageVolume: 60000)
let trunkMan = TrunkCar(fuelTankSize: 1340, sleepPlacesCount: 2, name: "MAN TGX", year: 2020, baggageVolume: 58000)

sportCarOKonnor.engineStatus = .started
sportCarOKonnor.doAction(action: .openWindow)
sportCarOKonnor.doAction(action: .useNOS)

trunkCar.doAction(action: .openWindow)
trunkCar.filledVolume = 2000

trunkMan.doAction(action: .startEngine)
trunkMan.doAction(action: .completelyLoad)

sportCar.printInfo()
sportCarOKonnor.printInfo()

trunkCar.printInfo()
trunkMan.printInfo()
