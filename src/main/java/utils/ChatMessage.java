package utils;

/**
 * @author tsamo
 */
public class ChatMessage {
    private MessageType messageType;
    private String message;
    private int senderid;
    private String timeSent;

    public int getSenderid() {
        return senderid;
    }

    public void setSenderid(int senderid) {
        this.senderid = senderid;
    }

    public String getTimeSent() {
        return timeSent;
    }

    public void setTimeSent(String timeSent) {
        this.timeSent = timeSent;
    }

    public void setMessageType(MessageType v) { this.messageType = v; }
    public MessageType getMessageType() { return messageType; }
    public void setMessage(String v) { this.message = v; }
    public String getMessage() { return this.message; }
}
