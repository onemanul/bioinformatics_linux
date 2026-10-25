# bioinformatics_linux
Homework assignments for the subject Linux. Bioinformatics, SPbU, 2026

## Домашняя работа 5

Данные: аннотация генома человека GENCODE (release 41), скачивается в директорию `data`:
https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_41/gencode.v41.basic.annotation.gff3.gz

`gencode.sh` — из файла аннотации достаёт "левые" границы генов с `gene_type=unprocessed_pseudogene`: оставляет только нужные колонки (хромосома, начало, конец, цепь, имя гена), пересчитывает координаты в зависимости от цепи (+/-) и сохраняет результат в `terminal_task/results/result.tsv`.
