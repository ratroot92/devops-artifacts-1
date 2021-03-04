
FROM maliksblr92/react_env:latest
RUN mkdir -p /var/www/html/epeExam
WORKDIR /var/www/html/epeExam
ENV PATH /var/www/html/epeExam/node_modules/.bin:$PATH
COPY . ./
RUN yarn 
EXPOSE 3000:3000
ENTRYPOINT yarn  run prod-dev 
#*************
# REPRODUCE
#*************
# recreate image via below commands 
# cd /home/asd/Desktop/development/PEC_ADMIN/cpdExam
#docker build  --rm=true -f "epeExam/dockerfile" -t epe_admin_fontend:latest "epeExam"