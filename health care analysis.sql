create database healthcare;
use  healthcare;

create table Diagnoses(
DiagnosisID INT primary key ,
DiagnosisName varchar(255));

create table Outcome( 
OutcomeID INT  PRIMARY KEY ,
Outcomename varchar(255));

create table patients (
PatientID INT primary key ,
Name varchar(255),
Age int,
Gender varchar(5),
DiagnosisID int ,
AdmissionDate date ,
DischargeDate date,
OutcomeID int,
TreatmentCost decimal(10,2),
foreign key (DiagnosisId ) references Diagnoses(DiagnosisID),
foreign key (OutcomeID) references Outcome(OutcomeID)
);

create table labs(
LabId INT primary KEY ,
PatientID int ,
TestName varchar(255),
Result decimal(10,2),
NormalRange varchar(125),
foreign key	(PatientId) references Patients(PatientId) );
select * from patients;

select * from outcome;
select * from labs;
select * from diagnoses;

--  Retrieve deatiled patient lab history 
select p.patientId ,p.name ,d.diagnosisname , o.outcomename, 
l.result,l.testname, l.normalrange 
from patients p 
join diagnoses d  on p.diagnosisid = d.diagnosisId
join outcome o on p.outcomeid = o.outcomeID
join labs l on p.patientid = l.patientID
order by p.patientid,l.testname;