DBG=--gst-debug=3
SRC="v4l2src device=/dev/video0"
SRC_RAW=video/x-raw,format=UYVY,width=800,height=600,framerate=10/1
CEDAR="videoconvert ! cedar_h264enc bitrate=2000 qp=15 keyint=10"
RTPH="rtph264pay name=pay0 pt=96"
test-launch ${DBG} "( ${SRC} ! ${SRC_RAW} ! ${CEDAR} ! ${RTPH} )" &
