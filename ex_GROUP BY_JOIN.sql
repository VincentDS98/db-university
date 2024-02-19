GROUP BY
1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) AS anna_iscrizione, COUNT(id) AS num_studenti
FROM `students`
GROUP BY anno_iscrizione;

2. Contare gli insegnanti che hanno l ufficio nello stesso edificio
SELECT office_address, COUNT(id)
FROM `teachers`
GROUP BY office_address;

3. Calcolare la media dei voti di ogni appello d esame
SELECT exam_id, ROUND(AVG(vote),2) AS voto_medio
FROM `exam_student`
GROUP BY exam_id;

4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, COUNT(id) AS num_cdl
FROM `degrees`
GROUP BY department_id;







JOIN
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.id, students.name, students.surname, degrees.id, degrees.name
JOIN degrees
ON students.degree_id = degrees.id
WHERE degrees.name = 'corso di laurea in economia'
ORDER BY students.id;

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
Neuroscienze
SELECT  degrees.id, degrees.name, degrees.level, department.id, department.name
FROM `degrees`
JOIN department
ON degrees.department_id = department.id
WHERE degrees.level = 'magistrale'
AND department.name = 'dipartimento di neuroscenze';

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT *
FROM `courses`
JOIN courses_teacher
ON courses.id = courses_teacher.courses_id
JOIN teachers
ON courses_teacher.teacher_id = teachers.id
WHERE teachers.id = 44;
4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome
SELECT *
FROM `students`
JOIN degrees
ON students.degree_id = degrees.id
JOIN department
ON degrees.department_id = departments.id
ORDER BY students.surname, students.name;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.id, degrees.name, degrees.level, courses.id, courses.name, courses.year, courses.period, courses.cfu, teachers.id, teachers.surname, teachers.name
FROM `degrees`
JOIN courses
ON degrees.id  = courses.degree_id
JOIN courses_teacher
ON courses.id = courses_teacher.course_id
JOIN teachers
ON courses_teacher.teacher_id = teachers.id
ORDER BY degrees.name;

6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)
SELECT DISTINCT  teachers.id, teachers.surname, teachers.name, departments.id, departments.name
FROM `teachers`
JOIN course_teacher
ON teachers.id  = course_teacher.teacher_id
JOIN courses
ON course_teacher.course_id = courses.id
JOIN degrees
ON courses.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento Di Matematica'
ORDER BY teachers.id;


