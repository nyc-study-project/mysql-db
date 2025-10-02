USE mydb;

INSERT INTO students (name, email) VALUES
  ('Avi Maslow', 'avi@example.com'),
  ('Brian Luna', 'brian@example.com'),
  ('Koral Wheeler', 'koral@example.com');

INSERT INTO courses (code, title) VALUES
  ('CSCI101', 'Intro to Computer Science'),
  ('DB200',   'Databases for Developers'),
  ('WEB310',  'Web Applications');

-- simple enrollments
INSERT INTO enrollments (student_id, course_id) VALUES
  (1, 1),
  (1, 2),
  (2, 2),
  (3, 3);
