-- Vérifie que la colonne `staff_id` ne contient pas de valeurs interdites, en l'occurence d'employé sorti de l'entreprise
select *
from {{ ref('stg_staffs') }}
where staff_id in ('Antoine Dupont', 'Thomas Ramos')
