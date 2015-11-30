DIR=~rails/energyfair

ssh ef "cd $DIR && git pull origin master"
ssh ef "cd $DIR && bundle install"