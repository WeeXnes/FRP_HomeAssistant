ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache curl

# Download FRP
RUN curl -L https://github.com/fatedier/frp/releases/download/v0.60.0/frp_0.60.0_linux_amd64.tar.gz -o frp.tar.gz

# Extract the downloaded tar.gz file
RUN tar -zxvf frp.tar.gz

# Move the FRPC binary to the desired location
RUN mv frp_0.60.0_linux_amd64/frpc /usr/local/bin/

# Clean up by removing unnecessary files
RUN rm -rf frp.tar.gz frp_0.60.0_linux_amd64


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]