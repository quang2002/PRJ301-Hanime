/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package websocket;

import jakarta.websocket.EncodeException;
import jakarta.websocket.Encoder;
import org.json.JSONObject;

/**
 *
 * @author yuyu2
 */
public class JSONEncoder implements Encoder.Text<JSONObject> {

    @Override
    public String encode(JSONObject json) throws EncodeException {
        return json.toString();
    }
}
