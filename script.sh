
#!/bin/bash

# Instalar wget si no está instalado
sudo yum install -y wget

# Descargar el archivo node_exporter
sudo wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz

# Descomprimir el archivo
sudo tar -xvf node_exporter-1.7.0.linux-amd64.tar.gz

# Mover el binario a /usr/local/bin/
sudo mv node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin/

# Crear el usuario node_exporter
sudo useradd -rs /bin/false node_exporter

# Crear y editar el archivo de servicio systemd con nano
sudo tee /etc/systemd/system/node_exporter.service > /dev/null <<EOT
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOT

# Iniciar y habilitar el servicio
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
sudo systemctl daemon-reload

