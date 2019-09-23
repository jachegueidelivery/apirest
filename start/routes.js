"use strict";

const Route = use("Route");

Route.post("users", "UserController.store"); // Cria um novo usuário
Route.post("sessions", "SessionController.store"); // Autenticação do usuário

Route.post("passwords", "ForgotPasswordController.store"); // Envia um token para redefinir a senha
Route.put("passwords", "ForgotPasswordController.update"); // Altera a senha

Route.post("files", "FileController.store"); // Salva um arquivo
Route.get("files/:id", "FileController.show"); // Busca um arquivo por id

Route.post("companies", "CompanyController.store"); // Cria uma nova empresa
Route.get("companies", "CompanyController.index"); // Busca as empresas por like: FantasyName
Route.get("companies/:id", "CompanyController.show"); // Busca uma empresa por id

Route.get("requests/company/:company_id", "CompanyController.getRequests"); //Busca os pedidos de uma empresa específica

Route.post("products", "ProductController.store"); // Cria um novo produto

//Adicionados
Route.get("products/company/:id", "ProductController.getProductsByCompanyId"); //
Route.get(
  "categories/company/:id",
  "CategoryController.getCategoriesByCompanyId"
);
