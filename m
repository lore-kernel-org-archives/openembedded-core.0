Return-Path: <kirgene@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id A5131719B0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 14:52:06 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s140so107208750qke.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 06:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=wuweXDntwVsp94+kAkzK3lnpPtNhnJk3aHxlaDA7MBE=;
	b=YA2NfoLB5SIWaAyhNoleagVNkOfqi8th2YqdM4D6Xmy/QDwU0eu7Ckjjz2X3fL/kzo
	REwo8q7JNOpMNyPnWn/eDA82EJPg7m6b4tXcw2JYaOSjokv9/m1KNBGec750wZewW5bW
	pSJ16r1uuS/ARIdJ/f+OWG0oTv0sjxV9veNmucXGyyzrn+J0XTu+6vV3e2vqD4xB/tdB
	riUhWqiMy7e3ACJoxF2ayct8b44kePnTh1+SL1a4zwz7IxygmptrOd4hDLivNVkIyfYj
	0Wz2978OBAL42KbQlsfrjpVmac+SbUoNhby8+rvGGA+2IWOV+c3uOXLm5GwW+Vlxc1fJ
	GcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=wuweXDntwVsp94+kAkzK3lnpPtNhnJk3aHxlaDA7MBE=;
	b=mp5jKVcJ6PTFXYWJKaNrFW8PdrkK5wTcqGffhjFvE6LD9Jb4RkpnhamRqgtP5cnvV3
	ih6RW5f8y5Q6bokl6bDekrafBKzjNl5lnMFZzzLl4YqnKfF/5xtNcNvjtdSZMn02rNCW
	2V3R5NTqTj9v5LxYJ5QpOf4KeZ/TbE29owQAZMN9tGIj0w4tekyMVmkAresq3WJrFlx4
	6EYzXxrgsBLTqEG8b4RhPb6GEo5XLwFV+rPDlG6R/2+PlcFjsS9W2MJGvz0QIiWwHtbS
	fsi09+Oj5amnTKxW+oKn1DM5GLLtaYU7hG8XY1T4aGIsg84IR9a3KkanxAFAGPl1uogx
	HF8Q==
X-Gm-Message-State: AIkVDXJVR5EB/8Gaqaik/3TPbE5iRJ33MpwcFNeD5Ln+mNbjrF8dlBgvXZad6cn/YukQu90adkS0XJNgTV5JsA==
X-Received: by 10.55.45.129 with SMTP id t123mr16449726qkh.311.1485701527170; 
	Sun, 29 Jan 2017 06:52:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.93.65 with HTTP; Sun, 29 Jan 2017 06:52:06 -0800 (PST)
From: Yevhen Kyriukha <kirgene@gmail.com>
Date: Sun, 29 Jan 2017 16:52:06 +0200
Message-ID: <CADV-EXEFK-ATRKeQJwjt3xZKeVEu2XG8t0_0Bg=yLu6jYbJiig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Update meta-qt5 to v5.8
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Jan 2017 14:52:09 -0000
Content-Type: multipart/alternative; boundary=001a114f42fcc4f71a05473cd72d

--001a114f42fcc4f71a05473cd72d
Content-Type: text/plain; charset=UTF-8

Qt 5.8 has been released. Please update meta-qt5 accordingly.

--001a114f42fcc4f71a05473cd72d
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_default" style="font-family:arial,helvetica,sans-serif;font-size:small">Qt 5.8 has been released. Please update meta-qt5 accordingly.</div>
</div>

--001a114f42fcc4f71a05473cd72d--
