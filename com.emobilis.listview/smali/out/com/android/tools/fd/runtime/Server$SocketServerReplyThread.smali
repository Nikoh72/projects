.class Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;
.super Ljava/lang/Thread;
.source "Server.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/tools/fd/runtime/Server;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SocketServerReplyThread"
.end annotation


# instance fields
.field private final socket:Landroid/net/LocalSocket;

.field final synthetic this$0:Lcom/android/tools/fd/runtime/Server;


# direct methods
.method constructor <init>(Lcom/android/tools/fd/runtime/Server;Landroid/net/LocalSocket;)V
    .registers 3
    .param p2, "socket"    # Landroid/net/LocalSocket;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 188
    iput-object p2, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->socket:Landroid/net/LocalSocket;

    .line 189
    return-void
.end method

.method private authenticate(Ljava/io/DataInputStream;)Z
    .registers 8
    .param p1, "input"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 366
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    .line 367
    .local v0, "token":J
    sget-wide v2, Lcom/android/tools/fd/runtime/AppInfo;->token:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_36

    .line 368
    const-string/jumbo v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Mismatched identity token from client; received "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " and expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-wide v4, Lcom/android/tools/fd/runtime/AppInfo;->token:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    invoke-static {}, Lcom/android/tools/fd/runtime/Server;->access$208()I

    .line 371
    const/4 v2, 0x0

    .line 373
    :goto_35
    return v2

    :cond_36
    const/4 v2, 0x1

    goto :goto_35
.end method

