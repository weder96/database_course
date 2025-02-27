-- Table: PersonStatus
INSERT INTO PersonStatus (PersonStatus)
	VALUES  ('Active'),
			('Inactive');


-- Table: Addresses
INSERT INTO Addresses (AddressLine1, AddressLine2, City, State, Country, PostalCode) 
	VALUES  ('966 Lancaster Avenue', NULL, 'Syracuse', 'New York', 'United States Of America', '13210'),
			('1011 Westcott Street', NULL,'Syracuse', 'New York', 'United States Of America', '13210'),
			('B-804, Dreams','Station Road, Bhandup','Mumbai', 'Maharashtra','India','400078'),
			('676 Euclid Avenue', NULL,'Syracuse', 'New York', 'United States Of America', '13211'),
			('63 Renmin Lu', NULL, 'Qingdao Shi', 'Shandong', 'People''s Republic Of China', '266033'),
			('732 Ackerman Avenue', NULL, 'Syracuse', 'New York', 'United States Of America', '13201'),
			('1444 Alameda Street', NULL, 'Los Angeles', 'California', 'United States Of America', '90021'),
			('11 Hyde Park Road', 'Kiwiville', 'Sydney', 'New South Wales', 'Australia', '2000'),
			('1-C Kendriya Sadan', 'Sultan Bazar', 'Hyderabad', 'Andhra Pradesh', 'India', '500195'),
			('800 Comstock Avenue', NULL,'Syracuse', 'New York', 'United States Of America', '13211');


-- Table: Person
INSERT INTO Person (PersonId, FirstName, LastName, NetID, Password, DateOfBirth, SocialSecurityNo, LocalAddress, HomeAddress, PersonStatus)
	VALUES  ('01-AD', 'Adams', 'Douglas', 'adouglas', 'ad#12345', '1991-02-15', NULL, 1, 7, 1),
			('02-DB', 'Devendra', 'Banhart', 'dbanhart', 'db_1991', '1995-11-17', '112233445', 2, 3, 1),
			('03-MF', 'Mariella', 'Frostrup', 'mfrostrup', NULL, '1981-12-12', '998877665',10, NULL, 1),
			('04-JZ', 'Jamie', 'Zawinski', 'jzawinski', 'jz!hello', '1990-12-30', NULL, 2, 8, 1),
			('05-CZ', 'Chao', 'Zhang', 'czhang', 'cz_syracuse', '1994-05-05', NULL, 1, 5, 1),
			('06-TZ', 'Theodore', 'Zeldin', 'tzeldin','tz_2015', '1991-09-05', NULL, 6, 6, 1),
			('07-DW', 'Daniel', 'Webster', 'dwebster',NULL, '1961-09-03', '8907654321', 4, NULL, 1),
			('08-JH', 'John', 'Holt', 'jholt',NULL, '1985-06-27', '907856341',4, NULL, 1),
			('09-TM', 'Thomas', 'Malory', 'tmalory', 'tm#1991', '1992-07-10', NULL, 1, 9, 1),
			('10-HS', 'Herbert', 'Spencer', 'hspencer',NULL, '1965-05-08', '654321789', 10, NULL, 1);


-- Table: StudentStatus
INSERT INTO StudentStatus (StudentStatus)
	VALUES  ('Undergraduate'),
			('Graduate'),
			('Non-matriculated'),
			('Graduated');


-- Table: Students
INSERT INTO Students (StudentId, PersonId, StudentStatusId)
	VALUES  ('STU01-AD', '01-AD', 1),
			('STU02-DB', '02-DB', 2),
			('STU03-JZ', '04-JZ', 1),
			('STU04-CZ', '05-CZ', 2),
			('STU05-TZ', '06-TZ', 2),
			('STU06-JH', '08-JH', 3),
			('STU07-TM', '09-TM', 2);


