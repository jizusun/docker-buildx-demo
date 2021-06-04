# syntax=docker/dockerfile:1

FROM python:2
# https://stackoverflow.com/a/55550762/3074866

# RUN git clone https://github.com/pyinstaller/pyinstaller \
#     cd pyinstaller/bootloader \ 
#     python ./waf distclean all \
#     cd ../PyInstaller/bootloader/ \
#     file Linux-32bit-arm/run 
# RUN pip install pyinstaller
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN pyinstaller --onefile --distpath ./bin main.py; \
    file bin/main
CMD [ "python", "./main.py"]


FROM debian:buster-slim
WORKDIR /app/
COPY --from=0 /app/bin/main .
CMD ["./main"]  
