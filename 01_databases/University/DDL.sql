-- Table: PersonStatus
CREATE TABLE PersonStatus (
    StatusId			INT				PRIMARY KEY		IDENTITY(1, 1),
    PersonStatus		VARCHAR(10)		NOT NULL
);


-- Table: Addresses
CREATE TABLE Addresses (
    AddressId			INT				PRIMARY KEY		IDENTITY(1, 1),
    AddressLine1		VARCHAR(50)		NOT NULL,
    AddressLine2		VARCHAR(50),
    City				VARCHAR(50)		NOT NULL,
    State				VARCHAR(50)		NOT NULL,
    Country				VARCHAR(50)		NOT NULL,
    PostalCode			VARCHAR(20)		NOT NULL
);


-- Table: Person
CREATE TABLE Person (
    PersonId			VARCHAR(10)		PRIMARY KEY,
    FirstName			VARCHAR(20)		NOT NULL,
    LastName			VARCHAR(20)		NOT NULL,
    NetID				VARCHAR(20)		NOT NULL,
    Password			VARCHAR(50),
    DateOfBirth			DATE			NOT NULL,
    SocialSecurityNo	CHAR(10),
    LocalAddress		INT				NOT NULL		REFERENCES Addresses(AddressId),
    HomeAddress			INT 							REFERENCES Addresses(AddressId),
	PersonStatus		INT				NOT NULL		REFERENCES PersonStatus(StatusId)
);


-- Table: StudentStatus
CREATE TABLE StudentStatus (
    StatusId			INT				PRIMARY KEY		IDENTITY(1, 1),
    StudentStatus		VARCHAR(20)		NOT NULL
);


-- Table: Students
CREATE TABLE Students (
    StudentId			VARCHAR(10)		PRIMARY KEY,
    PersonId			VARCHAR(10)		NOT NULL		REFERENCES Person(PersonId),
    StudentStatusId		INT				NOT NULL		REFERENCES StudentStatus(StatusId)
);


-- Table: Colleges
CREATE TABLE Colleges (
	CollegeId			INT				PRIMARY KEY		IDENTITY(1, 1),
    CollegeName			VARCHAR(100)		NOT NULL
);


-- Table: ProgramOfStudy
CREATE TABLE ProgramOfStudy (
    ProfStudyId		VARCHAR(10)		PRIMARY KEY,
    ProfStudy			VARCHAR(50)		NOT NULL,
    CollegeId			INT				NOT NULL		REFERENCES Colleges(CollegeId)
);


-- Table: Majors
CREATE TABLE Majors (
	MajorId				INT				PRIMARY KEY		IDENTITY(1,1),
    StudentId			VARCHAR(10)		NOT NULL		REFERENCES Students(StudentId),
    ProfStudyId		VARCHAR(10)		NOT NULL		REFERENCES ProgramOfStudy(ProfStudyId)
);


-- Table: Minors
CREATE TABLE Minors (
	MinorId				INT				PRIMARY KEY		IDENTITY(1,1),
    StudentId			VARCHAR(10)		NOT NULL		REFERENCES Students(StudentId),
    ProfStudyId		VARCHAR(10)		NOT NULL		REFERENCES ProgramOfStudy(ProfStudyId)
);


-- Table: BenefitsSelection
CREATE TABLE BenefitsSelection (
    BenefitsId			INT				PRIMARY KEY		IDENTITY(1, 1),
    Benefits			VARCHAR(20)		NOT NULL
);


-- Table: HealthBenefits
CREATE TABLE HealthBenefits (
    HealthBenefitsId	VARCHAR(10)		PRIMARY KEY,
    Cost				DECIMAL(10,2)	NOT NULL,
    BenefitsSelection	INT				NOT NULL		REFERENCES BenefitsSelection(BenefitsId)			
);


-- Table: VisionBenefits
CREATE TABLE VisionBenefits (
    VisionBenefitsId	VARCHAR(10)		PRIMARY KEY,
    Cost				DECIMAL(10,2)	NOT NULL,
    BenefitsSelection	INT				NOT NULL		REFERENCES BenefitsSelection(BenefitsId)			
);


-- Table: DentalBenefits
CREATE TABLE DentalBenefits (
    DentalBenefitsId	VARCHAR(10)		PRIMARY KEY,
    Cost				DECIMAL(10,2)	NOT NULL,
    BenefitsSelection	INT				NOT NULL		REFERENCES BenefitsSelection(BenefitsId)
);


-- Table: JobInformation
CREATE TABLE JobInformation (
    JobInformationId	VARCHAR(10)		PRIMARY KEY,
    JobTitle			VARCHAR(50)		NOT NULL,
    JobDescription		VARCHAR(500)	NOT NULL,
    JobRequirements		VARCHAR(1000)	NOT NULL,
    MinPay				INT				NOT NULL,
    MaxPay				INT				NOT NULL,
    UnionJob			BIT				NOT NULL
);


