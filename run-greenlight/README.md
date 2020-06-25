# How to run greenlight with adaptations locally

* Create a GitHub access token that has at least read access to GitHub packages: https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line

* Set env vars: GITHUB_TOKEN, GITHUB_USER

* Adapt .env file in this directory with the right endpoint and secrets (first three entries)

* Possible other adaptations to .env file to configure greenlight

* sudo echo "127.0.0.1 greenlight.local" >> /etc/hosts 

* Run ./run-greenlight.sh

* Create an admin if needed: ```docker exec greenlight bundle exec rake admin:create```

* Point your web browser to http://greenlight.local:5000/b
