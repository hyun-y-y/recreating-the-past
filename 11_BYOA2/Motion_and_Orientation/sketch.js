// based on Youtube channel: designers do code 

let button;
let permissionGranted = false;
let cx, cy;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(255);
  
  cx = width/2;
  cy = height/2;
  
  if (typeof(DeviceOrientationEvent) !== 'undefined' && typeof(DeviceOrientationEvent.requestPermission) === 'function'){
    
    DeviceOrientationEvent.requestPermission()
    .catch(() => {
      let button = createButton("Click to allow access to sensors");
      button.style("font-size", "30px");
      button.center();
      button.mousePressed(requestAccess);
      throw error;
    })
    .then(() => {
      permissionGranted = true;
    })
    
  } else {
    textSize(48);
    // text("non ios 14 device", 100, 100);
    permissionGranted = true;
  }
}

function requestAccess() {
  DeviceOrientationEvent.requestPermission()
  .then(response => {
    if (response == 'granted') {
      permissionGranted = true;
    } else {
      permissionGranted = false;
    }
  })
  .catch(console.error);
  
  this.remove();
}

function draw() {
  if (!permissionGranted) return;
  
  const dx = constrain(rotationY, -3, 3);
  const dy = constrain(rotationX, -3, 3);
  cx += dx*3;
  cy += dy*3;
  cx = constrain(cx, 0, width);
  cy = constrain(cy, 0, height);
  
  fill(230);
  stroke(0);
  strokeWeight(1);
  ellipse(cx, cy, 100+mouseX/2, 100+mouseY/2);

}