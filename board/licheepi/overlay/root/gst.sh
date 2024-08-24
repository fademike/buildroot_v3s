
#TX: 
gst-launch-1.0 -v v4l2src device=/dev/video0 ! "video/x-raw,format=UYVY,width=800,height=600,framerate=10/1" ! videoconvert ! cedar_h264enc bitrate=2000 qp=15 keyint=10 ! rtph264pay pt=96 ! udpsink host=192.168.10.14 port=5600

#RX(on PC): 
#gst-launch-1.0 -v udpsrc port=5600 ! "application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, payload=(int)96" ! rtph264depay ! h264parse ! avdec_h264 ! videoconvert ! autovideosink
