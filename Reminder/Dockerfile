FROM tarantool/tarantool:2.2
COPY . /opt/tarantool

EXPOSE 3000
CMD ["tarantool", "/opt/tarantool/init.lua"]

# docker build -t jdkz/tarantool_reminder:v1 .
# docker run --name  tarantoolreminder  -p3000:3000 tarantool_reminder