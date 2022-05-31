import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
AccelerometerListener listener;


void setup() {
  fullScreen();
  orientation(PORTRAIT);
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  
  textFont(createFont("SansSerif", 30 * displayDensity));
}

void draw() {
  background(0);
  text("X: " + listener.x + "\nY: " + listener.y + "\nZ: " + listener.z, 0, 0, width, height);
}

class AccelerometerListener implements SensorEventListener {
  float x;
  float y;
  float z;
  
  AccelerometerListener(){
  }
  public void onSensorChanged(SensorEvent event) {
    x = event.values[0];
    y = event.values[1];
    z = event.values[2];    
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}

public void onResume() {
  super.onResume();
  if (manager != null) {
    manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME);
  }
}

public void onPause() {
  super.onPause();
  if (manager != null) {
    manager.unregisterListener(listener);
  }
}
