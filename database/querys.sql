-- Consulta contemplando contagem ou totalização
-- Total de produtos cadastrados
select count(idProduct) from products

-- 1 consulta contemplando a junção entre 2 tabelas
-- Consulta de clientes cadastrados, seus endereços
select clients.nameClient, address.districtAddress, address.publicPlaceAddress,address.numberAddress, address.cep
from clients
inner join address on address.clientID = clients.idClient


-- 1 consulta contemplando a junção entre 3 tabelas
-- Consulta de produtos, com seu departamento e quantidade em estoque
select products.descriptionProduct, departments.nameDepartment, stocks.quantity
from products
inner join departments on products.department = departments.idDepartment
inner join stocks on products.idProduct = stocks.productId

-- 1 consulta contemplando a junção entre 2 tabelas + uma operação de totalização e agrupamento
-- Total de itens cadastrados por departamento
select departments.nameDepartment, count(products.idProduct)
from products
inner join departments on products.department = departments.idDepartment
group by departments.nameDepartment

-- 1 consulta contemplando a junção entre 3 ou mais tabelas + uma operação de totalização e agrupamento
-- Consulta contendo o valor total do pedido de cada cliente, mostrando a data que foi efetuado o pedido e seu respectivo status de pedido.
select clients.nameClient, requestclients.dateRequest, sum(requestproducts.totalAmount), requeststatus.statusr
from clients
inner join requestclients on requestclients.clientRequest = clients.idClient
inner join requeststatus on requestclients.statusRequest = requeststatus.idStatus
inner join requestproducts on requestproducts.request = requestclients.idRequestClient
group by clients.nameClient

