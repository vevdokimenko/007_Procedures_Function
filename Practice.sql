# Используя базу данных publishing
USE Publishing;
DELIMITER |

# 1 Создать хранимую процедуру, которая возвращает максимальное из двух чисел.
CREATE PROCEDURE maxOfTwoInts(IN a INT, IN b INT)
BEGIN
    DECLARE result INT DEFAULT b;

    IF (a > b)
    THEN
        SET result = a;
    END IF;

    SELECT result;
END;

CALL maxOfTwoInts(5, 5);

# 2. Написать хранимую процедуру, которое будет отображать информацию
# обо всех авторах из определенной страны, название которой передается в процедуру при вызове.
CREATE PROCEDURE getAuthorsByCountry(IN country VARCHAR(30))

BEGIN
    SELECT FirstName, LastName
    FROM Authors
             JOIN Country C ON C.ID_COUNTRY = Authors.ID_COUNTRY
    WHERE C.NameCountry = country;
END;
|

CALL getAuthorsByCountry('Ukraine');

# 3. Написать процедуру, позволяющую просмотреть все книги определенного
# автора, при этом его имя передается при вызове.
CREATE PROCEDURE getBooksOfAuthor(IN authorName VARCHAR(30))
BEGIN
    SELECT NameBook, Price, DrawingOfBook, Pages, A.FirstName, A.LastName
    FROM Books
             JOIN Authors A ON A.ID_AUTHOR = Books.ID_AUTHOR
    WHERE A.FirstName = authorName;
END; |

CALL getBooksOfAuthor('John');



# 4. Функцию, которая возвращает самую дорогую книгу указанной тематики.
# 5.Написать функцию, которая выводит информацию о количестве авторов,
# живущих в разных странах (название страны передается в качестве параметра).
# 6 Функцию, которая возвращает количество магазинов, которые не продали ни одной книги издательства.