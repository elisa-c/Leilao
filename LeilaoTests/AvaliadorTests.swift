//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Elisa Camillo on 24/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {

    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testDeveEntenderLancesEmOrdemCrescente() {
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        let maior = 400.0
        let menor = 250.0

        print(leiloeiro.maiorLance() == maior)
        print(leiloeiro.menorLance() == menor)
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())

    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let joao = Usuario(nome: "Joao")
        let leilao = Leilao(descricao: "Playstation")
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTresMaioresLances() {
        let joao = Usuario(nome: "Joao")
        let maria = Usuario(nome: "Maria")
        
        
        let leilao = Leilao(descricao: "tv")
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(maria, 400.0))
        leilao.propoe(lance: Lance(joao, 500.0))
        leilao.propoe(lance: Lance(maria, 600.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600.0, listaLances[0].valor)
        XCTAssertEqual(500.0, listaLances[1].valor)
        XCTAssertEqual(400.0, listaLances[2].valor)
    }
}