.method private handle(Ljava/io/DataInputStream;Ljava/io/DataOutputStream;)V
    .registers 20
    .param p1, "input"    # Ljava/io/DataInputStream;
    .param p2, "output"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 216
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v8

    .line 217
    .local v8, "magic":J
    const-wide/32 v14, 0x35107124

    cmp-long v14, v8, v14

    if-eqz v14, :cond_2a

    .line 218
    const-string/jumbo v14, "InstantRun"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Unrecognized header format "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    .line 219
    invoke-static {v8, v9}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 218
    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    :cond_29
    :goto_29
    return-void

    .line 222
    :cond_2a
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v13

    .line 225
    .local v13, "version":I
    const/4 v14, 0x4

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 227
    const/4 v14, 0x4

    if-eq v13, v14, :cond_8a

    .line 228
    const-string/jumbo v14, "InstantRun"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Mismatched protocol versions; app is using version 4 and tool is using version "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_29

    .line 248
    .local v7, "message":I
    :pswitch_52
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-static {v14}, Lcom/android/tools/fd/runtime/Server;->access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/content/Context;

    move-result-object v14

    invoke-static {v14}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v14

    if-eqz v14, :cond_cc

    const/4 v2, 0x1

    .line 249
    .local v2, "active":Z
    :goto_61
    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 250
    const-string/jumbo v14, "InstantRun"

    const/4 v15, 0x2

    invoke-static {v14, v15}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_8a

    .line 251
    const-string/jumbo v14, "InstantRun"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Received Ping message from the IDE; returned active = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    .end local v2    # "active":Z
    .end local v7    # "message":I
    :cond_8a
    :goto_8a
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v7

    .line 236
    .restart local v7    # "message":I
    packed-switch v7, :pswitch_data_1b2

    .line 353
    const-string/jumbo v14, "InstantRun"

    const/4 v15, 0x6

    invoke-static {v14, v15}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_29

    .line 354
    const-string/jumbo v14, "InstantRun"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Unexpected message type: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_29

    .line 238
    :pswitch_b7
    const-string/jumbo v14, "InstantRun"

    const/4 v15, 0x2

    invoke-static {v14, v15}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_29

    .line 239
    const-string/jumbo v14, "InstantRun"

    const-string/jumbo v15, "Received EOF from the IDE"

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_29

    .line 248
    :cond_cc
    const/4 v2, 0x0

    goto :goto_61

    .line 267
    :pswitch_ce
    const-string/jumbo v14, "InstantRun"

    const/4 v15, 0x6

    invoke-static {v14, v15}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_8a

    .line 268
    const-string/jumbo v14, "InstantRun"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Unexpected message type: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8a

    .line 296
    :pswitch_f3
    const-string/jumbo v14, "InstantRun"

    const/4 v15, 0x6

    invoke-static {v14, v15}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_8a

    .line 297
    const-string/jumbo v14, "InstantRun"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Unexpected message type: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8a

    .line 304
    :pswitch_119
    invoke-direct/range {p0 .. p1}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->authenticate(Ljava/io/DataInputStream;)Z

    move-result v14

    if-eqz v14, :cond_29

    .line 308
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-static {v14}, Lcom/android/tools/fd/runtime/Server;->access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/content/Context;

    move-result-object v14

    invoke-static {v14}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    .line 309
    .local v3, "activity":Landroid/app/Activity;
    if-eqz v3, :cond_8a

    .line 310
    const-string/jumbo v14, "InstantRun"

    const/4 v15, 0x2

    invoke-static {v14, v15}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_140

    .line 311
    const-string/jumbo v14, "InstantRun"

    const-string/jumbo v15, "Restarting activity per user request"

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    :cond_140
    invoke-static {v3}, Lcom/android/tools/fd/runtime/Restarter;->restartActivityOnUiThread(Landroid/app/Activity;)V

    goto/16 :goto_8a

    .line 319
    .end local v3    # "activity":Landroid/app/Activity;
    :pswitch_145
    invoke-direct/range {p0 .. p1}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->authenticate(Ljava/io/DataInputStream;)Z

    move-result v14

    if-eqz v14, :cond_29

    .line 323
    invoke-static/range {p1 .. p1}, Lcom/android/tools/fd/runtime/ApplicationPatch;->read(Ljava/io/DataInputStream;)Ljava/util/List;

    move-result-object v4

    .line 324
    .local v4, "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    if-eqz v4, :cond_8a

    .line 328
    invoke-static {v4}, Lcom/android/tools/fd/runtime/Server;->access$400(Ljava/util/List;)Z

    move-result v6

    .line 329
    .local v6, "hasResources":Z
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v12

    .line 330
    .local v12, "updateMode":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-static {v14, v4, v6, v12}, Lcom/android/tools/fd/runtime/Server;->access$500(Lcom/android/tools/fd/runtime/Server;Ljava/util/List;ZI)I

    move-result v12

    .line 332
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v10

    .line 335
    .local v10, "showToast":Z
    const/4 v14, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 337
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-static {v14, v12, v6, v10}, Lcom/android/tools/fd/runtime/Server;->access$600(Lcom/android/tools/fd/runtime/Server;IZZ)V

    goto/16 :goto_8a

    .line 342
    .end local v4    # "changes":Ljava/util/List;, "Ljava/util/List<Lcom/android/tools/fd/runtime/ApplicationPatch;>;"
    .end local v6    # "hasResources":Z
    .end local v10    # "showToast":Z
    .end local v12    # "updateMode":I
    :pswitch_174
    invoke-virtual/range {p1 .. p1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v11

    .line 343
    .local v11, "text":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->this$0:Lcom/android/tools/fd/runtime/Server;

    invoke-static {v14}, Lcom/android/tools/fd/runtime/Server;->access$300(Lcom/android/tools/fd/runtime/Server;)Landroid/content/Context;

    move-result-object v14

    invoke-static {v14}, Lcom/android/tools/fd/runtime/Restarter;->getForegroundActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    .line 344
    .local v5, "foreground":Landroid/app/Activity;
    if-eqz v5, :cond_18b

    .line 345
    invoke-static {v5, v11}, Lcom/android/tools/fd/runtime/Restarter;->showToast(Landroid/app/Activity;Ljava/lang/String;)V

    goto/16 :goto_8a

    .line 346
    :cond_18b
    const-string/jumbo v14, "InstantRun"

    const/4 v15, 0x2

    invoke-static {v14, v15}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v14

    if-eqz v14, :cond_8a

    .line 347
    const-string/jumbo v14, "InstantRun"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Couldn\'t show toast (no activity) : "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8a

    .line 236
    nop

    :pswitch_data_1b2
    .packed-switch 0x1
        :pswitch_145
        :pswitch_52
        :pswitch_ce
        :pswitch_f3
        :pswitch_119
        :pswitch_174
        :pswitch_b7
    .end packed-switch
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 194
    :try_start_0
    new-instance v1, Ljava/io/DataInputStream;

    iget-object v3, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->socket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 195
    .local v1, "input":Ljava/io/DataInputStream;
    new-instance v2, Ljava/io/DataOutputStream;

    iget-object v3, p0, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->socket:Landroid/net/LocalSocket;

    invoke-virtual {v3}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_16} :catch_28

    .line 197
    .local v2, "output":Ljava/io/DataOutputStream;
    :try_start_16
    invoke-direct {p0, v1, v2}, Lcom/android/tools/fd/runtime/Server$SocketServerReplyThread;->handle(Ljava/io/DataInputStream;Ljava/io/DataOutputStream;)V
    :try_end_19
    .catchall {:try_start_16 .. :try_end_19} :catchall_20

    .line 200
    :try_start_19
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_1c
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_3d

    .line 204
    :goto_1c
    :try_start_1c
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1f} :catch_3f

    .line 213
    .end local v1    # "input":Ljava/io/DataInputStream;
    .end local v2    # "output":Ljava/io/DataOutputStream;
    :cond_1f
    :goto_1f
    return-void

    .line 199
    .restart local v1    # "input":Ljava/io/DataInputStream;
    .restart local v2    # "output":Ljava/io/DataOutputStream;
    :catchall_20
    move-exception v3

    .line 200
    :try_start_21
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_24} :catch_41

    .line 204
    :goto_24
    :try_start_24
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_27} :catch_43

    .line 206
    :goto_27
    :try_start_27
    throw v3
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_28} :catch_28

    .line 208
    .end local v1    # "input":Ljava/io/DataInputStream;
    .end local v2    # "output":Ljava/io/DataOutputStream;
    :catch_28
    move-exception v0

    .line 209
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v3, "InstantRun"

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 210
    const-string/jumbo v3, "InstantRun"

    const-string/jumbo v4, "Fatal error receiving messages"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1f

    .line 201
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "input":Ljava/io/DataInputStream;
    .restart local v2    # "output":Ljava/io/DataOutputStream;
    :catch_3d
    move-exception v3

    goto :goto_1c

    .line 205
    :catch_3f
    move-exception v3

    goto :goto_1f

    .line 201
    :catch_41
    move-exception v4

    goto :goto_24

    .line 205
    :catch_43
    move-exception v4

    goto :goto_27
.end method
