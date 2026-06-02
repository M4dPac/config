complete -c rt -s L -l level -d 'Descend only N levels deep / Глубина обхода' -r
complete -c rt -l filelimit -d 'Do not descend dirs with more than N entries / Лимит файлов' -r
complete -c rt -s P -l pattern -d 'List only files matching pattern / Фильтр по шаблону' -r
complete -c rt -s I -l exclude -d 'Exclude files matching pattern / Исключить по шаблону' -r
complete -c rt -l sort -d 'Sort by specific criteria / Критерий сортировки' -r -f -a "name\t''
size\t''
mtime\t''
ctime\t''
version\t''
none\t''"
complete -c rt -l color -d 'When to use color / Режим цвета' -r -f -a "auto\t''
always\t''
never\t''"
complete -c rt -l timefmt -d 'Time format string / Формат даты' -r
complete -c rt -l charset -d 'Output character encoding / Кодировка' -r
complete -c rt -s o -l output -d 'Output to file / Вывод в файл' -r -F
complete -c rt -s H -l html -d 'HTML output with base URL' -r
complete -c rt -s T -l title -d 'HTML page title' -r
complete -c rt -l hintro -d 'Use custom HTML intro file' -r -F
complete -c rt -l houtro -d 'Use custom HTML outro file' -r -F
complete -c rt -l icons -d 'Show icons (default: auto) / Показывать иконки' -r -f -a "auto\t''
always\t''
never\t''"
complete -c rt -l icon-style -d 'Icon style / Стиль иконок' -r -f -a "nerd\t''
unicode\t''
ascii\t''"
complete -c rt -l permissions -d 'Permission format (posix/windows)' -r -f -a "posix\t''
windows\t''"
complete -c rt -l lang -d 'Interface language (en/ru) / Язык интерфейса' -r
complete -c rt -l threads -d 'Number of worker threads for parallel mode (default: CPU cores)' -r
complete -c rt -l queue-cap -d 'Maximum concurrent directory reads in parallel mode' -r
complete -c rt -l max-entries -d 'Maximum total entries to display (0 = unlimited)' -r
complete -c rt -l completions -d 'Generate shell completions and exit' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
complete -c rt -s a -l all -d 'Show all files including hidden / Показывать скрытые файлы'
complete -c rt -s d -l dirs-only -d 'List directories only / Только каталоги'
complete -c rt -s l -l follow -d 'Follow symbolic links / Следовать по симлинкам'
complete -c rt -s f -l full-path -d 'Print full path prefix for each file / Полный путь'
complete -c rt -s x -l one-fs -d 'Stay on current filesystem / Не выходить за пределы ФС'
complete -c rt -l noreport -d 'Omit final report / Без статистики'
complete -c rt -l matchdirs -d 'Apply patterns to directories as well / Применять к каталогам'
complete -c rt -l ignore-case -d 'Case insensitive pattern matching / Без учёта регистра'
complete -c rt -l prune -d 'Do not print empty directories / Без пустых каталогов'
complete -c rt -l no-ignore -d 'Do not respect .gitignore and .rtignore files / Не учитывать .gitignore и .rtignore'
complete -c rt -s v -l version-sort -d 'Natural sort (version sort) / Натуральная сортировка'
complete -c rt -s t -l timesort -d 'Sort by modification time / По времени изменения'
complete -c rt -s c -l ctime -d 'Sort by change time / По времени метаданных'
complete -c rt -s U -l unsorted -d 'Leave files unsorted / Без сортировки'
complete -c rt -s r -l reverse -d 'Reverse sort order / Обратный порядок'
complete -c rt -l dirsfirst -d 'List directories before files / Каталоги первыми'
complete -c rt -l filesfirst -d 'List files before directories / Файлы первыми'
complete -c rt -s i -l noindent -d 'Don\'t print indentation lines / Без отступов'
complete -c rt -s A -l ansi -d 'Use ANSI line graphics'
complete -c rt -s S -l cp437 -d 'Use CP437 line graphics'
complete -c rt -s n -l nocolor -d 'Turn colorization off / Без цвета'
complete -c rt -s C -l color-always -d 'Turn colorization on always / Цвет всегда'
complete -c rt -s s -l size -d 'Print size in bytes / Размер в байтах'
complete -c rt -s h -l human -d 'Print human readable sizes / Человекочитаемый размер'
complete -c rt -l help -d 'Print help information'
complete -c rt -l si -d 'Use SI units (powers of 1000) / Единицы СИ'
complete -c rt -s D -l date -d 'Print modification date / Дата изменения'
complete -c rt -s p -l perm -d 'Print permissions / Права доступа'
complete -c rt -s u -l uid -d 'Print file owner / Владелец'
complete -c rt -s g -l gid -d 'Print file group / Группа'
complete -c rt -l inodes -d 'Print inode number'
complete -c rt -l device -d 'Print device number'
complete -c rt -s F -l classify -d 'Append file type indicator / Индикатор типа'
complete -c rt -s q -l safe -d 'Replace non-printable chars with ?'
complete -c rt -s N -l literal -d 'Print non-printable chars as-is'
complete -c rt -l nolinks -d 'Turn off hyperlinks in HTML'
complete -c rt -s X -l xml -d 'XML output'
complete -c rt -s J -l json -d 'JSON output'
complete -c rt -l json-pretty -d 'Pretty-print JSON output (fully formatted) / Форматированный JSON'
complete -c rt -l no-icons -d 'Disable icons / Без иконок'
complete -c rt -l show-streams -d 'Show NTFS Alternate Data Streams'
complete -c rt -l show-junctions -d 'Show junction points with targets'
complete -c rt -l hide-system -d 'Hide system files even with -a'
complete -c rt -l long-paths -d 'Force long path prefix (\\\\?\\)'
complete -c rt -l parallel -d 'Enable parallel directory traversal (faster for large directories)'
complete -c rt -l streaming -d 'Streaming mode: render output during traversal without building full tree'
complete -c rt -s V -l version -d 'Print version'
complete -c rt -s L -l level -d 'Descend only N levels deep / Глубина обхода' -r
complete -c rt -l filelimit -d 'Do not descend dirs with more than N entries / Лимит файлов' -r
complete -c rt -s P -l pattern -d 'List only files matching pattern / Фильтр по шаблону' -r
complete -c rt -s I -l exclude -d 'Exclude files matching pattern / Исключить по шаблону' -r
complete -c rt -l sort -d 'Sort by specific criteria / Критерий сортировки' -r -f -a "name\t''
size\t''
mtime\t''
ctime\t''
version\t''
none\t''"
complete -c rt -l color -d 'When to use color / Режим цвета' -r -f -a "auto\t''
always\t''
never\t''"
complete -c rt -l timefmt -d 'Time format string / Формат даты' -r
complete -c rt -l charset -d 'Output character encoding / Кодировка' -r
complete -c rt -s o -l output -d 'Output to file / Вывод в файл' -r -F
complete -c rt -s H -l html -d 'HTML output with base URL' -r
complete -c rt -s T -l title -d 'HTML page title' -r
complete -c rt -l hintro -d 'Use custom HTML intro file' -r -F
complete -c rt -l houtro -d 'Use custom HTML outro file' -r -F
complete -c rt -l icons -d 'Show icons (default: auto) / Показывать иконки' -r -f -a "auto\t''
always\t''
never\t''"
complete -c rt -l icon-style -d 'Icon style / Стиль иконок' -r -f -a "nerd\t''
unicode\t''
ascii\t''"
complete -c rt -l permissions -d 'Permission format (posix/windows)' -r -f -a "posix\t''
windows\t''"
complete -c rt -l lang -d 'Interface language (en/ru) / Язык интерфейса' -r
complete -c rt -l threads -d 'Number of worker threads for parallel mode (default: CPU cores)' -r
complete -c rt -l queue-cap -d 'Maximum concurrent directory reads in parallel mode' -r
complete -c rt -l max-entries -d 'Maximum total entries to display (0 = unlimited)' -r
complete -c rt -l completions -d 'Generate shell completions and exit' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
complete -c rt -s a -l all -d 'Show all files including hidden / Показывать скрытые файлы'
complete -c rt -s d -l dirs-only -d 'List directories only / Только каталоги'
complete -c rt -s l -l follow -d 'Follow symbolic links / Следовать по симлинкам'
complete -c rt -s f -l full-path -d 'Print full path prefix for each file / Полный путь'
complete -c rt -s x -l one-fs -d 'Stay on current filesystem / Не выходить за пределы ФС'
complete -c rt -l noreport -d 'Omit final report / Без статистики'
complete -c rt -l matchdirs -d 'Apply patterns to directories as well / Применять к каталогам'
complete -c rt -l ignore-case -d 'Case insensitive pattern matching / Без учёта регистра'
complete -c rt -l prune -d 'Do not print empty directories / Без пустых каталогов'
complete -c rt -l no-ignore -d 'Do not respect .gitignore and .rtignore files / Не учитывать .gitignore и .rtignore'
complete -c rt -s v -l version-sort -d 'Natural sort (version sort) / Натуральная сортировка'
complete -c rt -s t -l timesort -d 'Sort by modification time / По времени изменения'
complete -c rt -s c -l ctime -d 'Sort by change time / По времени метаданных'
complete -c rt -s U -l unsorted -d 'Leave files unsorted / Без сортировки'
complete -c rt -s r -l reverse -d 'Reverse sort order / Обратный порядок'
complete -c rt -l dirsfirst -d 'List directories before files / Каталоги первыми'
complete -c rt -l filesfirst -d 'List files before directories / Файлы первыми'
complete -c rt -s i -l noindent -d 'Don\'t print indentation lines / Без отступов'
complete -c rt -s A -l ansi -d 'Use ANSI line graphics'
complete -c rt -s S -l cp437 -d 'Use CP437 line graphics'
complete -c rt -s n -l nocolor -d 'Turn colorization off / Без цвета'
complete -c rt -s C -l color-always -d 'Turn colorization on always / Цвет всегда'
complete -c rt -s s -l size -d 'Print size in bytes / Размер в байтах'
complete -c rt -s h -l human -d 'Print human readable sizes / Человекочитаемый размер'
complete -c rt -l help -d 'Print help information'
complete -c rt -l si -d 'Use SI units (powers of 1000) / Единицы СИ'
complete -c rt -s D -l date -d 'Print modification date / Дата изменения'
complete -c rt -s p -l perm -d 'Print permissions / Права доступа'
complete -c rt -s u -l uid -d 'Print file owner / Владелец'
complete -c rt -s g -l gid -d 'Print file group / Группа'
complete -c rt -l inodes -d 'Print inode number'
complete -c rt -l device -d 'Print device number'
complete -c rt -s F -l classify -d 'Append file type indicator / Индикатор типа'
complete -c rt -s q -l safe -d 'Replace non-printable chars with ?'
complete -c rt -s N -l literal -d 'Print non-printable chars as-is'
complete -c rt -l nolinks -d 'Turn off hyperlinks in HTML'
complete -c rt -s X -l xml -d 'XML output'
complete -c rt -s J -l json -d 'JSON output'
complete -c rt -l json-pretty -d 'Pretty-print JSON output (fully formatted) / Форматированный JSON'
complete -c rt -l no-icons -d 'Disable icons / Без иконок'
complete -c rt -l show-streams -d 'Show NTFS Alternate Data Streams'
complete -c rt -l show-junctions -d 'Show junction points with targets'
complete -c rt -l hide-system -d 'Hide system files even with -a'
complete -c rt -l long-paths -d 'Force long path prefix (\\\\?\\)'
complete -c rt -l parallel -d 'Enable parallel directory traversal (faster for large directories)'
complete -c rt -l streaming -d 'Streaming mode: render output during traversal without building full tree'
complete -c rt -s V -l version -d 'Print version'
