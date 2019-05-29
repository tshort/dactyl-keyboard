FROM clojure
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY project.clj /usr/src/app
RUN echo '{:user {:plugins [[lein-exec "0.3.7"]]}}' > ~/.lein/profiles.clj
RUN lein deps
COPY . /usr/src/app
CMD ["lein", "exec", "-ep", "(load-file \"src/dactyl_keyboard/dactyl.clj\")"]
