# syntax=docker/dockerfile:1

FROM python:2
# https://stackoverflow.com/a/55550762/3074866

# RUN git clone https://github.com/pyinstaller/pyinstaller \
#     cd pyinstaller/bootloader \ 
#     python ./waf distclean all \
#     cd ../PyInstaller/bootloader/ \
#     file Linux-32bit-arm/run 
# RUN pip install pyinstaller
RUN pip install -r requirements.txt
WORKDIR /app
COPY . .
RUN pyinstaller --onefile --distpath ./bin main.py; \
    file bin/main
CMD [ "python", "./main.py"]


FROM alpine:latest  
WORKDIR /root/
COPY --from=0 /app/bin/main .
CMD ["./main"]  
