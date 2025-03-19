INSERT INTO [dbo].[specialty]([name])VALUES('Acupuntura');
INSERT INTO [dbo].[specialty]([name])VALUES('Anestesiologia');
INSERT INTO [dbo].[specialty]([name])VALUES('Angiologia');
INSERT INTO [dbo].[specialty]([name])VALUES('Cardiologia');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia Cardiovascular');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia da Mão');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia do Aparelho Digestivo');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia Geral');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia Pediátrica');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia Plástica');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia Torácica');
INSERT INTO [dbo].[specialty]([name])VALUES('Cirurgia Vascular');
INSERT INTO [dbo].[specialty]([name])VALUES('Dermatologia');
INSERT INTO [dbo].[specialty]([name])VALUES('Radioterapia');
INSERT INTO [dbo].[specialty]([name])VALUES('Urologia');
INSERT INTO [dbo].[specialty]([name])VALUES('Pediatria');
INSERT INTO [dbo].[specialty]([name])VALUES('Psiquiatria');



INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('ligia@gmail.com',1,'1234566');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('alexandre@gmail.com',1,'123R72RA');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('fernando@gmail.com',1,'WDFU82FS');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('henrique@gmail.com',1,'NUFsfg93');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('joao@hotmail.com',1,'MFI98ed8F');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('bruno@gmail.com',1,'mIRU3j9');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('mariana@outlook.com',1,'mifU3IJF9');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('ricardo.lemos@spmedicalgroup.com.br',	2,'MVIV3f9J');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('roberto.possarle@spmedicalgroup.com.br',2,'sdfsgd747');
INSERT INTO [dbo].[users]([email],[user_type],[password])VALUES('helena.souza@spmedicalgroup.com.br',2,'fMFIOu3d');



INSERT INTO [dbo].[clinic]([costume_name],[corporate_reason],[address],[number],[cep]) VALUES ('Clinica A','UNI Medical Group','Av.Universitaria',5520,'75083515');
           


INSERT INTO [dbo].[patient]([name],[birth_date],[phone],[rg],[cpf], [user_id])VALUES('Ligia','1983-10-13','1134567654','435225435','94839859000',1);
INSERT INTO [dbo].[patient]([name],[birth_date],[phone],[rg],[cpf], [user_id])VALUES('Alexandre','2001-07-23','11987656543','326543457','73556944057',2);
INSERT INTO [dbo].[patient]([name],[birth_date],[phone],[rg],[cpf], [user_id])VALUES('Fernando','1978-10-10','1197204453','546365253','16839338002',3);
INSERT INTO [dbo].[patient]([name],[birth_date],[phone],[rg],[cpf], [user_id])VALUES('Henrique','1985-10-13','1134566543','543663625','14332654765',4);
INSERT INTO [dbo].[patient]([name],[birth_date],[phone],[rg],[cpf], [user_id])VALUES('João','1975-08-27','1176566377','325444441','91305348010',5);
INSERT INTO [dbo].[patient]([name],[birth_date],[phone],[rg],[cpf], [user_id])VALUES('Bruno','1972-03-21','11954368769','545662667','79799299004',6);
INSERT INTO [dbo].[patient]([name],[birth_date],[phone],[rg],[cpf], [user_id])VALUES('Mariana','2018-03-05','11969584932','545662668','13771913039',7);




INSERT INTO [dbo].[doctor]([crm],[name],[speciality_id],[clinic_id],[users_id])VALUES('54356SP','Ricardo Lemos',2,1,8);
INSERT INTO [dbo].[doctor]([crm],[name],[speciality_id],[clinic_id],[users_id])VALUES('53452SP','Roberto Possarle',17,1,9);
INSERT INTO [dbo].[doctor]([crm],[name],[speciality_id],[clinic_id],[users_id])VALUES('65463SP','Helena Strada',16,1,10);



INSERT INTO [dbo].[medical_consultation]([patient_id],[doctor_id],[data_consultation],[description],[status],price)VALUES(7,	3,'2019-01-20 15:00',null,1,400.00);
INSERT INTO [dbo].[medical_consultation]([patient_id],[doctor_id],[data_consultation],[description],[status],price)VALUES(2,	2,'2018-01-06 10:00',null,2,400.00);
INSERT INTO [dbo].[medical_consultation]([patient_id],[doctor_id],[data_consultation],[description],[status],price)VALUES(3,	2,'2019-02-07 11:00',null,3,400.00);
INSERT INTO [dbo].[medical_consultation]([patient_id],[doctor_id],[data_consultation],[description],[status],price)VALUES(2,	2,'2018-02-06 10:00',null,2,400.00);
INSERT INTO [dbo].[medical_consultation]([patient_id],[doctor_id],[data_consultation],[description],[status],price)VALUES(4,	1,'2019-02-07 11:00',null,3,400.00);
INSERT INTO [dbo].[medical_consultation]([patient_id],[doctor_id],[data_consultation],[description],[status],price)VALUES(7,	3,'2019-02-08 15:00',null,1,400.00);
INSERT INTO [dbo].[medical_consultation]([patient_id],[doctor_id],[data_consultation],[description],[status],price)VALUES(4,	1,'2019-02-09 11:00',null,2,400.00);


insert into check_uncheck(status) values(0);
insert into check_uncheck(status) values(1);

