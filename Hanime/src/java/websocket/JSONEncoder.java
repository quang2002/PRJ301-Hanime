package websocket;

import jakarta.websocket.EncodeException;
import jakarta.websocket.Encoder;
import org.json.JSONObject;

public class JSONEncoder implements Encoder.Text<JSONObject> {

    @Override
    public String encode(JSONObject json) throws EncodeException {
        return json.toString();
    }
}