-- Table: Colleges
INSERT INTO Colleges (CollegeName)
	VALUES  ('School of Architecture'),
			('The College of Arts and Sciences'),
			('College of Engineering and Computer Science'),
			('School of Information Studies'),
			('College of Law'),
			('The Martin J. Whitman School of Management'),
			('S.I. Newhouse School of Public Communications'),
			('Maxwell School of Citizenship and Public Affairs');


-- Table: ProgramOfStudy
INSERT INTO ProgramOfStudy (ProfStudyId, ProfStudy, CollegeId)
	VALUES  ('BArch', 'Bachelor of Architecture', 1),
			('MArch', 'Master of Architecture', 1),
			('FSC', 'Biomedical Forensic Sciences', 2),
			('CSE', 'Computer Engineering', 3),
			('ELE', 'Electrical Engineering', 3),
			('IST', 'Information Management', 4),
			('TNM', 'Telecommunications and Network Management', 4),
			('EEE', 'Entrepreneurship and Emerging Enterprises', 6),
			('BDJ', 'Broadcast and Digital Journalism', 7),
			('PHO', 'Communications Photography', 7),
			('ANT', 'Anthropology', 8);


-- Table: Majors
INSERT INTO Majors (StudentId, ProfStudyId)
	VALUES  ('STU01-AD', 'ELE'),
			('STU02-DB', 'CSE'),
			('STU03-JZ', 'IST'),
			('STU04-CZ', 'TNM'),
			('STU05-TZ', 'FSC'),
			('STU06-JH', 'MArch'),
			('STU07-TM', 'EEE');


-- Table: Minors
INSERT INTO Minors (StudentId, ProfStudyId)
	VALUES  ('STU03-JZ', 'BDJ'),
			('STU03-JZ', 'PHO'),
			('STU04-CZ', 'ANT'),
			('STU05-TZ', 'EEE');


-- Table: BenefitsSelection
INSERT INTO BenefitsSelection (Benefits)
	VALUES  ('Single'),
			('Family'),
			('Op-out');


-- Table: HealthBenefits
INSERT INTO HealthBenefits (HealthBenefitsId, Cost, BenefitsSelection)
	VALUES  ('HB01', 900, 1),
			('HB02', 1500, 2),
			('HB03', 500, 1),
			('HB04', 2200, 2),
			('HB05', 700, 1),
			('HB06', 850, 1);


-- Table: VisionBenefits
INSERT INTO VisionBenefits (VisionBenefitsId, Cost, BenefitsSelection)
	VALUES  ('VB01', 900, 1),
			('VB02', 1300, 2),
			('VB03', 500, 1),
			('VB04', 2500, 2),
			('VB05', 700, 1),
			('VB06', 850, 1);


-- Table: DentalBenefits
INSERT INTO DentalBenefits (DentalBenefitsId, Cost, BenefitsSelection)
	VALUES  ('DB01', 800, 1),
			('DB02', 1500, 2),
			('DB03', 500, 1),
			('DB04', 1200, 2),
			('DB05', 700, 1),
			('DB06', 850, 1);


