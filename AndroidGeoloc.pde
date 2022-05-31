import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.Manifest;

LocationManager locationManager;
MyLocationListener locationListener;



boolean hasLocation = false;

void setup () {
  fullScreen();
  orientation(PORTRAIT);  
  textFont(createFont("SansSerif", 26 * displayDensity));
  textAlign(CENTER, CENTER);
  requestPermission("android.permission.ACCESS_FINE_LOCATION", "initLocation");

}

void draw() {
  background(0);
  if (hasPermission("android.permission.ACCESS_FINE_LOCATION")) {
    if(hasLocation){
    text("Latitud: " + locationListener.latitud + "\n" +
         "Longitude: " + locationListener.longitud + "\n" +
         "Precision: " + locationListener.precision, 0, 0, width, height);
    }
  } else {
    text("sin permiso", 0, 0, width, height);
  }
}

void initLocation(boolean granted) {
  if (granted) {    
    Context context = getContext();
    locationListener = new MyLocationListener();
    locationManager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);    
    locationManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, 0, 0, locationListener);
    hasLocation = true;
  } else {
    hasLocation = false;
  }
}



class MyLocationListener implements LocationListener {
  float latitud;
  float longitud;
  float precision;
  MyLocationListener(){
    latitud = 0;
    longitud = 0;
    precision = 0;
  }
  public void onLocationChanged(Location location) {
    latitud  = (float)location.getLatitude();
    longitud = (float)location.getLongitude();
    precision  = (float)location.getAccuracy();
  }
  public void onStatusChanged (String provider, int status, Bundle extras) {
  }
  
  
}
