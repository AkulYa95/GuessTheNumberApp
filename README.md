# GuessTheNumberApp

## Архитектура MVVM

MVVM была выбран, так как для использования VIPER данное приложение достаточно небольшое.
На основе данного задания хотел разобраться с data biding поэтому был выбран MVVM.

## Неточности ТЗ

В ходе разработки были возникли некоторые недопонимания в описании работы приложения:

    1) На экране загадывания числа указан Label (Round №) зачем он не понятно, он был заменен на информацию о диапазоне загаданного числа, так как информации не было о том в каком диапазоне необходимо загадывать число и является ли этот диапазон переменным, либо же константой, судя по макету диапазон является постоянным.
    
    2) Не совсем понятна логика игры, на основании макета были сделаны выводы. Загадывающий игрок загадывает число, после этого компьютер генерирует предположения, после загадывающий посредством кнопок дает подсказку о загаданном числе, дальше очередь отгадывать предоставляется игроку - человеку, который дает предположение о загаданном числе, после алгоритм предоставляет подсказку человеку, если он ошибся, и через выдержку времени, чтобы человек смог ознакомиться с подсказкой, очередь снова переходит к компьютеру ( счетчик раунда обновляется ). Если человек угадал переходим на следующий экран (You win), если же угадывает компьютер переходим на экран (You lose).
    
    3) Не сказано о необходимости проведения проверок. Проверки были проведены.
    


