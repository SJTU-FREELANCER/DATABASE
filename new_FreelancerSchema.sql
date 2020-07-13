/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/13 13:52:25                           */
/*==============================================================*/


drop table if exists App_Comment;

drop table if exists App_Gr;

drop table if exists Apply_Info;

drop table if exists Rec_Comment;

drop table if exists Rec_Gr;

drop table if exists Recruit_Info;

drop table if exists Resume;

drop table if exists User;

/*==============================================================*/
/* Table: App_Comment                                           */
/*==============================================================*/
create table App_Comment
(
   User_ID              int not null,
   Rec_ID               int not null,
   App_Comm             varchar(200),
   App_Grade            int,
   primary key (User_ID, Rec_ID)
);

/*==============================================================*/
/* Table: App_Gr                                                */
/*==============================================================*/
create table App_Gr
(
   User_ID              int not null,
   App_Avg_Grade        float,
   App_Grade_Num        int,
   primary key (User_ID)
);

/*==============================================================*/
/* Table: Apply_Info                                            */
/*==============================================================*/
create table Apply_Info
(
   User_ID              int not null,
   Rec_ID               int not null,
   Accepted             int,
   primary key (User_ID, Rec_ID)
);

/*==============================================================*/
/* Table: Rec_Comment                                           */
/*==============================================================*/
create table Rec_Comment
(
   User_ID              int not null,
   Rec_ID               int not null,
   Rec_Comm             varchar(200),
   Rec_Grade            int,
   primary key (User_ID, Rec_ID)
);

/*==============================================================*/
/* Table: Rec_Gr                                                */
/*==============================================================*/
create table Rec_Gr
(
   User_ID              int not null,
   Rec_Acg_Grade        float,
   Rec_Grade_Num        int,
   primary key (User_ID)
);

/*==============================================================*/
/* Table: Recruit_Info                                          */
/*==============================================================*/
create table Recruit_Info
(
   Rec_ID               int not null,
   User_ID              int,
   Rec_Salary           int,
   Rec_Location         varchar(80),
   Rec_TimeSchedule     varchar(80),
   Rec_Title            varchar(20),
   Rec_Cate             varchar(10),
   Rec_Enrolled         int,
   Rec_Quota            int,
   Rec_Desc             varchar(500),
   Rec_Experience       varchar(20),
   Rec_Education        varchar(10),
   primary key (Rec_ID)
);

/*==============================================================*/
/* Table: Resume                                                */
/*==============================================================*/
create table Resume
(
   User_ID              int not null,
   Name                 varchar(10),
   Gender               bool,
   Birth                date,
   Experience           varchar(20),
   Education            varchar(10),
   primary key (User_ID)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   User_ID              int not null,
   User_Name            varchar(25),
   Password             varchar(25),
   Phone                varchar(20),
   Email                varchar(30),
   Role                 bool,
   primary key (User_ID)
);

alter table App_Comment add constraint FK_App_Comment foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table App_Comment add constraint FK_App_Comment2 foreign key (Rec_ID)
      references Recruit_Info (Rec_ID) on delete restrict on update restrict;

alter table App_Gr add constraint FK_Relationship_4 foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Apply_Info add constraint FK_Apply_Info foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Apply_Info add constraint FK_Apply_Info2 foreign key (Rec_ID)
      references Recruit_Info (Rec_ID) on delete restrict on update restrict;

alter table Rec_Comment add constraint FK_Rec_Comment foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Rec_Comment add constraint FK_Rec_Comment2 foreign key (Rec_ID)
      references Recruit_Info (Rec_ID) on delete restrict on update restrict;

alter table Rec_Gr add constraint FK_Relationship_6 foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Recruit_Info add constraint FK_·¢²¼ foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Resume add constraint FK_Relationship_2 foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

