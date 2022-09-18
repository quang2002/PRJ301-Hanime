class CommentWebSocket extends WebSocket {
    constructor(url, video_id, token) {
        super(url);
        this.video_id = video_id;
        this.token = token;
    }

    post(content) {
        this.send(JSON.stringify(
                {
                    action: 'post',
                    video_id: this.video_id,
                    token: this.token,
                    content: content
                }
        ));
    }

    get(page) {
        this.send(JSON.stringify(
                {
                    action: 'get',
                    video_id: this.video_id,
                    page: page
                }
        ));
    }
}