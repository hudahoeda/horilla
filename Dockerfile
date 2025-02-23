FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y libcairo2-dev gcc

WORKDIR /app/

COPY . .

# Convert line endings and ensure script is executable
RUN sed -i 's/\r$//' /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

RUN pip install -r requirements.txt

EXPOSE 8000

# Change the default CMD to use the entrypoint script
CMD ["/app/entrypoint.sh"]
