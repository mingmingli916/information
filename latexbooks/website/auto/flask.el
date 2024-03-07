(TeX-add-style-hook
 "flask"
 (lambda ()
   (LaTeX-add-labels
    "cha:deploy"
    "sec:gunicorn"
    "sec:install-gunicorn"
    "sec:application"
    "sec:start-gunicorn"
    "sec:build-gunic-serv"
    "sec:nginx"
    "sec:install-nginx"
    "sec:config"
    "sec:ssl"))
 :latex)

