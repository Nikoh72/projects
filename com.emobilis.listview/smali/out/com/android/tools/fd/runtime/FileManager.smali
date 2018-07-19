.class public Lcom/android/tools/fd/runtime/FileManager;
.super Ljava/lang/Object;
.source "FileManager.java"


# static fields
.field public static final CLASSES_DEX_SUFFIX:Ljava/lang/String; = ".dex"

.field private static final FILE_NAME_ACTIVE:Ljava/lang/String; = "active"

.field private static final FOLDER_NAME_LEFT:Ljava/lang/String; = "left"

.field private static final FOLDER_NAME_RIGHT:Ljava/lang/String; = "right"

.field private static final RELOAD_DEX_PREFIX:Ljava/lang/String; = "reload"

.field private static final RESOURCE_FILE_NAME:Ljava/lang/String; = "resources.ap_"

.field private static final RESOURCE_FOLDER_NAME:Ljava/lang/String; = "resources"

.field static final USE_EXTRACTED_RESOURCES:Z

.field private static havePurgedTempDexFolder:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static delete(Ljava/io/File;)V
    .registers 7
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 152
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_18

    .line 154
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 155
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_18

    .line 156
    array-length v4, v2

    const/4 v3, 0x0

    :goto_e
    if-ge v3, v4, :cond_18

    aget-object v0, v2, v3

    .line 157
    .local v0, "child":Ljava/io/File;
    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->delete(Ljava/io/File;)V

    .line 156
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 163
    .end local v0    # "child":Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    :cond_18
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v1

    .line 164
    .local v1, "deleted":Z
    if-nez v1, :cond_38

    .line 165
    const-string/jumbo v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    :cond_38
    return-void
.end method

