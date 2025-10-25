FROM python:3.12-slim
# A new folder named "app" is created INSIDE the image next to other base folders that are coming from the base python linux image
WORKDIR /app
# Copies everything from the folder specified during a build command (In this case: temp_flask_app)
COPY . /app
#RUN pip install flask
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
