Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TkmvC-0000rl-Gy
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 03:28:42 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so61919pbb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 18:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=yts6LRMRGdKoR0MwtMQ4HE+GOz6l9RGSKqBwdfnPGiw=;
	b=Tm0DLIPqBndjwcGudgnkNml6kEmNlvhCZ48YjVje2x5c3LWqO2oHxeaXxpQespO6TD
	oM3WAUECYNKgfa/fsAySkq2uKPxsHZEt+wUnpGkWyCIESQyps4uQ4iCfrFvNviHSKwGq
	3E5jco/HkikksHvcdeyEAJeKhXcaPkItgGqVt2fyaWuTgooRD9z0rmXYJkyqt6daVyZ/
	e84tj8Y2ZhKlzCwftERMJJBCY+QTp+9aZZLpwIMHdE94+AgxvTDlRCDGQVgrQ4qZ4eu7
	g/aTV45AaOMWPwrSZAGc2xzNAMh6F/rAO7DshF8WIMRDKqJA0UQMBj+XGoQ0YvskN3ye
	bNQw==
X-Received: by 10.68.189.65 with SMTP id gg1mr1519346pbc.57.1355796840402;
	Mon, 17 Dec 2012 18:14:00 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.52.85])
	by mx.google.com with ESMTPS id oj1sm181621pbb.19.2012.12.17.18.13.55
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2012 18:13:57 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 10:12:30 +0000
Message-ID: <2362902.a2uGmdhmb4@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.4 (Linux/3.6.9-1-ARCH; KDE/4.9.4; x86_64; ; )
MIME-Version: 1.0
Subject: how to use the eclipse plugin with custom project (my own Makefile or qt project)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 02:28:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"


Hi, All!
how to use the eclipse plugin with custom project (my own Makefile or qt 
project)?
the yocto project support autotools, but I don't want to use autotools.

thanks!

Yi Qingliang
Nanjing Jilong


