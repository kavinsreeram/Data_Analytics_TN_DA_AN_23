CREATE TABLE learners (
    learner_id INTEGER PRIMARY KEY,
    full_name TEXT,
    Country TEXT
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT,
    category TEXT,
    unit_price REAL
);

CREATE TABLE purchases (
    purchase_id INTEGER PRIMARY KEY,
    learner_id INTEGER,
    course_id INTEGER,
    Quantity INTEGER,
    purchase_date DATE,
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO learners (learner_id, full_name, Country)
VALUES
(1, 'Kavin Sreeram', 'India'),
(2, 'Arun Kumar', 'India'),
(3, 'John Smith', 'USA'),
(4, 'Emma Wilson', 'UK'),
(5, 'Daniel Lee', 'Singapore');

INSERT INTO courses (course_id, course_name, category, unit_price)
VALUES
(101, 'Python Programming', 'Programming', 4999.00),
(102, 'Data Science Fundamentals', 'Data Science', 6999.00),
(103, 'SQL and Database Management', 'Database', 3999.00),
(104, 'AWS Cloud Essentials', 'Cloud', 7999.00),
(105, 'Full Stack Web Development', 'Web Development', 8999.00);

INSERT INTO purchases
(purchase_id, learner_id, course_id, Quantity, purchase_date)
VALUES
(1001, 1, 101, 1, '2026-10-01'),
(1002, 1, 103, 1, '2026-10-03'),
(1003, 2, 102, 1, '2026-10-05'),
(1004, 2, 104, 1, '2026-10-07'),
(1005, 3, 105, 1, '2026-10-10'),
(1006, 4, 101, 2, '2026-10-12'),
(1007, 5, 103, 1, '2026-10-15'),
(1008, 3, 102, 1, '2026-10-18');

SELECT
    l.learner_id,
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    p.Quantity AS quantity,
    printf('%.2f', c.unit_price * p.Quantity) AS total_amount,
    p.purchase_date
FROM learners l
INNER JOIN purchases p
    ON l.learner_id = p.learner_id
INNER JOIN courses c
    ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT
    l.learner_id,
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    COALESCE(p.Quantity, 0) AS quantity,
    printf('%.2f', COALESCE(c.unit_price * p.Quantity, 0)) AS total_amount,
    p.purchase_date
FROM learners l
LEFT JOIN purchases p
    ON l.learner_id = p.learner_id
LEFT JOIN courses c
    ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT
    l.learner_id,
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    COALESCE(p.Quantity, 0) AS quantity,
    printf('%.2f', COALESCE(c.unit_price * p.Quantity, 0)) AS total_amount,
    p.purchase_date
FROM purchases p
RIGHT JOIN courses c
    ON p.course_id = c.course_id
LEFT JOIN learners l
    ON p.learner_id = l.learner_id
ORDER BY total_amount DESC;

SELECT
    l.full_name AS learner_name,
    c.course_name,
    c.category,
    p.Quantity AS quantity,
    printf('%.2f', c.unit_price * p.Quantity) AS total_amount,
    p.purchase_date
FROM learners l
LEFT JOIN purchases p
    ON l.learner_id = p.learner_id
LEFT JOIN courses c
    ON p.course_id = c.course_id
ORDER BY total_amount DESC;

#Q1. Display each learner’s total spending (quantity × unit_price) along with their country.
select l.learner_id,
       l.full_name,
       l.Country,
       sum(c.unit_price * p."Quantity") as total_spending
 from learners l
 join purchases p on p.learner_id = l.learner_id 
 join courses c on c.course_id = p.course_id
 GROUP BY l.learner_id,l.full_name,l.Country
 ORDER BY total_spending desc

#Q2. Find the top 3 most purchased courses based on total quantity sold.
select c.course_id,c.course_name,sum(p.Quantity) as Most_Purchased from courses c
join purchases p on p.course_id = c.course_id
GROUP BY c.course_id,c.course_name
ORDER BY Most_Purchased DESC
LIMIT 3;

#Q3. Show each course category’s total revenue and the number of unique learners who purchased from that category.
select c.category,
       sum(p.Quantity * c.unit_price) as Total_Revenue,
       count( DISTINCT p.learner_id) as Unique_Learners from courses c
join purchases p on p.course_id = c.course_id
GROUP BY c.category;

#Q4. List all learners who have purchased courses from more than one category.
select l.learner_id,l.full_name,count(DISTINCT c.category) category_cnt from purchases p
join learners l on l.learner_id = p.learner_id
join courses c on c.course_id = p.course_id
GROUP BY l.full_name,l.learner_id
HAVING category_cnt > 1;

#Q5. Identify courses that have not been purchased at all.
INSERT INTO courses (course_id, course_name, category, unit_price)
VALUES
(106, 'Machine Learning with Python', 'Artificial Intelligence', 9999.00);
select * from courses c
where c.course_id  not in (select p.course_id from purchases p);
