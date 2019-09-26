# Application REST - Adonis API

A aplicação REST de todo o sistema.

1. [NPM install](#installation)
2. [Run application](#pushpin-run-app)
3. [Access](#pushpin-access)
4. [Database Documentaion](#database-documentation)

## __Installation__

## :pushpin: Clone the reposity

```git
git clone https://github.com/[YOUT_USER_NAME]/apirest
```
## :pushpin: Install with npm
Use the npm command to install the packges node

```bash
npm install
```

## :pushpin: Run App

Use the adonis command run and start the application

```bash
adonis serve --dev
```

### :pushpin: Access

Access, in browser, the address http://127.0.0.1:[PORT_NAME]

---

# Database Documentation

# __Conceitual Model:__
![](resources/conceitual_model.jpg)

# __Logic Model:__
![](resources/logical_model.jpg)

---
> ## Entities:

- [Address](#pushpin-address)
- [Categories](#pushpin-categories)
- [Cities](#pushpin-cities)
- [Companies](#pushpin-companies)
- [Files](#pushpin-files)
- [Contacts](#pushpin-contacts)
- [Itens_Request](#pushpin-itens_request)
- [Products](#pushpin-products)
- [User_Requests](#pushpin-user_requests)
- [Stocks](#pushpin-stocks)
- [Users](#pushpin-users)
- [Ufs](#pushpin-ufs)

## Below, is __description__ from entities databases in System.

# :pushpin: Address 

## Description
>``This table is accountable for register address of the system users.``

## Attributes
  - __address_id__ ![](resources/pk.png)
  - street
  - type_user
  - number
---

# :pushpin: Categories

## Description
> `` Esta tabela é responsável por cadastrar as categorias dos produtos.``

## Attributes
  - __category_id__ ![](resources/pk.png)
  - category_name

----

# :pushpin: Cities

## Description
> `` Esta tabela terá as cidades já pré-cadastradas, no sistema. Por meio dessa tabela...``

## Attributes
  - __city_id__ ![](resources/pk.png)
  - city_name
---

# :pushpin: Companies

## Description
> `` Esta tabela é responsável por cadastrar as empresas.``

## Attributes
  - __company_id__ ![](resources/pk.png)
  - fantasy_name
  - cnpj
  - logo
  - __user_id__ ![](resources/b_key.png)
  - __address_id__ ![](resources/b_key.png)
---

# :pushpin: Files

## Description
> `` Esta tabela é responsável por incluir os arquivos.``

## Attributes
  - __file_id__ ![](resources/pk.png)

---
# :pushpin: Contacts

## Description
> `` Esta tabela é responsável por cadastrar os contatos.``

## Attributes
  - __contact_id__ ![](resources/pk.png)
  - number_phone
  - comapany_id
  - __user_id__ ![](resources/b_key.png)
---

# :pushpin: Itens_Request

## Description
> `` Esta tabela conterá os itens do pedido do cliente.``

## Attributes
  - __item_request_id__ ![](resources/pk.png)
  - amount
  - prince
  - subtotal
  - __req_id__ ![](resources/b_key.png)
  - __product_id__ ![](resources/b_key.png)
---

# :pushpin: Products

## Description
> `` Esta tabela é responsável por cadastrar os produtos.``

## Attributes
  - __product_id__ ![](resources/pk.png)
  - image
  - name
  - description
  - __company_id__ ![](resources/b_key.png)
  - __category_id__ ![](resources/b_key.png)
---

# :pushpin: User_Requests

## Description
> `` Esta tabela é responsável por cadastrar o pedido do cliente.``

## Attributes
  - __req_id__ ![](resources/pk.png)
  - req_status _(1, 2, 3, 4)_, default: **1**
  - __user_id__ ![](resources/b_key.png)
  - __compay_id__ ![](resources/b_key.png)
---

# :pushpin: Itens_Request

## Description
> `` Esta tabela é responsável por cadastrar as categorias das empresas.``

## Attributes
- __item_req_id__ ![](resources/pk.png)
- item_amout
- item_price
- item_subtotal
- __item_req_id__ ![](resources/b_key.png) 
- __item_product_id__ ![](resources/b_key.png)
---

# :pushpin: Stocks

## Description
> `` Esta tabela é responsável por cadastrar a estoque dos produtos.``

## Attributes
  - __stock_id__ ![](resources/pk.png)
  - stock_product_price
  - stock_amount
  - stock_measure_type
  - __stock_product_id__ ![](resources/b_key.png)
---

# :pushpin: Users

## Description
> `` Esta tabela é responsável por cadastrar os usuários.``

## Attributes
  - __user_id__ ![](resources/pk.png)
  - user_name
  - user_password
  - user_token
  - __user_address_id__ ![](resources/b_key.png)
  - __user_city_id__ - ![](resources/b_key.png)
---

# :pushpin: UFs

## Description
> `` Esta tabela é responsável por conter as Unidades Federativas.``

## Attributes
  - __uf_id__ ![](resources/pk.png)
  - uf_name