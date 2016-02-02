# ---------------------------------------------------------------------
#    crée le user local pour l'accés du serveur à la BD
# ---------------------------------------------------------------------

use galaxia;

# drop user sndiscovery@localhost;
create user sndiscovery@localhost identified by 'discoNovae31';
grant  select on galaxia.actu to sndiscovery@localhost identified by 'discoNovae31';
grant  select on galaxia.galaxie to sndiscovery@localhost identified by 'discoNovae31';
grant  select on galaxia.image to sndiscovery@localhost identified by 'discoNovae31';
grant  select,insert,update,delete on galaxia.user to sndiscovery@localhost identified by 'discoNovae31';
grant  select,insert,update,delete on galaxia.candidate to sndiscovery@localhost identified by 'discoNovae31';
