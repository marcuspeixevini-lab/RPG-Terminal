//
//  main.swift
//  RPG Terminal
//
//  Created by MARCUS VINICIUS DOS SANTOS PEREIRA on 14/11/25.
//


import Foundation

var inventario: [String] = []
var ouro = 200
var nivel = 1
var vida = 100

var monstrosDerrotados = 0
var exploracoesFeitas = 0

func menu() {
    print("""
    ===== RPG Terminal =====
    1. Loja
    2. Batalha 
    3. Inventário
    4. Exploração
    5. Missões
    6. Treinamento
    7. Sair 
    Escolha:
    """)
}

func loja() {
    print("""
    --- Loja ---
    1. Espada (100)
    2. Poção (50) 
    3. Voltar
    """)
    
    if let op = readLine() {
        switch op {
        case "1":
            if ouro >= 100 {
                ouro -= 100
                inventario.append("Espada")
                print("Você comprou uma Espada!")
            } else {
                print("Ouro insuficiente!") }
        case "2":
            if ouro >= 50 {
                ouro -= 50
                inventario.append("Poção")
                print("Você comprou uma Poção!")
            } else {
                print("Ouro insuficiente!")
            }
            
        default:
            return
        }
    }
}

func batalha() {
    let forcaMonstro = Int.random(in: 10...40)
    let danoCausado = 20 + nivel * 2
    let danoRecebido = forcaMonstro
    
    print("Você causou \(danoCausado) e recebeu \(danoRecebido).")
    
    if danoCausado > danoRecebido {
        nivel += 1
        ouro += 80
        monstrosDerrotados += 1
        print("Vitória! +1 nivel, +80 ouro")
    } else {
        vida -= danoRecebido
        print(vida <= 0 ? "Você foi derrotado!" : "Você sobreviveu.")
    }
}

func mostrarInventario() {
    print("Inventário: \(inventario.isEmpty ? "vazio": inventario.joined(separator: ", "))")
    print("Ouro: \(ouro) | Nível: \(nivel) | Vida: \(vida)")
}

func explorar() {
    print("Explorando...")
    
    let evento = Int.random(in: 1...4)
    
    switch evento {
    case 1:
        let ganho = Int.random(in: 20...60)
        ouro += ganho
        print("Você encontrou \(ganho) ouro!")
    case 2:
        inventario.append("Pedra Mística")
        print("Você encontrou uma Pedra Mística rara!")
    case 3:
        let dano = Int.random(in: 5...15)
        vida -= dano
        print("Um monstro pequeno atacou! Você perdeu \(dano) de vida.")
    default:
        print("Nada aconteceu.")
    }
    
    exploracoesFeitas += 1
}

func missoes() {
    print("""
    --- Missoes ---
    1. Derrotar 1 monstro (100ouro)
    2. explorar 3 vezes (Pocao)
    3. Voltar
    """)
    
    if let op = readLine() {
        switch op {
        case "1":
            if monstrosDerrotados >= 1 {
                ouro += 100
                monstrosDerrotados = 0
                print("Missão concluida! +100 ouro")
            } else {
                print("Você ainda não derrotou 1 monstro.")
            }
        case "2":
            if exploracoesFeitas >= 3 {
                inventario.append("Poção")
                exploracoesFeitas = 0
                print("Missão concluïda! Você ganhou uma Poção.")
            } else {
                print("Você precisa explorar mais vezes.")
            }
            
        default:
            return
        }
    }
}

func treinar() {
    if ouro >= 20 {
        ouro -= 20
        nivel += 1
        print("Você treinou e ganhou +1 nível!")
    } else {
        print("Você precisa de 20 ouro para treinar.")
    }
}

while true {
    menu()
    if let opc = readLine() {
        switch opc {
        case "1": loja()
        case "2": batalha()
        case "3": mostrarInventario()
        case "4": explorar()
        case "5": missoes()
        case "6": treinar()
        case "7": print ("Saindo..."); exit(0)
        default: print("Opção inválida!")
        }
    }
}

