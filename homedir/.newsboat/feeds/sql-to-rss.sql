select replace(
         to_char(
           date_trunc('minute', created_at),
                 'YYYY-MM-DD T HH24:MM:SS Z'),
                 ' ','')              as dt,
       logs.window                    as win,
       string_agg(
         regexp_replace(-- delete **SomeText**
           regexp_replace(-- delete discord emojis
             substr(message, 1+strpos(message, '>')),
             ':.+: <https://cdn.discordapp.com/emojis/.+.png>',
             ''),
             '\*\*.+\*\*',
             ''),
         '<br/>' order by created_at) as msg
  from logs
 where logs.window in ('#avisos-laborales-deployar',
                       '#bolsa-de-trabajo-infochicas',
                       '#dev-ofertas',
                       '#job-search-ekoparty',
                       '#ofertas-senior-leader',
                       '#ofertas-semi-senior',
                       '#ofertas-trainee',
                       '#ofertas-junior')
   and created_at > current_date - interval '7 days'
 group by dt, win
 order by dt desc
 limit 20;
