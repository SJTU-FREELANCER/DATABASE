/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/9 10:07:40                            */
/*==============================================================*/


drop table if exists App_Gr;

drop table if exists App_Info;

drop table if exists Grade_Comment;

drop table if exists Rec_App;

drop table if exists Rec_Comment;

drop table if exists Rec_Gr;

drop table if exists RecruitInfo;

drop table if exists Skill;

drop table if exists User;

drop table if exists feature;

drop table if exists requirement;

/*==============================================================*/
/* Table: App_Gr                                                */
/*==============================================================*/
create table App_Gr
(
   User_ID              int not null,
   App_Avg_Grade        float,
   primary key (User_ID)
);

/*==============================================================*/
/* Table: App_Info                                              */
/*==============================================================*/
create table App_Info
(
   App_ID               int not null,
   User_ID              int not null,
   App_Salary           int,
   App_Location         varchar(60),
   App_TimeSchedule     varchar(60),
   App_Job              varchar(30),
   State                varchar(1),
   primary key (App_ID)
);

/*==============================================================*/
/* Table: Grade_Comment                                         */
/*==============================================================*/
create table Grade_Comment
(
   App_ID               int not null,
   Commenter_User_ID    int not null,
   App_Grade            int,
   App_Comment          varchar(200),
   primary key (App_ID, Commenter_User_ID)
);

/*==============================================================*/
/* Table: Rec_App                                               */
/*==============================================================*/
create table Rec_App
(
   Rec_ID               int not null,
   App_ID               int not null,
   primary key (Rec_ID, App_ID)
);

/*==============================================================*/
/* Table: Rec_Comment                                           */
/*==============================================================*/
create table Rec_Comment
(
   Rec_ID               int not null,
   Comment_User_ID      int not null,
   Rec_Grade            int,
   Comment              varchar(200),
   primary key (Rec_ID, Comment_User_ID)
);

/*==============================================================*/
/* Table: Rec_Gr                                                */
/*==============================================================*/
create table Rec_Gr
(
   User_ID              int not null,
   Rec_Avg_Grade        float,
   primary key (User_ID)
);

/*==============================================================*/
/* Table: RecruitInfo                                           */
/*==============================================================*/
create table RecruitInfo
(
   Rec_ID               int not null,
   User_ID              int not null,
   Rec_Salary           int,
   Rec_Location         varchar(80),
   Rec_TimeSchedule     varchar(80),
   Rec_Job              varchar(20),
   Rec_Enrolled         int,
   Rec_Quota            int,
   primary key (Rec_ID)
);

/*==============================================================*/
/* Table: Skill                                                 */
/*==============================================================*/
create table Skill
(
   Skill_ID             int not null,
   Certificate          varchar(50) not null,
   primary key (Skill_ID, Certificate)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   User_ID              int not null,
   UserName             varchar(25),
   Password             varchar(25),
   Phone                varchar(25),
   Email                varchar(25),
   Role                 bool,
   primary key (User_ID)
);

/*==============================================================*/
/* Table: feature                                               */
/*==============================================================*/
create table feature
(
   App_ID               int not null,
   Skill_ID             int not null,
   Certificate          varchar(50) not null,
   primary key (App_ID, Skill_ID, Certificate)
);

/*==============================================================*/
/* Table: requirement                                           */
/*==============================================================*/
create table requirement
(
   Rec_ID               int not null,
   Skill_ID             int not null,
   Certificate          varchar(50) not null,
   primary key (Rec_ID, Skill_ID, Certificate)
);

alter table App_Gr add constraint FK_Relationship_16 foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table App_Info add constraint FK_Relationship_11 foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Grade_Comment add constraint FK_Relationship_6 foreign key (App_ID)
      references App_Info (App_ID) on delete restrict on update restrict;

alter table Grade_Comment add constraint FK_招聘者评价 foreign key (Commenter_User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Rec_App add constraint FK_Relationship_10 foreign key (App_ID)
      references App_Info (App_ID) on delete restrict on update restrict;

alter table Rec_App add constraint FK_Relationship_9 foreign key (Rec_ID)
      references RecruitInfo (Rec_ID) on delete restrict on update restrict;

alter table Rec_Comment add constraint FK_Relationship_5 foreign key (Rec_ID)
      references RecruitInfo (Rec_ID) on delete restrict on update restrict;

alter table Rec_Comment add constraint FK_求职者评价 foreign key (Comment_User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table Rec_Gr add constraint FK_Relationship_14 foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table RecruitInfo add constraint FK_Relationship_12 foreign key (User_ID)
      references User (User_ID) on delete restrict on update restrict;

alter table feature add constraint FK_feature foreign key (App_ID)
      references App_Info (App_ID) on delete restrict on update restrict;

alter table feature add constraint FK_feature2 foreign key (Skill_ID, Certificate)
      references Skill (Skill_ID, Certificate) on delete restrict on update restrict;

alter table requirement add constraint FK_require foreign key (Rec_ID)
      references RecruitInfo (Rec_ID) on delete restrict on update restrict;

alter table requirement add constraint FK_require2 foreign key (Skill_ID, Certificate)
      references Skill (Skill_ID, Certificate) on delete restrict on update restrict;