-- Table: Employees
CREATE TABLE Employees (
    EmployeeId			VARCHAR(10)		PRIMARY KEY,
    PersonId			VARCHAR(10)		NOT NULL		REFERENCES Person(PersonId),
    YearlyPay			INT				NOT NULL,
    JobInformation		VARCHAR(10)		NOT NULL		REFERENCES JobInformation(JobInformationId),
    HealthBenefits		VARCHAR(10)		NOT NULL		REFERENCES HealthBenefits(HealthBenefitsId), 
	VisionBenefits		VARCHAR(10)		NOT NULL		REFERENCES VisionBenefits(VisionBenefitsId),
    DentalBenefits		VARCHAR(10)		NOT NULL		REFERENCES DentalBenefits( DentalBenefitsId)
);


-- Table: Courses
CREATE TABLE Courses (
    CourseId			VARCHAR(10)		PRIMARY KEY,
    CourseCode			VARCHAR(10)		NOT NULL,
    CourseNumber		VARCHAR(10)		NOT NULL,
    CourseTitle			VARCHAR(100)		NOT NULL,
    CourseDescription	VARCHAR(1000)	NOT NULL
);


-- Table: Prerequisites
CREATE TABLE Prerequisites (
    PrereqId			VARCHAR(20)		PRIMARY KEY,
    ParentCourseId		VARCHAR(10)		NOT NULL		REFERENCES Courses(CourseId),
    ChildCourseId		VARCHAR(10)		NOT NULL		REFERENCES Courses(CourseId)
);


-- Table: Semester
CREATE TABLE Semester (
    SemesterId			INT				PRIMARY KEY		IDENTITY(1, 1),
    Semester			VARCHAR(20)		NOT NULL
);


-- Table: SemesterInfo
CREATE TABLE SemesterInfo (
    SemesterId			INT				PRIMARY KEY		IDENTITY(1, 1),
    Semester			INT				NOT NULL		REFERENCES Semester(SemesterId),
    SemYear				CHAR(4)			NOT NULL,
    StartDate			DATE			NOT NULL,
    EndDate				DATE			NOT NULL,
);


-- Table: BuildingName
CREATE TABLE BuildingName (
    BuildingId			VARCHAR(10)		PRIMARY KEY,
    Name				VARCHAR(50)		NOT NULL,
);


-- Table: Location
CREATE TABLE Location (
    LocationId			VARCHAR(10)		PRIMARY KEY,
    BuildingName		VARCHAR(10)		NOT NULL		REFERENCES BuildingName(BuildingId),
    RoomNumber			INT				NOT NULL
);


-- Table: Projector
CREATE TABLE Projector (
    ProjectorId			INT				PRIMARY KEY		IDENTITY(1, 1),
    ProjectorText		VARCHAR(20)		NOT NULL
);


-- Table: Classroom
CREATE TABLE Classroom (
    ClassroomId			INT				PRIMARY KEY     IDENTITY(1, 1),
    Location			VARCHAR(10)		NOT NULL		REFERENCES Location(LocationId),
	MaxSeating			INT				NOT NULL		CHECK(MaxSeating >= 0),
	Projector			INT				NOT NULL		REFERENCES Projector(ProjectorId),
    NoOfWhiteBoards		INT				NOT NULL		,
    AVEquipment			VARCHAR(1000)	NOT NULL  
);


-- Table: ScheduledCourses
CREATE TABLE ScheduledCourses (
    ScheduleId			INT				PRIMARY KEY     IDENTITY(1, 1),
    CourseId			VARCHAR(10)		NOT NULL		REFERENCES Courses(CourseId),
    FacultyId			VARCHAR(10)						,
    Semester			INT				NOT NULL		REFERENCES SemesterInfo(SemesterId),
    NoOfSeats			INT				NOT NULL		CHECK(NoOfSeats >= 0),
    Classroom			INT								REFERENCES Classroom(ClassroomId)
);


-- Table: DailyCourseDay
CREATE TABLE DailyCourseDay (
    DailyCourseId		INT				NOT NULL		IDENTITY(1, 1),
    ScheduledId			INT				NOT NULL		REFERENCES ScheduledCourses(ScheduleId),
    DayOfTheWeek		VARCHAR(20)		NOT NULL,
    StartTime			TIME(0)			NOT NULL,
    EndTime				TIME(0)			NOT NULL
);


-- Table: EnrollmentStatus
CREATE TABLE EnrollmentStatus (
    StatusId			INT				PRIMARY KEY		IDENTITY(1, 1),
    EnrollmentStatus	VARCHAR(20)		NOT NULL
);


-- Table: StudentGrade
CREATE TABLE StudentGrade (
    Grade				VARCHAR(20)		PRIMARY KEY,
	GradePoints			DECIMAL(4,2)    NOT NULL
);


-- Table: Enrollment
CREATE TABLE Enrollment (
    EnrollmentId		INT				PRIMARY KEY		IDENTITY(1, 1),
    StudentId			VARCHAR(10)		NOT NULL		REFERENCES Students(StudentId) ,
    ScheduleId			INT				NOT NULL		REFERENCES ScheduledCourses(ScheduleId),
    EnrollmentStatus	INT				NOT NULL		REFERENCES EnrollmentStatus(StatusId),
    StudentGrade		VARCHAR(20)						REFERENCES StudentGrade(Grade)
);
