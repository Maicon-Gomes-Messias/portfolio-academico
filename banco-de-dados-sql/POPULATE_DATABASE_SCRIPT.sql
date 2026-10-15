-- Esse arquivo contém as instruções SQL para popular o banco de dados. Executar os comandos na ordem em que aparecem, para que sejam respeitadas todas as constraints.

-- Os dados de usuarios abaixo sao ficticios e servem apenas para demonstracao.
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (1, 'usuario.um@exemplo.com', 'Usuário Um', 'senha-exemplo', 1, '31000000001', NULL, NULL, NULL);
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (2, 'usuario.dois@exemplo.com', 'Usuário Dois', 'senha-exemplo', 2, '31000000002', NULL, NULL, NULL);
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (3, 'usuario.tres@exemplo.com', 'Usuário Três', 'senha-exemplo', 1, '31000000003', NULL, NULL, NULL);
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (4, 'usuario.quatro@exemplo.com', 'Usuário Quatro', 'senha-exemplo', 2, '31000000004', NULL, NULL, NULL);
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (5, 'usuario.cinco@exemplo.com', 'Usuário Cinco', 'senha-exemplo', 1, '31000000005', NULL, NULL, NULL);
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (6, 'usuario.seis@exemplo.com', 'Usuário Seis', 'senha-exemplo', 1, '31000000006', NULL, NULL, NULL);
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (7, 'usuario.sete@exemplo.com', 'Usuário Sete', 'senha-exemplo', 2, '31000000007', NULL, NULL, NULL);
INSERT INTO `users`(`id`, `email`, `name`, `password`, `role`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES (8, 'usuario.oito@exemplo.com', 'Usuário Oito', 'senha-exemplo', 3, '31000000008', NULL, NULL, NULL);

INSERT INTO `categories`(`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (1, 'Doces sem Carboidratos', '', NULL, NULL);
INSERT INTO `categories`(`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (2, 'Salgados', NULL, NULL, NULL);
INSERT INTO `categories`(`id`, `name`, `description`, `created_at`, `updated_at`) VALUES (3, 'Doces Sem Gluten', 'Doces Sem Glúten', NULL, NULL);

INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (1, 2, 'Tortinha de Frango', 00019.00, NULL, NULL, 0, NULL, NULL, 'P', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (2, 2, 'Tortinha de Frango', 00019.00, NULL, NULL, 0, NULL, NULL, 'M', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (3, 2, 'Tortinha de Frango', 00019.00, NULL, NULL, 0, NULL, NULL, 'G', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (4, 2, 'Empada de Frango', 00021.00, NULL, NULL, 0, NULL, NULL, 'P', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (5, 2, 'Empada de Frango', 00021.00, NULL, NULL, 0, NULL, NULL, 'M', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (6, 2, 'Empada de Frango', 00021.00, NULL, NULL, 0, NULL, NULL, 'G', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (7, 2, 'Coxinha de Frango', 00005.00, NULL, NULL, 0, NULL, NULL, 'P', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (8, 2, 'Coxinha de Frango', 00005.00, NULL, NULL, 0, NULL, NULL, 'M', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (9, 2, 'Coxinha de Frango', 00005.00, NULL, NULL, 0, NULL, NULL, 'G', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (10, 2, 'Coxinha de Frango com Catupiry', 00007.00, NULL, NULL, 0, NULL, NULL, 'P', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (11, 2, 'Coxinha de Frango com Catupiry', 00007.00, NULL, NULL, 0, NULL, NULL, 'M', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (12, 2, 'Coxinha de Frango com Catupiry', 00007.00, NULL, NULL, 0, NULL, NULL, 'G', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (13, 1, 'Bolo no Pote', 00025.00, NULL, NULL, 0, NULL, NULL, 'G', NULL);
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (14, 1, 'Bolo no Pote', 00021.00, NULL, NULL, 0, NULL, NULL, 'P', 'Chocolate');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (15, 1, 'Bolo no Pote', 00023.00, NULL, NULL, 0, NULL, NULL, 'M', 'Chocolate');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (16, 1, 'Bolo no Pote', 00021.00, NULL, NULL, 0, NULL, NULL, 'P', 'Morango com Chocolate');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (17, 1, 'Bolo no Pote', 00021.00, NULL, NULL, 0, NULL, NULL, 'M', 'Morango com Chocolate');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (18, 1, 'Bolo no Pote', 00021.00, NULL, NULL, 0, NULL, NULL, 'G', 'Morango com Chocolate');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (19, 1, 'Palha Italiana', 00010.00, NULL, NULL, 0, NULL, NULL, 'P', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (20, 1, 'Palha Italiana', 00020.00, NULL, NULL, 0, NULL, NULL, 'M', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (21, 1, 'Palha Italiana', 00030.00, NULL, NULL, 0, NULL, NULL, 'G', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (22, 1, 'Brigadeiro', 00003.00, NULL, NULL, 0, NULL, NULL, 'P', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (23, 1, 'Brigadeiro', 00005.00, NULL, NULL, 0, NULL, NULL, 'M', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (24, 1, 'Brigadeiro', 00007.00, NULL, NULL, 0, NULL, NULL, 'G', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (25, 1, 'Beijinho', 00003.00, NULL, NULL, 0, NULL, NULL, 'P', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (26, 1, 'Beijinho', 00005.00, NULL, NULL, 0, NULL, NULL, 'M', '');
INSERT INTO `products`(`id`, `category_id`, `name`, `price`, `description`, `url_image`, `active`, `created_at`, `updated_at`, `size`, `taste`) VALUES (27, 1, 'Beijinho', 00007.00, NULL, NULL, 0, NULL, NULL, 'G', '');

INSERT INTO `addresses`(`id`, `user_id`, `name`, `CEP`, `full_name`, `number`, `complement`, `neighborhood`, `city`, `state`) VALUES (1, 1, 'Rua Auta de Souza', '30525060', 'Rua Auta de Souza', '120', NULL, 'Santa Maria', 'Belo Horizonte', 'MG');
INSERT INTO `addresses`(`id`, `user_id`, `name`, `CEP`, `full_name`, `number`, `complement`, `neighborhood`, `city`, `state`) VALUES (2, 1, 'Alameda dos Flamingos', '31213123', 'Alameda dos Flamingos', '321', 'Bl 1 Apt 801', 'Cabral', 'Contagem', 'MG');
INSERT INTO `addresses`(`id`, `user_id`, `name`, `CEP`, `full_name`, `number`, `complement`, `neighborhood`, `city`, `state`) VALUES (3, 2, 'Rua japura', '31231131', 'Rua japura', '482 ', NULL, 'Amazonas', 'Contagem', 'MG');
INSERT INTO `addresses`(`id`, `user_id`, `name`, `CEP`, `full_name`, `number`, `complement`, `neighborhood`, `city`, `state`) VALUES (4, 2, 'Rua do Jacare', '13112312', 'Rua do Jacare', '612', NULL, 'São Bento', 'Contagem', 'MG');
INSERT INTO `addresses`(`id`, `user_id`, `name`, `CEP`, `full_name`, `number`, `complement`, `neighborhood`, `city`, `state`) VALUES (5, 3, 'Rua Qualquer', '30525061', 'Rua Qualquer', '121', NULL, 'Santa Maria', 'Belo Horizonte', 'MG');
INSERT INTO `addresses`(`id`, `user_id`, `name`, `CEP`, `full_name`, `number`, `complement`, `neighborhood`, `city`, `state`) VALUES (6, 4, 'Rua Abençoada', '30131213', 'Rua Abençoada', '666', NULL, 'Funcionarios', 'Belo Horizonte', 'MG');
INSERT INTO `addresses`(`id`, `user_id`, `name`, `CEP`, `full_name`, `number`, `complement`, `neighborhood`, `city`, `state`) VALUES (7, 5, 'Rua Terere', '30131312', 'Rua Terere', '151', NULL, 'Pampulha', 'Belo Horizonte', 'MG');

INSERT INTO `orders`(`id`, `user_id`, `address_id`, `discount_id`, `status`, `total_price`, `order_date`, `delivery_date`) VALUES (1, 1, 1, NULL, 'Entregue', 45.00, '2021-06-01 23:55:21', '2021-06-08 20:55:27');
INSERT INTO `orders`(`id`, `user_id`, `address_id`, `discount_id`, `status`, `total_price`, `order_date`, `delivery_date`) VALUES (2, 1, 2, NULL, 'Enviado', 33.00, '2021-06-02 20:55:57', NULL);
INSERT INTO `orders`(`id`, `user_id`, `address_id`, `discount_id`, `status`, `total_price`, `order_date`, `delivery_date`) VALUES (3, 2, 3, NULL, 'Entregue', 45.00, '2021-06-01 23:55:21', '2021-06-08 20:55:27');
INSERT INTO `orders`(`id`, `user_id`, `address_id`, `discount_id`, `status`, `total_price`, `order_date`, `delivery_date`) VALUES (4, 2, 4, NULL, 'Enviado', 12.00, '2021-06-02 20:55:57', NULL);
INSERT INTO `orders`(`id`, `user_id`, `address_id`, `discount_id`, `status`, `total_price`, `order_date`, `delivery_date`) VALUES (5, 3, 5, NULL, 'Preparando', 28.00, '2021-06-08 23:57:12', NULL);

INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (1, 1, 1, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (2, 1, 2, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (3, 1, 3, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (4, 1, 5, 10);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (5, 2, 1, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (6, 2, 2, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (7, 2, 3, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (8, 2, 5, 13);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (9, 3, 1, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (10, 3, 2, 2);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (11, 3, 3, 21);
INSERT INTO `ordem_items`(`id`, `order_id`, `product_id`, `quantity`) VALUES (12, 4, 20, 1);

INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (1, 1, 1, 10);
INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (2, 1, 2, 20);
INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (3, 1, 3, 1);
INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (4, 2, 4, 11);
INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (5, 2, 5, 21);
INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (6, 2, 6, 4);
INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (7, 3, 4, 2);
INSERT INTO `cart_items`(`id`, `user_id`, `product_id`, `quantity`) VALUES (8, 3, 5, 42);
