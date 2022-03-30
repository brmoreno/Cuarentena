import javax.sound.sampled.*;
import java.io.*;
float valsL[]; 
float valsR[]; 
byte[] pcm_data;
int tins = 2;

void setup(){

  valsL = new float[tins*44100];
  valsR = new float[tins*44100];
  pcm_data = new byte[4 * tins*44100];
  for(int i = 0; i<tins*44100;i++){
    valsL[i] = sin(i);
    valsR[i] = sin(i);
    int auxL = floor(32767 * valsL[i]);
    int auxR = floor(32767 * valsR[i]);
    pcm_data[i * 4] = byte(auxL);
    pcm_data[(i* 4) + 1] = (byte)((int) auxL >> 8);
    pcm_data[(i* 4) + 2] = byte(auxR);
    pcm_data[(i* 4) + 3] = (byte)((int) auxR >> 8);
  }
  println("done");
  AudioFormat frmt = new AudioFormat(44100, 16, 2, true, false);
  AudioInputStream ais = new AudioInputStream( 
    new ByteArrayInputStream(pcm_data), 
    frmt, 
    pcm_data.length / frmt.getFrameSize()
  );
  
  try {
    AudioSystem.write(ais, AudioFileFormat.Type.WAVE, new
      File(dataPath("") + "audio1.wav")
    );
  } 
  catch(Exception e) {
    e.printStackTrace();
  }  
  exit();
}

void draw(){
}
