# syntax=docker/dockerfile:1

FROM python:3

# https://stackoverflow.com/a/55550762/3074866

# RUN git clone https://github.com/pyinstaller/pyinstaller \
#     cd pyinstaller/bootloader \ 
#     python ./waf distclean all \
#     cd ../PyInstaller/bootloader/ \
#     file Linux-32bit-arm/run 
RUN pip install pip==18.1; \
    pip --version ;\
    pip install pyinstaller

WORKDIR /app
COPY . .
RUN pyinstaller --onefile --distpath ./bin main.py; \
    file bin/main
CMD [ "python", "./main.py"]
