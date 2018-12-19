package utils;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import model.MessageEntity;
import model.RegisterEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.Map;

/**
 * @author tsamo
 */
@Service
@ServerEndpoint(value = "/chat",configurator=HttpSessionConfigurator.class)
public class WebSocketEndpoint {

    private EndpointConfig config;

    DBUtils db=new DBUtils();
    private Room room = Room.getRoom();

    @OnOpen
    public void open(final Session session, EndpointConfig config) {
        this.config = config;
    }

    @OnMessage
    public void onMessage(final Session session, final String messageJson) {
        HttpSession httpSession = (HttpSession) config.getUserProperties().get("httpSession");
        ObjectMapper mapper = new ObjectMapper();
        MessageEntity chatMessage = new MessageEntity();
        int user1ID=(int)httpSession.getAttribute("user1ID");
        int user2ID=(int)httpSession.getAttribute("user2ID");
        int serviceID=(int)httpSession.getAttribute("serviceID");
        try {
            chatMessage = mapper.readValue(messageJson, MessageEntity.class);
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            String message = "Badly formatted message";
            try {
                session.close(new CloseReason(CloseReason.CloseCodes.CANNOT_ACCEPT, message));
            } catch (IOException ex) {
                ex.printStackTrace(); }
        }

        Map<String, Object> properties = session.getUserProperties();
        if (chatMessage.getMessageType() == MessageType.LOGIN) {
            String name = chatMessage.getData();
            properties.put("name", name);
            room.join(session);
            room.sendMessage(name + " - Joined the chat room");
        }
        else {
            String name = (String)properties.get("name");
            chatMessage.getData();
            room.join(session);
            room.sendMessage(chatMessage.getData());
            chatMessage.setServiceId(serviceID);
            chatMessage.setTimeSent(Timestamp.from(Instant.now()));
            RegisterEntity r=(RegisterEntity)httpSession.getAttribute("user");
            if(r.getUserEntity().getId()==user1ID){
                chatMessage.setSenderId(user1ID);
                chatMessage.setReceiverId(user2ID);
            }else{
                chatMessage.setSenderId(user2ID);
                chatMessage.setReceiverId(user1ID);
            }
            db.insertIntoDB(chatMessage);
//            m.insertMessageQuery(chatMessage);
        }
    }

    @OnClose
    public void onClose(Session session, CloseReason reason) {
        room.leave(session);
        room.sendMessage((String)session.getUserProperties().get("name") + " - Left the room");
    }

    @OnError
    public void onError(Session session, Throwable ex) {
        ex.printStackTrace();
    }

}