-- Table: JobInformation
INSERT INTO JobInformation (JobInformationId, JobTitle, JobDescription, JobRequirements, MinPay, MaxPay, UnionJob)
	VALUES  ('RASS','Research Assistant', 'Conduct literature reviews,Analyze data,Summarize project results,Prepare reports,presentations', 
			 'Academic and/or work experience related to the field of research, as defined by the supervisor/lead researcher, Experience 
			 with specialized software or datasets, Satisfactory academic progress, as defined by the supervisor', 800, 1550, 0),
			('ASCPROF', 'Associate Professor', 'Classroom lectures, directing projects, assisting with student research and internships',
			'Earned doctorate degree, Experience teaching graduate level, reasearch work', 5200, 10400, 0),
			('ASCDEAN', 'Associate Dean', 'provide intellectual leadership, engage in research and teaching missions, oversee administration',
			 'Earned doctorate degree,Experience in marketing and recruitment, Demonstrated ability to work collaboratively and effectively in a 
			  culturally diverse environment', 15500, 26600,0),
			('PROF', 'Professor', 'Expected to teach at the undergraduate and graduate levels, establish an externally funded and internationally 
			 visible research program that complements current research and teaching activities of the department', 
			 'A Ph.D. degree, ten years of appropriate experience required, Postdoctoral experience is highly desirable. Degree must be completed 
			 at time of application, demonstrated excellence in his/her area of expertise as evidenced by publications and will be expected to 
			 embark on an internationally visible program research', 10400, 20800, 0),
			('INSTR', 'Instructor', 'Conducts and manages academic classes and instructs students on workplace communications, employability 
			 skills, and health education.', 'Believing in the power of sharing your knowledge, motivating others, and putting students first 
			 and must be passionate about training tomorrow’s work force.A related bachelor’s degree.At least four years of related practical 
			 work experience.', 2500, 5500, 0),
			('ADMS', 'Administrative Specialist', 'performs higher level office support duties and provides specialized program support for 
			 an administrative department,conducting research, preparing statistical reports and spreadsheets,preparing correspondence, 
			 reports and presentations, handling information requests, planning conferences and meetings, providing purchasing and payroll support',
			 'four years of experience in an office or administrative support position', 5200, 10400, 0);


-- Table: Employees
INSERT INTO Employees (EmployeeId, PersonId, YearlyPay, JobInformation, HealthBenefits,	VisionBenefits, DentalBenefits)
	VALUES  ('EMP01-DB', '02-DB', 1000, 'RASS', 'HB01', 'VB03', 'DB05'),
			('EMP02-MF', '03-MF', 6000, 'ADMS', 'HB06', 'VB06', 'DB04'),
			('EMP03-DW', '07-DW', 10600, 'PROF', 'HB02', 'VB04', 'DB04'),
			('EMP04-HS', '10-HS', 20000, 'ASCPROF', 'HB05', 'VB04', 'DB04');


-- Table: Courses
INSERT INTO Courses (CourseId, CourseCode, CourseNumber, CourseTitle, CourseDescription)
	VALUES  ('ARC638', 'ARC', '638', 'American Architecture, 1860 - World War I', 'American architectural history and theory from the Civil War 
	         through various revival modes to development of new commercial and residential forms before World War II. Additional work required 
			 of graduate students.'),
			('ARC639', 'ARC', '639','Architectural History Principles', 'Examination of the principles of architectural history through study of 
			 selected buildings and movements.'),
			('ARC641', 'ARC', '641', 'Introduction to Architecture', 'An introduction to basic definitions and concepts of architecture as an 
			 intellectual and physical discipline, and as an expression of established and emerging cultural values.'),
			('FSC635', 'FSC', '635', 'Medicolegal Death Investigation I', 'Medicolegal death investigation which deals with the history, purpose 
			 and legal underpinning of death investigations, effectively handling a death scene, and protocols for public safety and scene 
			 processing. Additional work required of graduate students.'),
			('ELE606', 'ELE', '606', 'Probabilistic Methods in Electrical Engineering', 'Set-theoretic basis of probability. Probabilistic 
			 modeling of practical problems. Random variables in one and several dimensions. Functions of random variables. Moments, 
			 characteristic functions, correlation, sampling. Poisson process. Laws of large numbers and central limit theorem.'),
			('CSE664', 'CSE', '664', 'VLSI Design Methods', 'MOS VLSI technologies. MOS and CMOS digital circuits. CMOS layout, design rules 
			 and simulation. Examples of combinational and sequential circuits. Dynamic logic. Regular structures: memories, PLAs. Individual 
			 design project required.'),
			('CSE731', 'CSE', '731', 'VLSI Timing Analysis', 'Delay modeling and timing analysis of interconnections and gates. Critical path 
			 analysis and delay budgeting. Buffer insertion and device sizing. Switch and circuit level simulations.'),
			('IST659', 'IST', '659', 'Data Administration Concepts and Database Management', 'Definition, development, and management of databases 
			 for information systems. Data analysis techniques, data modeling, and schema design. Query languages and search specifications. 
			 Overview of file organization for databases. Data administration concepts and skills.'),
			('IST687', 'IST', '687', 'Applied Data Science', 'Introduces fundamentals about data and the standards, technologies, and methods for 
			 organizing, managing, curating, preserving, and using data. Discusses broader issues relating to data management and use as well as 
			 quality control and publication of data.'),
			('BDJ665', 'BDJ', '665', 'News Producing & Presenting', 'Students produce television newscasts and file stories to a website. Students 
			 rotate in positions including producers (newscast and web), writers, editors, anchors, sports, and weather. The newscasts are 
			 delivered on a professional news set.'),
			('PHO605', 'PHO', '605', 'Photojournalism and Multimedia', 'Principles and practices of photojournalism and multimedia storytelling. 
			 Photographing news, features, portraits, and sports. Picture story and essay production using digital, still, video, and sound. 
			 Location lighting techniques. Marketing practices. Additional work required of graduate students.'),
			('ANT624', 'ANT', '624', 'Netiation: Theory and Practice', 'Netiation skills for resolving differences effectively and achieving 
			 mutually satisfying outcomes. Position based versus interest based netiation. Advanced techniques of communication such as chunking, 
			 reframing, anchoring, metaphor and rapport to obtain netiation outcomes of excellence. Additional work required of graduate students.');


-- Table: Prerequisites
INSERT INTO Prerequisites (PrereqId, ParentCourseId, ChildCourseId)
	VALUES  ('PR01', 'ARC638', 'ARC639'),
			('PR02', 'CSE731', 'CSE664'),
			('PR03', 'IST687', 'IST659');


-- Table: Semester
INSERT INTO Semester (Semester)
	VALUES  ('Fall'),
			('Spring'),
			('Summer I'),
			('Summer II'),
			('Combined Summer');


-- Table: SemesterInfo
INSERT INTO SemesterInfo (Semester, SemYear, StartDate, EndDate)
	VALUES  (1, '2015', '2015-09-04', '2015-12-11'),
			(1, '2015', '2015-08-31', '2015-12-09'),
			(2, '2016', '2016-01-19', '2016-05-03'),
			(2, '2016', '2016-01-19', '2016-05-03'),
			(3, '2015', '2015-05-15', '2015-07-25');


-- Table: BuildingName
INSERT INTO BuildingName (BuildingId, Name)
	VALUES  ('SLH', 'Slocam Hall'),
			('LCS', 'Life Sciences Complex'),
			('HOL', 'Hall of Languages'),
			('LNK', 'Link Hall'),
			('HND', 'Hinds Hall'),
			('DIN', 'Dineen Hall'),
			('WSM', 'Management Building, Whitman School of Management'),
			('NSC', 'Newhouse Communications Center'),
			('EGR', 'Eggers Hall');


-- Table: Location
INSERT INTO Location (LocationId, BuildingName, RoomNumber)
	VALUES  ('SLH101', 'SLH', '101'),
			('SLH201', 'SLH', '201'),
			('LCS201', 'LCS', '201'),
			('LCS401', 'LCS', '401'),
			('LNK101', 'LNK', '101'),
			('LNK301', 'LNK', '301'),
			('HND101', 'HND', '101'),
			('HND301', 'HND', '301'),
			('NSC101', 'NSC', '101'),
			('EGR101', 'EGR', '101');


-- Table: Projector
INSERT INTO Projector (ProjectorText)
	VALUES  ('Yes'),
			('Smart Board'),
			('No');


-- Table: Classroom
INSERT INTO Classroom (Location, MaxSeating, Projector, NoOfWhiteBoards, AVEquipment) 
	VALUES  ('SLH101', 100, 1, 2, 'Computer, Wireless microphone kit, MP3 Voice Recorder, Speaker System'),
			('SLH201', 50, 2, 0, 'Computer'),
			('LCS201', 200, 1, 3, 'Computer, Wireless microphone kit, MP3 Voice Recorder, Speaker System, DVD Player'),
			('LCS401', 25, 3, 2, 'Computer'),
			('LNK101', 100, 1, 2, 'Computer, Wireless microphone kit, MP3 Voice Recorder, Speaker System, DVD Player'),
			('LNK301', 150, 1, 2, 'Computer, Wireless microphone kit, MP3 Voice Recorder, Speaker System'),
			('HND101', 75, 1, 3, 'Computer' ),
			('HND301', 100, 2, 0, 'No Additional Equipment'),
			('NSC101', 100, 1, 3, 'Computer, Wireless microphone kit, MP3 Voice Recorder, Speaker System, DVD Player'),
			('EGR101', 60, 3, 3, 'Computer');


-- Table: ScheduledCourses
INSERT INTO ScheduledCourses (CourseId, FacultyId, Semester, NoOfSeats, Classroom)
	VALUES  ('ARC638', 'EMP03-DW', 2, 30, 1),
			('ARC639', 'EMP03-DW', 1, 50, 2),
			('FSC635', 'EMP02-MF', 2, 20, 3),
			('ELE606', 'EMP01-DB', 1, 40, 4),
			('CSE664', 'EMP01-DB', 2, 70, 5),
			('CSE731', 'EMP03-DW', 3, 30, 6),
			('IST659', 'EMP04-HS', 1, 40, 7),
			('IST687', 'EMP04-HS', 4, 20, 8),
			('BDJ665', 'EMP04-HS', 2, 25, 9),
			('PHO605', 'EMP03-DW', 4, 30, NULL),
			('ANT624', NULL, 3, 20, 10)


-- Table: DailyCourseDay
INSERT INTO DailyCourseDay (ScheduledId, DayOfTheWeek, StartTime, EndTime)
	VALUES  (1, 'Monday', '11:40 AM', '1:00 PM'),
			(1, 'Wednesday', '11:40 AM', '1:00 PM'),
			(2, 'Friday', '12:00 PM', '3:00 PM'),
			(4, 'Friday', '3:45 PM', '6:25 PM'),
			(5, 'Monday', '2:25 PM', '3:35 PM'),
			(5, 'Wednesday', '2:25 PM', '3:35 PM'),
			(6, 'Thursday', '3:00 PM', '6:00 PM'),
			(7, 'Tuesday', '8:00 AM', '9:20 AM'),
			(7, 'Thursday', '8:00 AM', '9:20 AM'),
			(10, 'Tuesday', '11:45 AM', '2:00 PM');


-- Table: EnrollmentStatus
INSERT INTO EnrollmentStatus (EnrollmentStatus)
	VALUES  ('Regular'),
			('Pass/Fail'),
			('Audit');


-- Table: StudentGrade
INSERT INTO StudentGrade (Grade, GradePoints)
	VALUES  ('A', 4.0),
			('A-', 3.66),
			('B+', 3.33),
			('B', 3.0),
			('B-', 2.66),
			('C+', 2.33),
			('C', 2.0),
			('C-', 1.66),
			('D', 1.0),
			('D-', 0.66),
			('F', 0);


-- Table: Enrollment
INSERT INTO Enrollment (StudentId, ScheduleId, EnrollmentStatus, StudentGrade)
	VALUES  ('STU01-AD', 4, 1,'A'),
			('STU02-DB', 6, 1, NULL),
			('STU03-JZ', 7, 1, 'A-'),
			('STU03-JZ', 8, 3, NULL),
			('STU03-JZ', 9, 3, NULL),
			('STU03-JZ', 10, 2, NULL),
			('STU04-CZ', 11, 3, 'C+'),
			('STU05-TZ', 3, 1, 'B'),
			('STU07-TM', 7, 3, 'A'),
			('STU07-TM', 8, 3, NULL);
