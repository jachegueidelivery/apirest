# Application REST - Adonis API

A aplicação REST de todo o sistema.

1. NPM install
2. Run application
3. Run
4. Access

## Installation

Use the npm command to install the packges node

```bash
npm install
```

## Run

Use the adonis command run and start the application

```bash
adonis serve --dev
```

### Access

Access, in browser, the address http://127.0.0.1:[PORT_NAME]

# Database Documentation

> ## Entities:

- [Address](#)
- [Categories]()
- [Cities]()
- [Companies]()
- [Files]()
- [Contacts]()
- [Itens_Request]()
- [Products]()
- [Requests]()
- [Stocks]()
- [Users](#)
- [Ufs](#)

## Below, is __description__ from entities databases in System.

# \> :pushpin:__[Address](#s)__

## Description
> `` This table is accountable for register address of the system users.``

## Attributes
  - __address_id__ ![](resources/pk.png)
  - street
  - type_user
  - number
---

# \> __[Categories](#s)__

## Description
> `` Esta tabela é responsável por cadastrar as categorias dos produtos.``

## Attributes
  - __category_id__ ![](resources/pk.png)
  - category_name



----

# \> __[Cities](#s)__

## Description
> `` Esta __tabela__ terá as cidades já pré-cadastradas, no sistema. Por meio dessa tabela...``

## Attributes
  - __city_id__ ![](resources/pk.png)
  - city_name
---

# \> __[Companies](#s)__

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

# \> __[Files](#s)__

## Description
> `` Esta tabela é responsável por incluir os arquivos.``

## Attributes
  - __file_id__ ![](resources/pk.png)

---
# \> __[Contacts](#s)__

## Description
> `` Esta tabela é responsável por cadastrar os contatos.``

## Attributes
  - __contact_id__ ![](resources/pk.png)
  - number_phone
  - comapany_id
  - __user_id__ ![](resources/b_key.png)
---

# \> __[Itens_Request](#s)__

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

# \> __[Products](#s)__

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

# \> __[User_Requests](#s)__

## Description
> `` Esta tabela é responsável por cadastrar o pedido do cliente.``

## Attributes
  - __req_id__ ![](resources/pk.png)
  - req_status _(1, 2, 3, 4)_, default: **1**
  - __user_id__ ![](resources/b_key.png)
  - __compay_id__ ![](resources/b_key.png)
---

# \> __[Itens_Request](#s)__

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

# \> __[Stocks](#s)__

## Description
> `` Esta tabela é responsável por cadastrar a estoque dos produtos.``

## Attributes
  - __stock_id__ ![](resources/pk.png)
  - stock_product_price
  - stock_amount
  - stock_measure_type
  - __stock_product_id__ ![](resources/b_key.png)
---

# \> __[Users](#s)__

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

# \> __[UFs](#s)__

## Description
> `` Esta tabela é responsável por conter as Unidades Federativas.``

## Attributes
  - __uf_id__ ![](resources/pk.png)
  - uf_name