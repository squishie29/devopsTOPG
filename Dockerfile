FROM maven:3.8.2-jdk-8

WORKDIR /spring-app
COPY . .
RUN mvn clean install

CMD mvn spring-boot:run

FROM jupyter/scipy-notebook

RUN pip install joblib

USER root
RUN apt-get update && apt-get install -y jq

RUN mkdir model raw_data processed_data results

ENV RAW_DATA_DIR=/home/jovyan/raw_data
ENV PROCESSED_DATA_DIR=/home/jovyan//*toDo*/
ENV MODEL_DIR=/home/jovyan/model
ENV RESULTS_DIR=/home/jovyan/results
ENV RAW_DATA_FILE=heart.csv

COPY /*toDo/* ./raw_data//*toDo*/
COPY preprocessing.py ./preprocessing.py
COPY train.py .//*toDo*/
COPY test.py ./test.py
