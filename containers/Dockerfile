FROM python:3.10-slim

WORKDIR /code

RUN mkdir /root/.dbt

COPY profiles.yml /root/.dbt

COPY ./ /code/

ADD ./containers/requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt

EXPOSE 8081

CMD ["python"]


