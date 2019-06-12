package clases;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utilidades {
    
    public static String formatDate(Date fecha){
        if(fecha == null){
            fecha = new Date();
        }
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy/MM/dd");
        return formatoDelTexto.format(fecha);
    }    
}
