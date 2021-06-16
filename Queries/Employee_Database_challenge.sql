-- Deliverable 1: create retirement_titles csv.
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Deliverable 1: Use Dictinct with Orderby to remove duplicate rows, and create unique_titles.csv
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;
-- Deliverable 1: create retiring_titles.csv
SELECT COUNT(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;
SELECT* FROM retiring_titles
-----------------------------------------
--Deliverable 2: Create mentroship_eligibility.csv
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
d.from_date,
d.to_date,
t.title
INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS d
ON (e.emp_no = d.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (d.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
ORDER BY emp_no;
SELECT* FROM mentor_eligibility