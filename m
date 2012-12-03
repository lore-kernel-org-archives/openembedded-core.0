Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TfPMW-0006yH-72
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 07:18:48 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so972487dak.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2012 22:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=ZZYxfO6hNfiLS1kf8iY6eYV8/OT9BqahygBXQhtDTCE=;
	b=Sp9wZCEfk4OuIMZoPW1aHB/lQoHNwGE4UR1RnM7HzDWtbvWNGoLy6CxaUNhkxU0VNv
	kyIFvWrBgRCNQgpJNj7dl/8fnoHmTV8+M36O4vgCv/JCsajBzskt2pt/eUMhMcYHDFH+
	ZKQuoYhThXpDWh+sHiV770W0lOYb+lVWcQDZz2GQKPmKnzFg/Ii5YOjWRSRAt98oz4la
	5cPhRxklld4kn2/3noUKI9IFQFRgZ9noJvILF9pbDB8YALCgdgri1PPzoXDIgl0cFdz7
	HdwO2shTQYxAKtovcJ7VCrFEwddIHdUeNzYGAdmz+guUSYN0LYYfJ74J66REDd2X5NPx
	JdtQ==
Received: by 10.68.134.130 with SMTP id pk2mr26473240pbb.31.1354514658594;
	Sun, 02 Dec 2012 22:04:18 -0800 (PST)
Received: from yiqingliang-pc.localnet ([180.109.155.111])
	by mx.google.com with ESMTPS id p5sm7471550paz.22.2012.12.02.22.04.16
	(version=SSLv3 cipher=OTHER); Sun, 02 Dec 2012 22:04:17 -0800 (PST)
From: niqingliang2003@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 03 Dec 2012 14:03:03 +0000
Message-ID: <3752816.NQS16Yy7Ff@yiqingliang-pc>
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
MIME-Version: 1.0
Subject: why remove yaffs2?
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
X-List-Received-Date: Mon, 03 Dec 2012 06:18:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi, All:

I have untouched oe for several months, and recently found that yaffs is 
dropped, and also in official kernel, why?


Yi qingliang
Nanjing Jilong


