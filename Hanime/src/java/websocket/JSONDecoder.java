/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package websocket;

import jakarta.websocket.DecodeException;
import jakarta.websocket.Decoder;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author yuyu2
 */
public class JSONDecoder implements Decoder.Text<JSONObject> {

    @Override
    public JSONObject decode(String string) throws DecodeException {
        try {
            return new JSONObject(string);
        } catch (JSONException e) {
            return null;
        }
    }

    @Override
    public boolean willDecode(String string) {
        return string != null;
    }
}
