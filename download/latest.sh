


# Rails R, written in Bash by Bilawal Hameed.
# Contribute: https://github.com/bih/rails-r
# Released under the MIT license.

function r()
{
    # Reset everything
    INPUTCMD=""
    FILE=""

    # Shortcuts
    if [ "$1" == "con" ]; then INPUTCMD="app/controllers"; fi;
    if [ "$1" == "mod" ]; then INPUTCMD="app/models"; fi;
    if [ "$1" == "view" ]; then INPUTCMD="app/views"; fi;
    if [ "$1" == "views" ]; then INPUTCMD="app/views"; fi;
    if [ "$1" == "help" ]; then INPUTCMD="app/helpers"; fi;
    if [ "$1" == "css" ]; then INPUTCMD="app/assets/stylesheets"; fi;
    if [ "$1" == "js" ]; then INPUTCMD="app/assets/javascripts"; fi;
    if [ "$1" == "img" ]; then INPUTCMD="app/assets/images"; fi;
    if [ "$1" == "public" ]; then INPUTCMD="public"; fi; # Saves only one character, but yolo.
    if [ "$1" == "gems" ]; then INPUTCMD="Gemfile"; fi;
    if [ "$1" == "readme" ]; then INPUTCMD="README*"; fi;
    if [ "$1" == "env" ]; then INPUTCMD="config/environments"; fi;
    if [ "$1" == "initial" ]; then INPUTCMD="config/initializers"; fi;
    if [ "$1" == "db" ]; then INPUTCMD="db"; fi;
    if [ "$1" == "route" ]; then INPUTCMD="config/routes.rb"; fi;
    if [ "$1" == "routes" ]; then INPUTCMD="config/routes.rb"; fi;
    if [ "$1" == "test" ]; then INPUTCMD="test"; fi;
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

    if [ -z "$INPUTCMD" ] || [ "$INPUTCMD" == "" ]; then # B
        return; # Empty file
    else
        if [ "$INPUTCMD" == "/" ] && [ "$(git rev-parse --show-cdup)" != "" ]; then # C
            cd "$(git rev-parse --show-cdup)"; # Take me back to the root of the project.
        else
            if [ -d "./$INPUTCMD" ]; then # D
                cd "./$INPUTCMD"; # Folder exists? Take me there.
            else
                if [ -d "$(git rev-parse --show-cdup)$INPUTCMD" ]; then # E
                    cd "$(git rev-parse --show-cdup)$INPUTCMD"; # Folder exists at root level of Git repo? I like that.
                else
                    if [ -e ./$INPUTCMD ]; then #F
                        FILE="./$INPUTCMD"; # File exists at relative path? I like this.
                    else
                        if [ -e $(git rev-parse --show-cdup)"$INPUTCMD" ]; then # G
                            FILE="$(git rev-parse --show-cdup)$INPUTCMD"; # File exists at root path? Take me there.
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
