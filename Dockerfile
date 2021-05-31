# syntax=docker/dockerfile:1

FROM python:2-slim

# https://stackoverflow.com/a/55550762/3074866

# RUN git clone https://github.com/pyinstaller/pyinstaller \
#     cd pyinstaller/bootloader \ 
#     python ./waf distclean all \
#     cd ../PyInstaller/bootloader/ \
#     file Linux-32bit-arm/run 

RUN   pip install pip==18.1 \
            pip install pyinstaller


WORKDIR /app
COPY . .
CMD [ "python", "./main.py"]
