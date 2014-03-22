# Rails R, written in Bash by Bilawal Hameed.
# Contribute: https://github.com/bih/rails-r
# Released under the MIT license.

function r()
{
    # Shortcuts
    if [ "$1" == "con" ]; then INPUT="app/controllers"$2; fi;
    if [ "$1" == "mod" ]; then INPUT="app/models"$2; fi;
    if [ "$1" == "view" ]; then INPUT="app/views"$2; fi;
    if [ "$1" == "views" ]; then INPUT="app/views"$2; fi;
    if [ "$1" == "help" ]; then INPUT="app/helpers"$2; fi;
    if [ "$1" == "css" ]; then INPUT="app/assets/stylesheets"$2; fi;
    if [ "$1" == "js" ]; then INPUT="app/assets/javascripts"$2; fi;
    if [ "$1" == "img" ]; then INPUT="app/assets/images"$2; fi;
    if [ "$1" == "public" ]; then INPUT="public"$2; fi; # Saves only one character, but that's time that can be used to kick some fresh Java-looking ass. /jk
    if [ "$1" == "gems" ]; then INPUT="Gemfile"; fi;
    if [ "$1" == "readme" ]; then INPUT="README*"; fi;
    if [ "$1" == "env" ]; then INPUT="config/environments"$2; fi;
    if [ "$1" == "initial" ]; then INPUT="config/initializers"$2; fi;
    if [ "$1" == "db" ]; then INPUT="db"$2; fi;
    if [ "$1" == "route" ]; then INPUT="config/routes.rb"; fi;
    if [ "$1" == "routes" ]; then INPUT="config/routes.rb"; fi;
    if [ "$1" == "test" ]; then INPUT="test"$2; fi;
    if [ "$1" == "rake" ]; then INPUT="Rakefile"; fi;

    if [ "$1" == "pre" ]; then
        bundle exec rake assets:precompile;
        exit;
    fi;

    if [ "$1" == "-pre" ]; then
        bundle exec rake assets:clean;
        bundle exec rake assets:precompile;
        exit;
    fi;

    if [ "$1" == "mig" ]; then
        bundle exec rake db:migrate;
        exit;
    fi;

    # No shortcuts? Go back to normality.
    if [ "$INPUT" == "" ]; then
        INPUT=$1
    fi;

    if [ -z $INPUT ]; then # B
        exit; # Folder doesn't exist? Return nothing.
    else
        if [ "$INPUT" == "/" ] && [ ! [$(git rev-parse --show-cdup) == ""] ]; then # C
            cd $(git rev-parse --show-cdup); # Take me back to the root of the project.
        else
            if [ -d ./$INPUT ]; then # D
                cd ./$INPUT; # Folder exists? Take me there.
            else
                if [ -d $(git rev-parse --show-cdup)"$INPUT" ]; then # E
                    cd $(git rev-parse --show-cdup)"$INPUT"; # Folder exists at root level of Git repo? I like that.
                else
                    if [ -e ./$INPUT ]; then #F
                        FILE=./$INPUT; # File exists at relative path? I like this.
                    else
                        if [ -e $(git rev-parse --show-cdup)"$INPUT" ]; then # G
                            FILE=$(git rev-parse --show-cdup)$INPUT; # File exists at root path? Take me there.
                        fi; #/G
                    fi; # /F
                fi; # /E

                if [ "$(type -t subl)" == "file" ]; then # A
                    subl "$FILE" # Sublime, hell yeah
                elif [ "$(type -t atom)" == "file" ]; then
                    atom "$FILE" # Atom support, you say?
                else
                    vim "$FILE" # vim rocks!
                fi; # /A

            fi; # /D
        fi; # /C
    fi; # /B
}