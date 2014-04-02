

# Rails R, written in Bash by Bilawal Hameed.
# Contribute: https://github.com/bih/rails-r
# Released under the MIT license.

function r()
{
    # Reset everything
    INPUTCMD=""

    # Shortcuts
    if [ "$1" == "con" ]; then INPUTCMD="app/controllers"$2; fi;
    if [ "$1" == "mod" ]; then INPUTCMD="app/models"$2; fi;
    if [ "$1" == "view" ]; then INPUTCMD="app/views"$2; fi;
    if [ "$1" == "views" ]; then INPUTCMD="app/views"$2; fi;
    if [ "$1" == "help" ]; then INPUTCMD="app/helpers"$2; fi;
    if [ "$1" == "css" ]; then INPUTCMD="app/assets/stylesheets"$2; fi;
    if [ "$1" == "js" ]; then INPUTCMD="app/assets/javascripts"$2; fi;
    if [ "$1" == "img" ]; then INPUTCMD="app/assets/images"$2; fi;
    if [ "$1" == "public" ]; then INPUTCMD="public"$2; fi; # Saves only one character, but yolo.
    if [ "$1" == "gems" ]; then INPUTCMD="Gemfile"; fi;
    if [ "$1" == "readme" ]; then INPUTCMD="README*"; fi;
    if [ "$1" == "env" ]; then INPUTCMD="config/environments"$2; fi;
    if [ "$1" == "initial" ]; then INPUTCMD="config/initializers"$2; fi;
    if [ "$1" == "db" ]; then INPUTCMD="db"$2; fi;
    if [ "$1" == "route" ]; then INPUTCMD="config/routes.rb"; fi;
    if [ "$1" == "routes" ]; then INPUTCMD="config/routes.rb"; fi;
    if [ "$1" == "test" ]; then INPUTCMD="test"$2; fi;
    if [ "$1" == "rake" ]; then INPUTCMD="Rakefile"; fi;

    if [ "$1" == "pre" ]; then
        bundle exec rake assets:precompile;
        return;
    fi;

    if [ "$1" == "-pre" ]; then
        bundle exec rake assets:clean;
        bundle exec rake assets:precompile;
        return;
    fi;

    if [ "$1" == "mig" ]; then
        bundle exec rake db:migrate;
        return;
    fi;

    # No shortcuts? Go back to normality.
    if [ "$INPUTCMD" == "" ]; then
        INPUTCMD=$1
    fi;

    if [ -z $INPUTCMD ] || [ "$INPUTCMD" == "" ]; then # B
        return; # Empty file
    else
        if [ "$INPUTCMD" == "/" ] && [ "$(git rev-parse --show-cdup)" != "" ]; then # C
            cd $(git rev-parse --show-cdup); # Take me back to the root of the project.
        else
            if [ -d ./$INPUTCMD ]; then # D
                cd ./$INPUTCMD; # Folder exists? Take me there.
            else
                if [ -d "$(git rev-parse --show-cdup)$INPUTCMD" ]; then # E
                    cd "$(git rev-parse --show-cdup)$INPUTCMD"; # Folder exists at root level of Git repo? I like that.
                else
                    if [ -e ./$INPUTCMD ]; then #F
                        FILE=./$INPUTCMD; # File exists at relative path? I like this.
                    else
                        if [ -e $(git rev-parse --show-cdup)"$INPUTCMD" ]; then # G
                            FILE=$(git rev-parse --show-cdup)$INPUTCMD; # File exists at root path? Take me there.
                        fi; #/G
                    fi; # /F
                fi; # /E

                if [ ! -z "$FILE" ]; then
                    if [ "$(type -t subl)" == "file" ]; then # A
                        subl "$FILE" # Sublime, hell yeah
                    elif [ "$(type -t atom)" == "file" ]; then
                        atom "$FILE" # Atom support, you say?
                    else
                        vim "$FILE" # vim rocks!
                    fi; # /A
                fi;

            fi; # /D
        fi; # /C
    fi; # /B
}
