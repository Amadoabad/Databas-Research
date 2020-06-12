Create database Clinic;

Create table Patients (
id int Primary key identity ,
Fname varchar(64) ,
Lname varchar(64) )

Create table Patient_Case (
id int primary key identity,
patient_id int not null,
start_time timestamp ,
end_time datetime null,
in_progress bit,
total_cost decimal(10,2) null,
amount_paid decimal(10,2) null)

Alter table Patient_Case 
add foreign key (patient_id) references Patients(id);

Create table Appointments (
id int primary key identity,
patient_case_id int ,
time_created timestamp,
appointment_start_time datetime,
appointment_end_time datetime null)

alter table Appointments 
add foreign key (patient_case_id) references Patient_Case(id);

Create table status_history(
id int primary key identity ,
appointment_id int,
status_time timestamp,
details text )

alter table status_history
add foreign key (appointment_id) references Appointments(id);

Create table appointment_status(
id int primary key identity,
status_name varchar(64))

alter table Appointments 
add appointment_status_id int foreign key references appointment_status(id)

alter table status_history 
add appointment_status_id int foreign key references appointment_status(id)



