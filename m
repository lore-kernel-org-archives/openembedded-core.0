Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC076013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:05:32 +0000 (UTC)
Received: by laat2 with SMTP id t2so95341375laa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=RTY7Wj1B9GIV4ofygg3pZxPOcKN/SCZvQL6zU/I13GA=;
	b=q//7qFrN4r8Q+2BR+Rf4ZfmhpgiBps+jjRWeXvSfmfhhWX6kdjzlpeOXV5LjmXJH8i
	G/6u9WQO86/PN/nN5pxtXIJ/ePttyGV/f2K7/R2JIYMA9PIdVEJB1by4WlcssKGdZNU6
	dBTo11XbWytPgDBUEEpL3O0ndAKB2NAcqYnDYtv+53wAFpftGWx5x4+DGFFY87Bfas+B
	sysYXWgr9m0j1tzmctD78h3mhOU7E+CCZnNNwnPF6Ts30cZDD8d2lw+hkPywXJQ2MCdp
	GQaMG97AyBfarG1CpehLqWml57h6IsUQ7g3PZ6HYag//liQKQb9ZFSXogaep52uRzsAD
	BT8g==
X-Received: by 10.112.65.37 with SMTP id u5mr8372796lbs.44.1431356732380; Mon,
	11 May 2015 08:05:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.27.15 with HTTP; Mon, 11 May 2015 08:05:12 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 11 May 2015 17:05:12 +0200
Message-ID: <CAPybu_1255opV3Z8s-M6_ba-dqR27UP2-_KZO04m467x8cjoDA@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: status on: gdk-pixbuf-native: add setscene dep on jpeg-nativelogin register mail settings
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
X-List-Received-Date: Mon, 11 May 2015 15:05:33 -0000
Content-Type: text/plain; charset=UTF-8

Hello

I am facing the same issue as  Shrikant Bobade.

He already propossed this patch

http://patchwork.openembedded.org/patch/77445/

That does the trick for me.

Is it going to be merged?

Thanks!

-- 
Ricardo Ribalda

