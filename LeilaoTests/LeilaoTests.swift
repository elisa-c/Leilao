//  LeilaoTests.swift

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {

    override func setUp() {
        super.setUp()

    }

    override func tearDown() {

    }
    
    func testDeveReceberVariosLances() {
            let leilao = Leilao(descricao: "Macbook Pro 15")

            let steveJobs = Usuario(nome: "Steve Jobs")
            leilao.propoe(lance: Lance(steveJobs, 2000.0))

            let billGates = Usuario(nome: "Bill Gates")
            leilao.propoe(lance: Lance(billGates, 1700.0))

            XCTAssertEqual(2, leilao.lances?.count)

            XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
            XCTAssertEqual(1700.0, leilao.lances?[1].valor)
        
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario(){
        let leilao = Leilao(descricao: "Chapéu")
        
        let steveJobs = Usuario(nome: "Steve Jobs")
        leilao.propoe(lance: Lance(steveJobs, 300.0))
        leilao.propoe(lance: Lance(steveJobs, 400.0))

        XCTAssertEqual(1, leilao.lances?.count)
        
    }
}
