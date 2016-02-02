
use galaxia;

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
#             init des tables
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------

insert into `user` 
 (pseudo, username, email, password, grade, blocked, registerDate, lastVisitDate, nbCandidates, nbConnexions) 
 values ('admin','sndadmin','discovery.ccf1@gmail.com','79EBE7D403E9F1AB9EB1E7629AA7DE',5,false,'2014/02/01 10:20:00','2014/02/03 10:23:04',0,1);

insert into `user` 
 (pseudo, username, email, password, grade, blocked, registerDate, lastVisitDate, nbCandidates, nbConnexions) 
 values ('user1','user1','user1@iris.com','24C9E15E52AFC47C225B757E7BEE1F9D',5,false,'2014/02/03 15:12:00','2014/02/03 15:12:56',0,1);

insert into `user` 
 (pseudo, username, email, password, grade, blocked, registerDate, lastVisitDate, nbCandidates, nbConnexions) 
 values ('user2','user2','user2@iris.com','7E58D63B60197CEB55A1C487989A3720',1,false,'2014/02/05 11:11:00','2014/02/05 11:13:56',0,1);

insert into `user` 
 (pseudo, username, email, password, grade, blocked, registerDate, lastVisitDate, nbCandidates, nbConnexions) 
 values ('user3','user3','user3@iris.com','92877AF7A45FD6A2ED7FE81E1236B78',3,true,'2014/02/08 17:13:00','2014/02/08 17:15:56',0,1);

