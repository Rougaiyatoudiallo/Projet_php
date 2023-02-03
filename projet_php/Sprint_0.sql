/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  23/01/2023 13:58:19                      */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_STUDENT_ASSOCIATI_ROOM') then
    alter table STUDENT
       delete foreign key FK_STUDENT_ASSOCIATI_ROOM
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ADMIN_PK'
     and t.table_name='ADMIN'
) then
   drop index ADMIN.ADMIN_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ADMIN'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ADMIN
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ROOM_PK'
     and t.table_name='ROOM'
) then
   drop index ROOM.ROOM_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='ROOM'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table ROOM
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='ASSOCIATION_1_FK'
     and t.table_name='STUDENT'
) then
   drop index STUDENT.ASSOCIATION_1_FK
end if;

if exists(
   select 1 from sys.sysindex i, sys.systable t
   where i.table_id=t.table_id 
     and i.index_name='STUDENT_PK'
     and t.table_name='STUDENT'
) then
   drop index STUDENT.STUDENT_PK
end if;

if exists(
   select 1 from sys.systable 
   where table_name='STUDENT'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table STUDENT
end if;

/*==============================================================*/
/* Table : ADMIN                                                */
/*==============================================================*/
create table ADMIN 
(
   IDA                  integer                        not null,
   NOM                  varchar(50)                    not null,
   PRENOM               varchar(50)                    not null,
   MAIL                 varchar(50)                    not null,
   ADRESSE              varchar(50)                    not null,
   constraint PK_ADMIN primary key (IDA)
);

/*==============================================================*/
/* Index : ADMIN_PK                                             */
/*==============================================================*/
create unique index ADMIN_PK on ADMIN (
IDA ASC
);

/*==============================================================*/
/* Table : ROOM                                                 */
/*==============================================================*/
create table ROOM 
(
   IDR                  integer                        not null,
   NBRE_LITS            integer                        not null,
   BATIMENT             varchar(50)                    not null,
   constraint PK_ROOM primary key (IDR)
);

/*==============================================================*/
/* Index : ROOM_PK                                              */
/*==============================================================*/
create unique index ROOM_PK on ROOM (
IDR ASC
);

/*==============================================================*/
/* Table : STUDENT                                              */
/*==============================================================*/
create table STUDENT 
(
   IDE                  integer                        not null,
   IDR                  integer                        null,
   NOM                  varchar(50)                    not null,
   PRENOM               varchar(50)                    not null,
   MAIL                 varchar(50)                    not null,
   ADRESE               varchar(50)                    not null,
   constraint PK_STUDENT primary key (IDE)
);

/*==============================================================*/
/* Index : STUDENT_PK                                           */
/*==============================================================*/
create unique index STUDENT_PK on STUDENT (
IDE ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create index ASSOCIATION_1_FK on STUDENT (
IDR ASC
);

alter table STUDENT
   add constraint FK_STUDENT_ASSOCIATI_ROOM foreign key (IDR)
      references ROOM (IDR)
      on update restrict
      on delete restrict;

