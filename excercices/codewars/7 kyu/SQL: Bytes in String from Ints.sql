select
  length(id :: char)
from
  persons;

select
  length(id :: varchar)
from
  persons;

select
  length(cast(id as char))
from
  persons;

select
  length(cast(id as varchar))
from
  persons;

select
  length(number1 :: text) as octnum1,
  length(number2 :: text) as octnum2,
  length(number3 :: text) as octnum3,
  length(number4 :: text) as octnum4,
  length(number5 :: text) as octnum5
from
  numbers;