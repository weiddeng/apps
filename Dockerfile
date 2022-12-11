FROM python:3.7
EXPOSE 8501
WORKDIR /app
# Docker Copy is a directive or instruction that is used in a Dockerfile to copy files or directories from local machine to the container filesystem where the source is the local path and destination is the path in the container filesystem. We can specify the destination as an absolute path or relative to the WORKDIR directive if the WORKDIR directive is defined in the Dockerfile.
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt
RUN python -m spacy download en_core_web_sm --default-timeout=900
COPY . .
CMD streamlit run app.py

