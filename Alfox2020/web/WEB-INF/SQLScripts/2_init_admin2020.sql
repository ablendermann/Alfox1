# -----------------------------------------------------------------------
#    crée les autorisation du user local pour l'accés du serveur à la BD
# -----------------------------------------------------------------------

use alfox2020;

drop user alfox2020@localhost;
create user alfox2020@localhost identified by 'alfox31';

grant  select,insert,update,delete on alfox2020.* to alfox2020@localhost identified by 'alfox31';
