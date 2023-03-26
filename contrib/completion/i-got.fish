# Fish completion definition for i-got.

complete -c i-got -s V -l version -d 'print version and exit'
complete -c i-got -s h -l help -d 'print help and exit'
complete -c i-got -s i -l info -d 'print extracted information'
complete -c i-got -s u -l url -d 'print extracted information'
complete -c i-got -l json -d 'print extracted URLs in JSON format'
complete -c i-got -s n -l no-merge -d 'do not merge video parts'
complete -c i-got -l no-caption -d 'do not download captions'
complete -c i-got -s f -l force -d 'force overwrite existing files'
complete -c i-got -s F -l format -x -d 'set video format to the specified stream id'
complete -c i-got -s O -l output-filename -d 'set output filename' \
         -x -a '(__fish_complete_path (commandline -ct) "output filename")'
complete -c i-got -s o -l output-dir  -d 'set output directory' \
         -x -a '(__fish_complete_directories (commandline -ct) "output directory")'
complete -c i-got -s p -l player -x -d 'stream extracted URL to the specified player'
complete -c i-got -s c -l cookies -d 'load cookies.txt or cookies.sqlite' \
         -x -a '(__fish_complete_path (commandline -ct) "cookies.txt or cookies.sqlite")'
complete -c i-got -s x -l http-proxy -x -d 'use the specified HTTP proxy for downloading'
complete -c i-got -s y -l extractor-proxy -x -d 'use the specified HTTP proxy for extraction only'
complete -c i-got -l no-proxy -d 'do not use a proxy'
complete -c i-got -s t -l timeout -x -d 'set socket timeout'
complete -c i-got -s d -l debug -d 'show traceback and other debug info'
