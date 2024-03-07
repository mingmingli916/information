(TeX-add-style-hook
 "deploy"
 (lambda ()
   (LaTeX-add-labels
    "cha:deploy"
    "sec:gunicorn"
    "sec:install-gunicorn"
    "sec:application"
    "sec:start-gunicorn"
    "sec:nginx"
    "sec:install-nginx"
    "sec:config"
    "sec:ssl"))
 :latex)

