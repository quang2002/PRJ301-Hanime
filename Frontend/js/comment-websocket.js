class CommentWebSocket extends WebSocket {
    constructor(url, video_id, user_id) {
        super(url);
        this.video_id = video_id;
        this.user_id = user_id;
    }

    post(content) {
        this.send(JSON.stringify(
            {
                action: 'post',
                video_id: this.video_id,
                user_id: this.user_id,
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