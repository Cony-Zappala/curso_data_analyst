#ejercicio 1:
SELECT *
FROM transaction
WHERE company_id in (SELECT id 
FROM company
WHERE country = "Germany");

#Podemos ver todas las transacciones realizadas por las 8 empresas alemanas. Son 118 operaciones.
#He calculado anteriormente con el agregado de AND declined = 0 para que contabilice únicamente las transacciones efectivas
#y en ese caso el total ha sido de 111 operaciones. 

#ejercicio 2:
SELECT *
FROM company
WHERE id in (SELECT company_id
	FROM transaction 
	WHERE amount > (
		SELECT AVG(amount)
		FROM transaction
    )
);
#La ejecución de esta consulta nos arroja un total de 70 líneas compuestas por empresas que han tenido transacciones por un importe superior a la media.

#ejercicio 3:
SELECT *, (SELECT company_name
			FROM company
            WHERE company.id = transaction.company_id) AS c_name
FROM transaction
WHERE company_id IN (
	SELECT id FROM company WHERE company_name LIKE "C%");

#Podemos ver las transacciones que realizaron las compañías cuyo nombre comienza con la letra "C". Tanto las que se han completado como las que han sido declinadas.

#ejercicio 4:
SELECT company.company_name
FROM transactions.company
WHERE company.id NOT IN (SELECT transaction.company_id FROM transactions.transaction);
#ya han eliminado del listado a las empresas por lo que en esta búsqueda no sale ningún resultado.

##NIVEL 2
#ejercicio 1:
SELECT *
FROM transaction
WHERE company_id IN (
	SELECT id
	FROM company
	WHERE country = (SELECT country FROM company WHERE company_name = "Non Institute"));
#Con este resultado vemos todas las transacciones realizadas en el mismo país que la empresa Non Institute, incluyendo en este listado
#también todas las operaciones de esa empresa. Aparecen 100 líneas como respuesta

#ejercicio 2:
SELECT *
FROM company
WHERE id IN (SELECT company_id
				FROM transaction
				WHERE amount = (SELECT max(amount)
								FROM transaction));
#Podemos ver que la empresa Nunc Interdum Incorporated ha sido la que ha realizado la transacción por el mayor importe.

##NIVEL 3
#ejercicio 1:
SELECT avg(amount), (SELECT country
					FROM company
					WHERE company.id = transaction.company_id) AS c_country
FROM transaction
GROUP BY c_country
HAVING avg(amount) > (SELECT avg(amount) FROM transaction)
ORDER BY c_country DESC;
#el resultado nos muestra los 5 países en los cuales el promedio de las transacciones es superior a la media de las transacciones.

#ejercicio 2:
SELECT company_id, (SELECT company_name
			FROM company
            WHERE company.id = transaction.company_id) AS c_name, 
	CASE WHEN count(id) > 4 THEN "MAS DE CUATRO" ELSE "MENOS DE CUATRO" END AS cantidad_de_operaciones
FROM transaction
GROUP BY company_id
ORDER BY cantidad_de_operaciones;

#Podemos ver cuáles son las empresas que realizaron más de cuatro transacciones y cuáles menos. 
