# Redzone Lootsystem, med support til QBcore og ESX

## Hvordan gør du?

1. Placer mappen inde i din `resources` mappe, eksempelvis `resources/[HONDO ER LÆKKER]/Hondo_Redzone`.

2. Tilføj `ensure Hondo_Redzone` til din `server.cfg`. Hvis du er en af de seje personer som starter en hel mappe af gangen kan du bare skippe dette.

3. Tjek `config.lua` igennem og `fxmanifest.lua` for om det er sat korrekt op til hvad du bruger.

4. Sørg for at du har følgende ressourcer installeret:
   - `ox_lib`
   - `oxmysql`
   - `qb-core` (hvis du bruger qb-core)
   - `es_extended` (hvis du bruger ESX)
   - `ox_target`
   - `ox_inventory` 

6. Rediger følgende i din fxmanifest til at tilpasse til din server:
 Skriv "--" foran de ting du ikke bruger, fx - `-- 'qb-core',  -- For QBCore`
   ```
   dependencies {
    'ox_inventory',
    'ox_lib',
    'qb-core',  -- For QBCore
    'es_extended'  -- For ESX
