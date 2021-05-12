const product = [
    { 
        "codProduto": 1234,
        "descricao": "Computador Dell Inspiron XS 12000 8Gb RAM 1 TB HD Intel i5 4g NVidia 1080",
        "preco": 3500.00,
        "qtdEstoque": 5,
        "disponivel": "sim",
        "emDestaque": "sim",
        "departamento" : {
          "idDepto": 987,
          "nomeDepto":"Computadores Gamer"
        }
    },
    { 
        "codProduto": 4020,
        "descricao": "Computador Gamer Concórdia, Processador Ryzen 5 3400G, 16GB, SSD 480GB, Fonte 500W, Windows 10 Pro",
        "preco": 4399.90,
        "qtdEstoque": 10,
        "disponivel": "não",
        "emDestaque": "sim",
        "departamento" : {
          "idDepto": 987,
          "nomeDepto":"Computadores Gamer"
        }
    },
    { 
        "codProduto": 7750,
        "descricao": "Smartphone Samsung Galaxy A31, 128GB, 48MP, Tela 6.4´, Preto - SM-A315GZKRZTO",
        "preco": 1746.32,
        "qtdEstoque": 20,
        "disponivel": "sim",
        "emDestaque": "sim",
        "departamento" : {
          "idDepto": 879,
          "nomeDepto":"Celular e Telefones"
        }
    },
    { 
        "codProduto": 7600,
        "descricao": "Smartphone Samsung Galaxy Z Fold2 5G, Dobrável, 12 Gb + 256 Gb, Tela 7.6', Mystic Bronze",
        "preco": 13999.00,
        "qtdEstoque": 5,
        "disponivel": "sim",
        "emDestaque": "não",
        "departamento" : {
          "idDepto": 879,
          "nomeDepto":"Celular e Telefones"
        }
    }
]

function totalStock() {
    let numTotalStock = 0
    for (let i = 0; i < product.length; i++){
        numTotalStock = numTotalStock + product[i].qtdEstoque
    }
    console.log(`Quantidade total de produtos em estoque: ${numTotalStock}`)
}
totalStock()

function totalHighlight() {
    let numTotalHighlight = 0
    for(let i = 0; i < product.length; i++){
        if(product[i].emDestaque === "sim"){
            numTotalHighlight = numTotalHighlight + product[i].qtdEstoque
        }
    }
    console.log(`Quantidade total de produtos em destaque: ${numTotalHighlight}`)
}
totalHighlight()

function totalAvailable() {
    let numTotalAvailable = 0
    for(let i = 0; i < product.length; i++){
        if(product[i].disponivel === "sim"){
            numTotalAvailable = numTotalAvailable + product[i].qtdEstoque
        }
    }
    console.log(`Quantidade total de produtos disponíveis: ${numTotalAvailable}`)
}
totalAvailable()

function totalAmount() {
    let amount = 0
    for(let i = 0; i < product.length; i++){
        amount = amount + (product[i].preco * product[i].qtdEstoque)
    }
    console.log(`Valor total do inventário atual da empresa: ${amount}`)
}
totalAmount()

function totalProductDepartment(idDepto) {
    let productDepartment = 0
    let nameDepartment= '';
    for(let i = 0; i < product.length; i++){
        if(idDepto === product[i].departamento.idDepto){
            nameDepartment = product[i].departamento.nomeDepto
            productDepartment = productDepartment + product[i].qtdEstoque
        }
    }
    console.log({nameDepartment, productDepartment})    
}
totalProductDepartment(987)

function totalAmountDepartment(idDepto) {
    let nameDepartment = '';
    let amountDepartment = 0
    for(let i = 0; i < product.length; i++){
        if(idDepto === product[i].departamento.idDepto){
            nameDepartment = product[i].departamento.nomeDepto
            amountDepartment = amountDepartment + (product[i].preco * product[i].qtdEstoque)
        }
    }
    console.log(`Valor total do inventário do departamento ${nameDepartment}: ${amountDepartment}`)
}
totalAmountDepartment(987)

function averageTicket() {
    let amount = 0
    let numTotalStock = 0
    let average = 0
    for(let i = 0; i < product.length; i++){
        amount = amount + (product[i].preco * product[i].qtdEstoque)
        numTotalStock = numTotalStock + product[i].qtdEstoque
    }
    average = (amount / numTotalStock)
    console.log(`Ticket médio dos produtos atuais: ${average}`)
}
averageTicket()

function averageTicketDepartment(idDepto) {
    let amount = 0
    let numTotalStock = 0
    let ticket = 0
    let nameDepartment = ''
    for(let i = 0; i < product.length; i++){
        if(idDepto === product[i].departamento.idDepto){
            nameDepartment = product[i].departamento.nomeDepto
            amount = amount + (product[i].preco * product[i].qtdEstoque)
            numTotalStock = numTotalStock + product[i].qtdEstoque
        }
    }
    ticket = (amount / numTotalStock)
    console.log({nameDepartment, ticket})
}
averageTicketDepartment(879)

function mostProduct() {
    let comparation = product[0].preco
    let nameDepartment = ''
    let nameProduct = ''
    for(let i = 0; i < product.length; i++){
        if(comparation < product[i].preco){
            comparation = product[i].preco
            nameDepartment = product[i].departamento.nomeDepto
            nameProduct = product[i].descricao
        }
    }
    console.log(`O produto mais caro da loja atualmente: ${nameProduct}. Seu departamento: ${nameDepartment}`)
}
mostProduct()

function cheapProduct() {
    let comparation = product[0].preco
    let nameDepartment =''
    let nameProduct = ''
    for(let i = 0; i < product.length; i++){
        if (comparation > product[i].preco){
            comparation = product[i].preco
            nameDepartment = product[i].departamento.nomeDepto
            nameProduct = product[i].descricao
        }
    }
    console.log(`O produto mais barato da loja atualmente: ${nameProduct}. Seu departamento: ${nameDepartment}`)
}
cheapProduct()