.method public static extractZip(Ljava/io/File;[B)Z
    .registers 4
    .param p0, "destination"    # Ljava/io/File;
    .param p1, "zipBytes"    # [B

    .prologue
    .line 359
    const-string/jumbo v0, "InstantRun"

    const-string/jumbo v1, ""

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    const/4 v0, 0x0

    return v0
.end method

.method public static finishUpdate(Z)V
    .registers 1
    .param p0, "wroteResources"    # Z

    .prologue
    .line 370
    if-eqz p0, :cond_5

    .line 371
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->swapFolders()V

    .line 373
    :cond_5
    return-void
.end method

.method public static getCheckSum(Ljava/io/File;)[B
    .registers 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 511
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getCheckSum(Ljava/lang/String;)[B
    .registers 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 468
    const/4 v0, 0x0

    return-object v0
.end method

.method private static getDataFolder()Ljava/io/File;
    .registers 2

    .prologue
    .line 95
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/tools/fd/runtime/Paths;->getDataDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getExternalResourceFile()Ljava/io/File;
    .registers 3

    .prologue
    .line 219
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getReadFolder()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lcom/android/tools/fd/runtime/FileManager;->getResourceFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 220
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_22

    .line 221
    const-string/jumbo v1, "InstantRun"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 222
    const-string/jumbo v1, "InstantRun"

    const-string/jumbo v2, "Cannot find external resources, not patching them in"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :cond_21
    const/4 v0, 0x0

    .line 227
    .end local v0    # "file":Ljava/io/File;
    :cond_22
    return-object v0
.end method

.method public static getFileSize(Ljava/lang/String;)J
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 453
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public static getNativeLibraryFolder()Ljava/io/File;
    .registers 3

    .prologue
    .line 114
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/android/tools/fd/runtime/AppInfo;->applicationId:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/tools/fd/runtime/Paths;->getMainApkDataDirectory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "lib"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getReadFolder()Ljava/io/File;
    .registers 3

    .prologue
    .line 122
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->leftIsActive()Z

    move-result v1

    if-eqz v1, :cond_13

    const-string/jumbo v0, "left"

    .line 123
    .local v0, "name":Ljava/lang/String;
    :goto_9
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1

    .line 122
    .end local v0    # "name":Ljava/lang/String;
    :cond_13
    const-string/jumbo v0, "right"

    goto :goto_9
.end method

.method private static getResourceFile(Ljava/io/File;)Ljava/io/File;
    .registers 3
    .param p0, "base"    # Ljava/io/File;

    .prologue
    .line 101
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "resources.ap_"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getTempDexFile()Ljava/io/File;
    .registers 15

    .prologue
    .line 234
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v1

    .line 235
    .local v1, "dataFolder":Ljava/io/File;
    invoke-static {v1}, Lcom/android/tools/fd/runtime/FileManager;->getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .line 236
    .local v2, "dexFolder":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_7b

    .line 237
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 238
    .local v0, "created":Z
    if-nez v0, :cond_30

    .line 239
    const-string/jumbo v10, "InstantRun"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Failed to create directory "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    const/4 v3, 0x0

    .line 285
    .end local v0    # "created":Z
    :cond_2f
    :goto_2f
    return-object v3

    .line 244
    .restart local v0    # "created":Z
    :cond_30
    const/4 v10, 0x1

    sput-boolean v10, Lcom/android/tools/fd/runtime/FileManager;->havePurgedTempDexFolder:Z

    .line 256
    .end local v0    # "created":Z
    :cond_33
    :goto_33
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    .line 257
    .local v5, "files":[Ljava/io/File;
    const/4 v6, -0x1

    .line 260
    .local v6, "max":I
    if-eqz v5, :cond_83

    .line 261
    array-length v11, v5

    const/4 v10, 0x0

    :goto_3c
    if-ge v10, v11, :cond_83

    aget-object v3, v5, v10

    .line 262
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    .line 263
    .local v8, "name":Ljava/lang/String;
    const-string/jumbo v12, "reload"

    invoke-virtual {v8, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_78

    const-string/jumbo v12, ".dex"

    invoke-virtual {v8, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_78

    .line 264
    const-string/jumbo v12, "reload"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    .line 265
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v13

    const-string/jumbo v14, ".dex"

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    sub-int/2addr v13, v14

    .line 264
    invoke-virtual {v8, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 267
    .local v7, "middle":Ljava/lang/String;
    :try_start_6d
    invoke-static {v7}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I
    :try_end_74
    .catch Ljava/lang/NumberFormatException; {:try_start_6d .. :try_end_74} :catch_cd

    move-result v9

    .line 268
    .local v9, "version":I
    if-le v9, v6, :cond_78

    .line 269
    move v6, v9

    .line 261
    .end local v7    # "middle":Ljava/lang/String;
    .end local v9    # "version":I
    :cond_78
    :goto_78
    add-int/lit8 v10, v10, 0x1

    goto :goto_3c

    .line 251
    .end local v3    # "file":Ljava/io/File;
    .end local v5    # "files":[Ljava/io/File;
    .end local v6    # "max":I
    .end local v8    # "name":Ljava/lang/String;
    :cond_7b
    sget-boolean v10, Lcom/android/tools/fd/runtime/FileManager;->havePurgedTempDexFolder:Z

    if-nez v10, :cond_33

    .line 252
    invoke-static {v1}, Lcom/android/tools/fd/runtime/FileManager;->purgeTempDexFiles(Ljava/io/File;)V

    goto :goto_33

    .line 277
    .restart local v5    # "files":[Ljava/io/File;
    .restart local v6    # "max":I
    :cond_83
    const-string/jumbo v10, "%s0x%04x%s"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string/jumbo v13, "reload"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    add-int/lit8 v13, v6, 0x1

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    const-string/jumbo v13, ".dex"

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 279
    .local v4, "fileName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 281
    .restart local v3    # "file":Ljava/io/File;
    const-string/jumbo v10, "InstantRun"

    const/4 v11, 0x2

    invoke-static {v10, v11}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v10

    if-eqz v10, :cond_2f

    .line 282
    const-string/jumbo v10, "InstantRun"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Writing new dex file: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2f

    .line 271
    .end local v4    # "fileName":Ljava/lang/String;
    .restart local v7    # "middle":Ljava/lang/String;
    .restart local v8    # "name":Ljava/lang/String;
    :catch_cd
    move-exception v12

    goto :goto_78
.end method

.method private static getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;
    .registers 3
    .param p0, "base"    # Ljava/io/File;

    .prologue
    .line 110
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "dex-temp"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getWriteFolder(Z)Ljava/io/File;
    .registers 7
    .param p0, "wipe"    # Z

    .prologue
    .line 139
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->leftIsActive()Z

    move-result v3

    if-eqz v3, :cond_3e

    const-string/jumbo v2, "right"

    .line 140
    .local v2, "name":Ljava/lang/String;
    :goto_9
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v3

    invoke-direct {v0, v3, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 141
    .local v0, "folder":Ljava/io/File;
    if-eqz p0, :cond_3d

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_3d

    .line 142
    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->delete(Ljava/io/File;)V

    .line 143
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 144
    .local v1, "mkdirs":Z
    if-nez v1, :cond_3d

    .line 145
    const-string/jumbo v3, "InstantRun"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to create folder "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .end local v1    # "mkdirs":Z
    :cond_3d
    return-object v0

    .line 139
    .end local v0    # "folder":Ljava/io/File;
    .end local v2    # "name":Ljava/lang/String;
    :cond_3e
    const-string/jumbo v2, "left"

    goto :goto_9
.end method

.method private static leftIsActive()Z
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 170
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v0

    .line 171
    .local v0, "folder":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v6, "active"

    invoke-direct {v3, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 172
    .local v3, "pointer":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_14

    .line 184
    :goto_13
    return v5

    .line 176
    :cond_14
    :try_start_14
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/FileReader;

    invoke-direct {v6, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_1e} :catch_33

    .line 178
    .local v4, "reader":Ljava/io/BufferedReader;
    :try_start_1e
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .line 179
    .local v2, "line":Ljava/lang/String;
    const-string/jumbo v6, "left"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_28
    .catchall {:try_start_1e .. :try_end_28} :catchall_2e

    move-result v6

    .line 181
    :try_start_29
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    move v5, v6

    .line 179
    goto :goto_13

    .line 181
    .end local v2    # "line":Ljava/lang/String;
    :catchall_2e
    move-exception v6

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    throw v6
    :try_end_33
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_33} :catch_33

    .line 183
    .end local v4    # "reader":Ljava/io/BufferedReader;
    :catch_33
    move-exception v1

    .line 184
    .local v1, "ignore":Ljava/io/IOException;
    goto :goto_13
.end method

.method public static purgeTempDexFiles(Ljava/io/File;)V
    .registers 10
    .param p0, "dataFolder"    # Ljava/io/File;

    .prologue
    .line 421
    const/4 v4, 0x1

    sput-boolean v4, Lcom/android/tools/fd/runtime/FileManager;->havePurgedTempDexFolder:Z

    .line 423
    invoke-static {p0}, Lcom/android/tools/fd/runtime/FileManager;->getTempDexFileFolder(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 424
    .local v1, "dexFolder":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_e

    .line 440
    :cond_d
    return-void

    .line 427
    :cond_e
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 428
    .local v3, "files":[Ljava/io/File;
    if-eqz v3, :cond_d

    .line 432
    array-length v5, v3

    const/4 v4, 0x0

    :goto_16
    if-ge v4, v5, :cond_d

    aget-object v2, v3, v4

    .line 433
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, ".dex"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_47

    .line 434
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v0

    .line 435
    .local v0, "deleted":Z
    if-nez v0, :cond_47

    .line 436
    const-string/jumbo v6, "InstantRun"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Could not delete temp dex file "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    .end local v0    # "deleted":Z
    :cond_47
    add-int/lit8 v4, v4, 0x1

    goto :goto_16
.end method

.method private static setLeftActive(Z)V
    .registers 9
    .param p0, "active"    # Z

    .prologue
    .line 189
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getDataFolder()Ljava/io/File;

    move-result-object v2

    .line 190
    .local v2, "folder":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v5, "active"

    invoke-direct {v3, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 191
    .local v3, "pointer":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_50

    .line 192
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v1

    .line 193
    .local v1, "deleted":Z
    if-nez v1, :cond_32

    .line 194
    const-string/jumbo v5, "InstantRun"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Failed to delete file "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    .end local v1    # "deleted":Z
    :cond_32
    :try_start_32
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v5, v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_32 .. :try_end_44} :catch_80

    .line 208
    .local v4, "writer":Ljava/io/Writer;
    if-eqz p0, :cond_77

    :try_start_46
    const-string/jumbo v5, "left"

    :goto_49
    invoke-virtual {v4, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_4c
    .catchall {:try_start_46 .. :try_end_4c} :catchall_7b

    .line 210
    :try_start_4c
    invoke-virtual {v4}, Ljava/io/Writer;->close()V
    :try_end_4f
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_4f} :catch_80

    .line 214
    .end local v4    # "writer":Ljava/io/Writer;
    :cond_4f
    :goto_4f
    return-void

    .line 196
    :cond_50
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_32

    .line 197
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 198
    .local v0, "create":Z
    if-nez v0, :cond_4f

    .line 199
    const-string/jumbo v5, "InstantRun"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Failed to create directory "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4f

    .line 208
    .end local v0    # "create":Z
    .restart local v4    # "writer":Ljava/io/Writer;
    :cond_77
    :try_start_77
    const-string/jumbo v5, "right"
    :try_end_7a
    .catchall {:try_start_77 .. :try_end_7a} :catchall_7b

    goto :goto_49

    .line 210
    :catchall_7b
    move-exception v5

    :try_start_7c
    invoke-virtual {v4}, Ljava/io/Writer;->close()V

    throw v5
    :try_end_80
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_80} :catch_80

    .line 212
    .end local v4    # "writer":Ljava/io/Writer;
    :catch_80
    move-exception v5

    goto :goto_4f
.end method

.method public static startUpdate()V
    .registers 1

    .prologue
    .line 366
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->getWriteFolder(Z)Ljava/io/File;

    .line 367
    return-void
.end method

.method public static swapFolders()V
    .registers 1

    .prologue
    .line 131
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->leftIsActive()Z

    move-result v0

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_7
    invoke-static {v0}, Lcom/android/tools/fd/runtime/FileManager;->setLeftActive(Z)V

    .line 132
    return-void

    .line 131
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static writeAaptResources(Ljava/lang/String;[B)V
    .registers 9
    .param p0, "relativePath"    # Ljava/lang/String;
    .param p1, "bytes"    # [B

    .prologue
    .line 377
    const/4 v4, 0x0

    invoke-static {v4}, Lcom/android/tools/fd/runtime/FileManager;->getWriteFolder(Z)Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Lcom/android/tools/fd/runtime/FileManager;->getResourceFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .line 378
    .local v3, "resourceFile":Ljava/io/File;
    move-object v1, v3

    .line 382
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 383
    .local v2, "folder":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_3f

    .line 384
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 385
    .local v0, "created":Z
    if-nez v0, :cond_3f

    .line 386
    const-string/jumbo v4, "InstantRun"

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 387
    const-string/jumbo v4, "InstantRun"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Cannot create local resource file directory "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    .end local v0    # "created":Z
    :cond_3e
    :goto_3e
    return-void

    .line 393
    :cond_3f
    const-string/jumbo v4, "resources.ap_"

    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4c

    .line 398
    invoke-static {v1, p1}, Lcom/android/tools/fd/runtime/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    goto :goto_3e

    .line 401
    :cond_4c
    invoke-static {v1, p1}, Lcom/android/tools/fd/runtime/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    goto :goto_3e
.end method

.method public static writeRawBytes(Ljava/io/File;[B)Z
    .registers 8
    .param p0, "destination"    # Ljava/io/File;
    .param p1, "bytes"    # [B

    .prologue
    const/4 v5, 0x1

    .line 290
    :try_start_1
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_b} :catch_1a

    .line 292
    .local v1, "output":Ljava/io/BufferedOutputStream;
    :try_start_b
    invoke-virtual {v1, p1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 293
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_11
    .catchall {:try_start_b .. :try_end_11} :catchall_15

    .line 296
    :try_start_11
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    .line 294
    return v5

    .line 296
    :catchall_15
    move-exception v2

    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V

    throw v2
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_1a} :catch_1a

    .line 298
    .end local v1    # "output":Ljava/io/BufferedOutputStream;
    :catch_1a
    move-exception v0

    .line 299
    .local v0, "ioe":Ljava/io/IOException;
    const-string/jumbo v2, "InstantRun"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Failed to write file, clean project and rebuild "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 300
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "InstantRun could not write file %1$s, clean project and rebuild "

    new-array v4, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    .line 301
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static writeTempDexFile([B)Ljava/lang/String;
    .registers 4
    .param p0, "bytes"    # [B

    .prologue
    .line 407
    invoke-static {}, Lcom/android/tools/fd/runtime/FileManager;->getTempDexFile()Ljava/io/File;

    move-result-object v0

    .line 408
    .local v0, "file":Ljava/io/File;
    if-eqz v0, :cond_e

    .line 409
    invoke-static {v0, p0}, Lcom/android/tools/fd/runtime/FileManager;->writeRawBytes(Ljava/io/File;[B)Z

    .line 410
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 414
    :goto_d
    return-object v1

    .line 412
    :cond_e
    const-string/jumbo v1, "InstantRun"

    const-string/jumbo v2, "No file to write temp dex content to"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    const/4 v1, 0x0

    goto :goto_d
.end method
