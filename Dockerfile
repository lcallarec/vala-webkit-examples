FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get install -y make valac libwebkitgtk-dev libwebkit2gtk-4.0-dev