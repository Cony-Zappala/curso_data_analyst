##NIVEL_1

#ejercicio 1 ver archivo adjunto pdf

#ejercicio_2
SELECT company_name, email, country FROM transactions.company
order by company_name;
#En este caso hemos obtenido los nombres, el email y los países de cada compañía ordenados según los nombres de las compañías.

#ejercicio_3 
SELECT distinct country FROM transactions.company 
JOIN transactions.transaction 
ON company.id = transaction.company_id;
#Este es el listado de países que se encuentran realizando compras. 

#ejercicio_4:
SELECT count(distinct(country))
FROM transactions.company 
JOIN transactions.transaction 
ON company.id = transaction.company_id;
#Las compras se están realizando desde 15 países.

#ejercicio_5:
SELECT company_name, country FROM transactions.company
WHERE id = "b-2354";
#La compañía con id número b-2354 pertenece al Reino Unido y su nombre es "Ac Libero Inc."

#ejercicio_6:
SELECT company.company_name, company.id, avg(transaction.amount)
FROM transactions.company
JOIN transactions.transaction
ON company.id = transaction.company_id
WHERE transaction.declined = 0 
GROUP BY transaction.company_id
  ORDER BY AVG(transaction.amount) DESC
LIMIT 1;
#La compañía con mayor gasto mediano es Eget Ipsum Ltd, cuyo id es el número b-2398 y tiene un gasto promedio de 481,86.

##NIVEL_2
#ejercicio_1:
#No puede haber dos compañías con el mismo Id, pues es la clave distintiva y única para cada compañía.
SELECT company.company_name, count(company_name)
FROM transactions.company
GROUP BY company.company_name;
#esta búsqueda arroja 100 líneas.
SELECT company.id, count(id)
FROM transactions.company
GROUP BY company.id;
#esta búsqueda también arroja 100 líneas. De esta manera comprobamos que hay 100 nombres de empresas y 100 id asociados a esas empresas.

#ejercicio_2:
SELECT DATE(transaction.timestamp), sum(transaction.amount)
FROM transactions.transaction
GROUP BY DATE(transaction.timestamp)
ORDER BY sum(transaction.amount) DESC
LIMIT 5;
#En el cuadro debajo podemos observar cuáles fueron las 5 fechas en las que más se ha vendido y por cuánto dinero.

#ejercicio_3:
SELECT DATE(transaction.timestamp), sum(transaction.amount)
FROM transactions.transaction
GROUP BY DATE(transaction.timestamp)
ORDER BY sum(transaction.amount) ASC
LIMIT 5;
#En estos cinco días se han realizado las ventas de menor valor y por los montos de dinero que figuran allí.

#ejercicio_4:
SELECT company.country, Avg(transaction.amount)
FROM transactions.company
JOIN transactions.transaction
ON company.id = transaction.company_id 
GROUP BY company.country
ORDER BY avg(transaction.amount) DESC;
#En el cuadro podemos ver cuál es la media de gasto por país, comenzando con Estados Unidos que cuenta con una media de casi 310 euros.

##NIVEL 3
#ejercicio_1:
SELECT company.company_name, company.phone, company.country, sum(transaction.amount)
FROM transactions.company
JOIN transactions.transaction
ON company.id = transaction.company_id 
WHERE transaction.amount >=100 AND transaction.amount <= 200
AND declined = 0
GROUP BY company.id
ORDER BY sum(transaction.amount) DESC;

#ejercicio_2:
SELECT company.company_name 
FROM transactions.company
JOIN transactions.transaction
ON company.id = transaction.company_id
WHERE DATE(transaction.timestamp) in ("2022-03-16", "2022-02-28", "2022-02-13")
GROUP BY company.company_name;