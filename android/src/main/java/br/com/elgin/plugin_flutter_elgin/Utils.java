package br.com.elgin.plugin_flutter_elgin;

import java.util.HashMap;
import java.util.Map;

public class Utils {

    public static Map<String, String> convertMap(Map<String, Object> keysObjectsMap) {
        Map<String, String> keysStringsMap = new HashMap<>();
        for (String key : keysObjectsMap.keySet()) {
            if (keysObjectsMap.get(key) instanceof String) {
                keysStringsMap.put(key, (String) keysObjectsMap.get(key));
            }
        }
        return keysStringsMap;
    }

}
