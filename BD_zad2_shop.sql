-- Active: 1669993150186@@127.0.0.1@3306@shop

SELECT * from products;
SELECT products.nazwa_produktu, providers.name
FROM providers
INNER JOIN products
ON products.id_product = providers.id_product;


CREATE VIEW dostawcy
AS SELECT products.nazwa_produktu, providers.name
FROM providers
INNER JOIN products
ON products.id_product = providers.id_product;
