
=================================================


issue. there is no tables in db..

--

Option 1:

docker compose exec wallabag bin/console doctrine:migrations:migrate --no-interaction --env=prod

[22:56:40] albe@del-7410:/ap/dkr/732collection/red74/wallabag_810_yard/wallabag810$ docker compose exec wallabag bin/console doctrine:migrations:migrate --no-interaction --env=prod
[notice] Migrating up to Application\Migrations\Version20230613121354
[notice] Migration Application\Migrations\Version20161214094402 skipped during Execution. Reason: "It seems that you already played this migration."
[notice] Migration Application\Migrations\Version20170606155640 skipped during Execution. Reason: "It seems that you already played this migration."
[notice] Migration Application\Migrations\Version20190619093534 skipped during Execution. Reason: "Migration can only be executed safely on 'sqlite'."
[notice] finished in 2289ms, used 30M memory, 56 migrations executed, 160 sql queries

[22:58:00] albe@del-7410:/ap/dkr/732collection/red74/wallabag_810_yard/wallabag810$ 



------------

Option 2: 

add it to the command in compose.


=================================================

