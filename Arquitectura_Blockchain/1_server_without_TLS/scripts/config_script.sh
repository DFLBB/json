#!/bin/bash
clear

echo "**************************************************************************"
echo ""
echo "        _/      _/  _/_/_/_/  _/_/_/_/_/    _/_/_/    _/_/    _/      _/"
echo "       _/_/    _/  _/            _/      _/        _/    _/  _/_/    _/"
echo "      _/  _/  _/  _/_/_/        _/      _/        _/_/_/_/  _/  _/  _/"
echo "     _/    _/_/  _/            _/      _/        _/    _/  _/    _/_/"
echo "    _/      _/  _/_/_/_/      _/        _/_/_/  _/    _/  _/      _/"
echo ""
echo "**************************************************************************"

echo ""

echo "********************"
echo "Estableciendo las variables de entorno del canal"
echo "********************"

export CHANNEL_NAME=netcanchannel

echo ""
echo "********************"
echo "Creando el canal"
echo "********************"

peer channel create -o orderer.netcan.com:7050 -t 15s -c $CHANNEL_NAME -f ./channel-artifacts/channel.tx 

echo ""
echo "********************"
echo "Adhiriendo el peer FCI de Federaciones al canal"
echo "Puede tardar un poco..."
echo "********************"
sleep 60

peer channel join -b netcanchannel.block

while [ $? -eq 1 ]; 
do
     echo ""
     echo "********************"
     echo "Reintentando en 5 segundos"
     echo "********************"
     sleep 5
     peer channel join -b netcanchannel.block;
done

echo ""
echo "********************"
echo "Adhiriendo el resto de peers de ambas organizaciones al canal"
echo "********************"

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvmadrid.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/federaciones.netcan.com/users/Admin@federaciones.netcan.com/msp/ CORE_PEER_ADDRESS=rsce.federaciones.netcan.com:7051 CORE_PEER_LOCALMSPID="FederacionesMSP"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/federaciones.netcan.com/users/Admin@federaciones.netcan.com/msp/ CORE_PEER_ADDRESS=tkc.federaciones.netcan.com:7051 CORE_PEER_LOCALMSPID="FederacionesMSP"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/federaciones.netcan.com/users/Admin@federaciones.netcan.com/msp/ CORE_PEER_ADDRESS=acw.federaciones.netcan.com:7051 CORE_PEER_LOCALMSPID="FederacionesMSP"

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvandalucia.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvaragon.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvasturias.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvillesbalears.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvcanarias.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvcantabria.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvcastillayleon.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvcastillalamancha.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvcataluna.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvcomunitatvalenciana.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvextremadura.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvgalicia.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvmurcia.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvnavarra.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvpaisvasco.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp/ CORE_PEER_ADDRESS=cvlarioja.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel join -b netcanchannel.block

echo ""
echo "********************"
echo "Declarando los pares de anclaje"
echo "********************"

peer channel update -o orderer.netcan.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/FederacionesMSPanchors.tx 
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/colegiosveterinarios.netcan.com/users/Admin@colegiosveterinarios.netcan.com/msp CORE_PEER_ADDRESS=cvmadrid.colegiosveterinarios.netcan.com:7051 CORE_PEER_LOCALMSPID="ColegiosVeterinariosMSP" peer channel update -o orderer.netcan.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/ColegiosVeterinariosMSPanchors.tx 