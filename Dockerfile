FROM python:3.10

ENV APP_HOME /app
WORKDIR $APP_HOME

# Removes output stream buffering, allowing for more efficient logging
ENV PYTHONUNBUFFERED 1

# Install dependencies
RUN pip install pip --upgrade
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy local code to the container image.
COPY jupyter_notebook_config.py /.jupyter/jupyter_notebook_config.py
COPY . .



CMD jupyter notebook
# CMD jupyter notebook --allow-root --no-browser --ip 0.0.0.0 --port 8888
